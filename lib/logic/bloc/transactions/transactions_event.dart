part of 'transactions_bloc.dart';

@freezed
class TransactionsEvent with _$TransactionsEvent {
  const factory TransactionsEvent.loadTransactions() = _LoadTransactions;
  const factory TransactionsEvent.setStartEndDate({
    required final DateTime startDate,
    required final DateTime endDate,
  }) = _SetStartEndDate;
}
