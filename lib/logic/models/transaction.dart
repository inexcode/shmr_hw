import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/logic/models/account.dart';
import 'package:shmr_hw/logic/models/category.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    required final int id,
    required final int accountId,
    required final int categoryId,
    required final Decimal amount,
    required final DateTime transactionDate,
    required final String comment,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _Transaction;

  factory Transaction.fromJson(final Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  factory Transaction.fromResponse(final TransactionResponse response) =>
      Transaction(
        id: response.id,
        accountId: response.account.id,
        categoryId: response.category.id,
        amount: response.amount,
        transactionDate: response.transactionDate,
        comment: response.comment,
        createdAt: response.createdAt,
        updatedAt: response.updatedAt,
      );
}

@freezed
abstract class TransactionRequest with _$TransactionRequest {
  const factory TransactionRequest({
    required final int accountId,
    required final int categoryId,
    required final Decimal amount,
    required final DateTime transactionDate,
    required final String comment,
  }) = _Create;

  factory TransactionRequest.fromTransaction(final Transaction transaction) =>
      TransactionRequest(
        accountId: transaction.accountId,
        categoryId: transaction.categoryId,
        amount: transaction.amount,
        transactionDate: transaction.transactionDate,
        comment: transaction.comment,
      );
}

// Only returned by API when updating a transaction.
// But when we create one, it returns Transaction.
// wut?
// We also get TransactionResponse when we fetch a history of transactions.
@freezed
abstract class TransactionResponse with _$TransactionResponse {
  const factory TransactionResponse({
    required final int id,
    required final AccountBrief account,
    required final Category category,
    required final Decimal amount,
    required final DateTime transactionDate,
    required final String comment,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _TransactionResponse;

  factory TransactionResponse.fromJson(final Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);
}
