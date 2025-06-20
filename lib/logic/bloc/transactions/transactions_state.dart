part of 'transactions_bloc.dart';

enum TransactionsStatus {
  initial,
  loading,
  loaded,
  error,
}

@freezed
abstract class TransactionsState with _$TransactionsState {
  const factory TransactionsState({
    required final TransactionsStatus status,
    required final List<Transaction> transactions,
    required final List<Transaction> transactionsToday,
    required final DateTime startDate,
    required final DateTime endDate,
    final String? errorMessage,
  }) = _TransactionsState;

  factory TransactionsState.initial() {
    final now = DateTime.now();
    return TransactionsState(
      startDate: DateTime(now.year, now.month, now.day)
          .subtract(const Duration(days: 30)),
      endDate: DateTime(now.year, now.month, now.day, 23, 59, 59),
      status: TransactionsStatus.initial,
      transactions: const [],
      transactionsToday: const [],
    );
  }
}
