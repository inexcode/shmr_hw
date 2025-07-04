part of 'transactions_bloc.dart';

@freezed
class TransactionsEvent with _$TransactionsEvent {
  const factory TransactionsEvent.loadTransactions() = LoadTransactions;
  const factory TransactionsEvent.setStartEndDate({
    required final DateTime startDate,
    required final DateTime endDate,
  }) = SetStartEndDate;
  const factory TransactionsEvent.setSortOrder({
    required final SortOrder sortOrder,
  }) = SetSortOrder;
  const factory TransactionsEvent.createTransaction({
    required final TransactionRequest transaction,
  }) = CreateTransaction;
  const factory TransactionsEvent.editTransaction({
    required final int id,
    required final TransactionRequest transaction,
  }) = EditTransaction;
  const factory TransactionsEvent.deleteTransaction({required final int id}) =
      DeleteTransaction;
}
