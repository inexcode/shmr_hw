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
      : super(
          TransactionsState.initial(),
        ) {
    on<LoadTransactions>((final event, final emit) async {
      emit(
        state.copyWith(status: TransactionsStatus.loading),
      );
      try {
        final todayTransactions = await _getTodayTransactions();
        final transactions = await _getTransactionsForDateRange(
          state.startDate,
          state.endDate,
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
      emit(
        state.copyWith(
          sortOrder: event.sortOrder,
        ),
      );
    });

    add(const LoadTransactions());
  }

  final int accountId;

  Future<List<Transaction>> _getTransactionsForDateRange(
    final DateTime startDate,
    final DateTime endDate,
  ) async =>
      (await Repositories().transactionsRepository.fetchTransactions(
                accountId: accountId,
                startDate: startDate,
                endDate: endDate,
              ))
          .map(Transaction.fromResponse)
          .toList();

  Future<List<Transaction>> _getTodayTransactions() =>
      _getTransactionsForDateRange(
        DateTime.now(),
        DateTime.now(),
      );
}
