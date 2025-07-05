import 'package:bloc/bloc.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/config/repositories.dart';
import 'package:shmr_hw/logic/models/transaction.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';
part 'transactions_bloc.freezed.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc({required this.accountId})
    : super(TransactionsState.initial()) {
    on<LoadTransactions>((final event, final emit) async {
      emit(state.copyWith(status: TransactionsStatus.loading));
      try {
        final todayTransactions = await _getTodayTransactions();
        final transactions = await _getTransactionsForDateRange(
          state.startDate,
          state.endDate,
        );
        final transactionsDelta = await _getTransactionsDeltaForLastMonth();
        emit(
          state.copyWith(
            status: TransactionsStatus.loaded,
            transactions: transactions,
            transactionsToday: todayTransactions,
            transactionsDelta: transactionsDelta,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            status: TransactionsStatus.error,
            errorMessage: e.toString(),
          ),
        );
      }
    });
    on<SetStartEndDate>((final event, final emit) async {
      final startDate = event.startDate.isAfter(event.endDate)
          ? event.endDate
          : event.startDate;
      final endDate = event.endDate.isBefore(event.startDate)
          ? event.startDate
          : event.endDate;

      emit(
        state.copyWith(
          status: TransactionsStatus.loading,
          startDate: startDate,
          endDate: endDate,
        ),
      );
      try {
        final todayTransactions = await _getTodayTransactions();
        final transactions = await _getTransactionsForDateRange(
          startDate,
          endDate,
        );
        emit(
          state.copyWith(
            status: TransactionsStatus.loaded,
            transactions: transactions,
            transactionsToday: todayTransactions,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            status: TransactionsStatus.error,
            errorMessage: e.toString(),
          ),
        );
      }
    });
    on<SetSortOrder>((final event, final emit) {
      emit(state.copyWith(sortOrder: event.sortOrder));
    });
    on<CreateTransaction>((final event, final emit) async {
      await Repositories().transactionsRepository.createTransaction(
        request: event.transaction,
      );
      add(const LoadTransactions());
    });
    on<EditTransaction>((final event, final emit) async {
      await Repositories().transactionsRepository.updateTransaction(
        id: event.id,
        request: event.transaction,
      );
      add(const LoadTransactions());
    });
    on<DeleteTransaction>((final event, final emit) async {
      await Repositories().transactionsRepository.deleteTransaction(
        id: event.id,
      );
      add(const LoadTransactions());
    });

    add(const LoadTransactions());
  }

  final int accountId;

  Future<List<Transaction>> _getTransactionsForDateRange(
    final DateTime startDate,
    final DateTime endDate,
  ) async => (await Repositories().transactionsRepository.fetchTransactions(
    accountId: accountId,
    startDate: startDate,
    endDate: endDate,
  )).map(Transaction.fromResponse).toList();

  Future<List<Transaction>> _getTodayTransactions() =>
      _getTransactionsForDateRange(DateTime.now(), DateTime.now());

  Future<List<DayTransactionsDelta>> _getTransactionsDeltaForLastMonth() {
    final today = DateTime.now();
    return _getTransactionsDelta(
      DateTime(today.year, today.month, today.day - 30),
      DateTime(today.year, today.month, today.day, 23, 59, 59),
    );
  }

  Future<List<DayTransactionsDelta>> _getTransactionsDelta(
    final DateTime startDate,
    final DateTime endDate,
  ) async {
    final transactions = await _getTransactionsForDateRange(startDate, endDate);

    final dailyDeltas = <DateTime, Decimal>{};
    var currentDate = DateTime(startDate.year, startDate.month, startDate.day);
    while (currentDate.isBefore(
      DateTime(endDate.year, endDate.month, endDate.day + 1),
    )) {
      dailyDeltas[currentDate] = Decimal.zero;
      currentDate = currentDate.add(const Duration(days: 1));
    }

    for (final transaction in transactions) {
      final date = DateTime(
        transaction.transactionDate.year,
        transaction.transactionDate.month,
        transaction.transactionDate.day,
      );

      dailyDeltas[date] = dailyDeltas[date]! + transaction.amount;
    }

    // Convert to DayTransactionsDelta objects and sort by date
    final deltas =
        dailyDeltas.entries
            .map(
              (final entry) =>
                  DayTransactionsDelta(date: entry.key, delta: entry.value),
            )
            .toList()
          ..sort((final a, final b) => a.date.compareTo(b.date));

    return deltas;
  }
}
