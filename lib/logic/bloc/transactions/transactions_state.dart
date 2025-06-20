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

  const TransactionsState._();

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

  List<Transaction> get expensesToday => transactionsToday
      .where((final transaction) => transaction.isIncome == false)
      .toList();

  Decimal get totalExpensesToday => expensesToday.fold(
        Decimal.zero,
        (final previousValue, final transaction) =>
            previousValue + transaction.amount,
      );

  List<Transaction> get incomesToday => transactionsToday
      .where((final transaction) => transaction.isIncome ?? false)
      .toList();

  Decimal get totalIncomesToday => incomesToday.fold(
        Decimal.zero,
        (final previousValue, final transaction) =>
            previousValue + transaction.amount,
      );
}
