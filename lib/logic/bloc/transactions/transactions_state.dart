part of 'transactions_bloc.dart';

enum TransactionsStatus {
  initial,
  loading,
  loaded,
  error,
}

enum SortOrder {
  dateAscending,
  dateDescending,
  amountAscending,
  amountDescending;

  String get name {
    switch (this) {
      case SortOrder.dateAscending:
        return 'sorting.date_asc';
      case SortOrder.dateDescending:
        return 'sorting.date_desc';
      case SortOrder.amountAscending:
        return 'sorting.amount_asc';
      case SortOrder.amountDescending:
        return 'sorting.amount_desc';
    }
  }
}

@freezed
abstract class TransactionsState with _$TransactionsState {
  const factory TransactionsState({
    required final TransactionsStatus status,
    required final List<Transaction> transactions,
    required final List<Transaction> transactionsToday,
    required final DateTime startDate,
    required final DateTime endDate,
    required final SortOrder sortOrder,
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
      sortOrder: SortOrder.dateDescending,
      transactions: const [],
      transactionsToday: const [],
    );
  }

  // Helper to sort transactions according to sortOrder
  List<Transaction> _sortTransactions(
    final List<Transaction> list, {
    final SortOrder? overwriteSortOrder,
  }) {
    final sorted = List<Transaction>.from(list);
    switch (overwriteSortOrder ?? sortOrder) {
      case SortOrder.dateAscending:
        sorted.sort(
          (final a, final b) => a.transactionDate.compareTo(b.transactionDate),
        );
      case SortOrder.dateDescending:
        sorted.sort(
          (final a, final b) => b.transactionDate.compareTo(a.transactionDate),
        );
      case SortOrder.amountAscending:
        sorted.sort((final a, final b) => a.amount.compareTo(b.amount));
      case SortOrder.amountDescending:
        sorted.sort((final a, final b) => b.amount.compareTo(a.amount));
    }
    return sorted;
  }

  List<Transaction> get expenses => _sortTransactions(
        transactions
            .where((final transaction) => transaction.isIncome == false)
            .toList(),
      );

  Decimal get totalExpenses => expenses.fold(
        Decimal.zero,
        (final previousValue, final transaction) =>
            previousValue + transaction.amount,
      );

  List<Transaction> get incomes => _sortTransactions(
        transactions
            .where((final transaction) => transaction.isIncome ?? false)
            .toList(),
      );

  Decimal get totalIncomes => incomes.fold(
        Decimal.zero,
        (final previousValue, final transaction) =>
            previousValue + transaction.amount,
      );

  List<Transaction> get expensesToday => _sortTransactions(
        transactionsToday
            .where((final transaction) => transaction.isIncome == false)
            .toList(),
      );

  Decimal get totalExpensesToday => expensesToday.fold(
        Decimal.zero,
        (final previousValue, final transaction) =>
            previousValue + transaction.amount,
      );

  List<Transaction> get incomesToday => _sortTransactions(
        transactionsToday
            .where((final transaction) => transaction.isIncome ?? false)
            .toList(),
      );

  Decimal get totalIncomesToday => incomesToday.fold(
        Decimal.zero,
        (final previousValue, final transaction) =>
            previousValue + transaction.amount,
      );

  List<Transaction> get groupedExpenses {
    final sortedExpenses = _sortTransactions(
      expenses,
      overwriteSortOrder: SortOrder.dateAscending,
    );
    final Map<int, Transaction> grouped = {};
    for (final transaction in sortedExpenses) {
      if (grouped.containsKey(transaction.categoryId)) {
        final existing = grouped[transaction.categoryId]!;
        grouped[transaction.categoryId] = existing.copyWith(
          amount: existing.amount + transaction.amount,
          comment: transaction.comment ?? existing.comment,
        );
      } else {
        grouped[transaction.categoryId] = transaction;
      }
    }
    return grouped.values.toList()
      ..sort(
        (final a, final b) => b.amount.compareTo(a.amount),
      );
  }

  List<Transaction> get groupedIncomes {
    final sortedIncomes = _sortTransactions(
      incomes,
      overwriteSortOrder: SortOrder.dateAscending,
    );
    final Map<int, Transaction> grouped = {};
    for (final transaction in sortedIncomes) {
      if (grouped.containsKey(transaction.categoryId)) {
        final existing = grouped[transaction.categoryId]!;
        grouped[transaction.categoryId] = existing.copyWith(
          amount: existing.amount + transaction.amount,
          comment: transaction.comment ?? existing.comment,
        );
      } else {
        grouped[transaction.categoryId] = transaction;
      }
    }
    return grouped.values.toList()
      ..sort(
        (final a, final b) => b.amount.compareTo(a.amount),
      );
  }

  List<Transaction> transactionsInCategory(
    final int categoryId,
  ) =>
      _sortTransactions(
        transactions
            .where((final transaction) => transaction.categoryId == categoryId)
            .toList(),
      );
}
