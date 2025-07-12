import 'package:bloc/bloc.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/config/repositories.dart';
import 'package:shmr_hw/logic/models/enums.dart';
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
        bool failedSync = false;
        final cachedTodayTransactions = await _getTodayTransactions();
        final cachedTransactions = await _getTransactionsForDateRange(
          state.startDate,
          state.endDate,
        );
        final cachedTransactionsDelta =
            await _getTransactionsDeltaForLastMonth();
        emit(
          state.copyWith(
            status: TransactionsStatus.loading,
            transactions: cachedTransactions,
            transactionsToday: cachedTodayTransactions,
            transactionsDelta: cachedTransactionsDelta,
            failedSync: failedSync,
          ),
        );
        try {
          failedSync = await _loadTransactionsFromCloud();
        } catch (e) {
          emit(
            state.copyWith(
              syncErrorMessage: 'Failed to sync transactions: $e',
              failedSyncFunction: FailedSyncFunction.full,
            ),
          );
          failedSync = true;
        }
        final todayTransactions = await _getTodayTransactions();
        final transactions = await _getTransactionsForDateRange(
          state.startDate,
          state.endDate,
        );
        final transactionsDelta = await _getTransactionsDeltaForLastMonth();
        emit(
          state.copyWith(
            status: TransactionsStatus.loading,
            transactions: transactions,
            transactionsToday: todayTransactions,
            transactionsDelta: transactionsDelta,
            failedSync: failedSync,
          ),
        );
        emit(
          state.copyWith(
            status: TransactionsStatus.loaded,
            transactions: transactions,
            transactionsToday: todayTransactions,
            transactionsDelta: transactionsDelta,
            failedSync: failedSync,
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
      await Repositories().localTransactionsRepository.createTransaction(
        request: event.transaction,
      );
      add(const SyncTransactions());
    });
    on<EditTransaction>((final event, final emit) async {
      await Repositories().localTransactionsRepository.updateTransaction(
        id: event.id,
        request: event.transaction,
      );
      add(const SyncTransactions());
    });
    on<DeleteTransaction>((final event, final emit) async {
      await Repositories().localTransactionsRepository.deleteTransaction(
        id: event.id,
      );
      add(const SyncTransactions());
    });
    on<SyncTransactions>((final event, final emit) async {
      emit(state.copyWith(status: TransactionsStatus.loading));
      try {
        bool failedSync = false;

        final todayTransactions = await _getTodayTransactions();
        final transactions = await _getTransactionsForDateRange(
          state.startDate,
          state.endDate,
        );
        final transactionsDelta = await _getTransactionsDeltaForLastMonth();
        emit(
          state.copyWith(
            status: TransactionsStatus.loading,
            transactions: transactions,
            transactionsToday: todayTransactions,
            transactionsDelta: transactionsDelta,
            failedSync: failedSync,
          ),
        );
        try {
          failedSync = await _handlePendingTransactionEvents();
        } catch (e) {
          failedSync = true;
          emit(
            state.copyWith(
              syncErrorMessage: 'Failed to sync transactions: $e',
              failedSyncFunction: FailedSyncFunction.transaction,
            ),
          );
        }
        emit(
          state.copyWith(
            status: TransactionsStatus.loaded,
            transactions: transactions,
            transactionsToday: todayTransactions,
            transactionsDelta: transactionsDelta,
            failedSync: failedSync,
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
    on<ClearSyncError>((final event, final emit) {
      emit(state.copyWith(syncErrorMessage: null, failedSyncFunction: null));
    });

    add(const LoadTransactions());
  }

  final int accountId;

  Future<List<Transaction>> _getTransactionsForDateRange(
    final DateTime startDate,
    final DateTime endDate,
  ) async =>
      (await Repositories().localTransactionsRepository.fetchTransactions(
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

      if (transaction.isIncome ?? true) {
        dailyDeltas[date] = dailyDeltas[date]! + transaction.amount;
      } else {
        dailyDeltas[date] = dailyDeltas[date]! - transaction.amount;
      }
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

  Future<bool> _handlePendingTransactionEvents() async {
    final pendingTransactions = await Repositories().localTransactionsRepository
        .getPendingEvents();
    for (final pendingTransaction in pendingTransactions) {
      try {
        switch (pendingTransaction.eventType) {
          case TransactionEventType.creation:
            final transaction = await Repositories().localTransactionsRepository
                .getTransaction(id: pendingTransaction.transactionId);
            await Repositories().transactionsRepository.createTransaction(
              request: TransactionRequest.fromTransaction(
                Transaction.fromResponse(transaction),
              ),
            );
          case TransactionEventType.modification:
            final transaction = await Repositories().localTransactionsRepository
                .getTransaction(id: pendingTransaction.transactionId);
            await Repositories().transactionsRepository.updateTransaction(
              id: pendingTransaction.transactionId,
              request: TransactionRequest.fromTransaction(
                Transaction.fromResponse(transaction),
              ),
            );
          case TransactionEventType.deletion:
            await Repositories().transactionsRepository.deleteTransaction(
              id: pendingTransaction.transactionId,
            );
        }
        // After successful handling, remove the pending transaction
        await Repositories().localTransactionsRepository.deleteTransactionEvent(
          eventId: pendingTransaction.id,
        );
      } catch (e) {
        throw Exception('Failed to handle pending transaction: $e');
      }
    }
    return false; // All pending transactions handled successfully
  }

  Future<bool> _loadTransactionsFromCloud() async {
    final failedSync = await _handlePendingTransactionEvents();
    if (failedSync) {
      return true;
    }
    final todayYear = DateTime.now().year;
    try {
      final yearFutures = <Future<List<Transaction>>>[];

      for (var year = todayYear; year >= 2000; year--) {
        final future = Repositories().transactionsRepository
            .fetchTransactions(
              accountId: accountId,
              startDate: DateTime(year, 1, 1),
              endDate: DateTime(year, 12, 31),
            )
            .then(
              (final yearTransactions) =>
                  yearTransactions.map(Transaction.fromResponse).toList(),
            );
        yearFutures.add(future);
      }

      final yearResults = await Future.wait(yearFutures);

      final transactions = <Transaction>[];
      yearResults.forEach(transactions.addAll);

      transactions.sort(
        (final a, final b) => a.transactionDate.compareTo(b.transactionDate),
      );

      await Repositories().localTransactionsRepository.setTransactions(
        transactions: transactions,
      );
    } catch (e) {
      throw Exception('Failed to load transactions from cloud: $e');
    }
    return false;
  }
}
