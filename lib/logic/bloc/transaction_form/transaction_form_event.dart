part of 'transaction_form_bloc.dart';

@freezed
class TransactionFormEvent with _$TransactionFormEvent {
  const factory TransactionFormEvent.setAccountId({
    required final int accountId,
  }) = SetAccountIdTransactionFormEvent;
  const factory TransactionFormEvent.setCategoryId({
    required final int categoryId,
  }) = SetCategoryIdTransactionFormEvent;
  const factory TransactionFormEvent.setAmount({
    required final Decimal? amount,
  }) = SetAmountTransactionFormEvent;
  const factory TransactionFormEvent.setDate({required final DateTime date}) =
      SetDateTransactionFormEvent;
  const factory TransactionFormEvent.setTime({required final TimeOfDay time}) =
      SetTimeTransactionFormEvent;
  const factory TransactionFormEvent.setDescription({
    required final String? description,
  }) = SetDescriptionTransactionFormEvent;
}
