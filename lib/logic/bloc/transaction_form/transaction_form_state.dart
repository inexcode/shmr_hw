part of 'transaction_form_bloc.dart';

@freezed
sealed class TransactionFormState with _$TransactionFormState {
  const TransactionFormState._();

  const factory TransactionFormState.newTransaction({
    required final int accountId,
    required final int? categoryId,
    required final Decimal? amount,
    required final DateTime? date,
    required final TimeOfDay? time,
    required final String? description,
    required final bool isIncome,
  }) = NewTransactionFormState;

  const factory TransactionFormState.editTransaction({
    required final int id,
    required final int accountId,
    required final int? categoryId,
    required final Decimal? amount,
    required final DateTime? date,
    required final TimeOfDay? time,
    required final String? description,
    required final bool isIncome,
  }) = EditTransactionFormState;

  @override
  int get accountId;
  @override
  int? get categoryId;
  @override
  Decimal? get amount;
  @override
  DateTime? get date;
  @override
  TimeOfDay? get time;
  @override
  String? get description;
  @override
  bool get isIncome;

  bool get isFilled =>
      categoryId != null &&
      (amount != null && amount! > Decimal.zero) &&
      date != null &&
      time != null;

  TransactionRequest? get transaction => isFilled
      ? TransactionRequest(
          accountId: accountId,
          categoryId: categoryId!,
          amount: amount!,
          transactionDate: DateTime(
            date!.year,
            date!.month,
            date!.day,
            time!.hour,
            time!.minute,
          ),
          comment: description,
        )
      : null;
}
