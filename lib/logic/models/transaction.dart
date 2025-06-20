import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/logic/models/account.dart';
import 'package:shmr_hw/logic/models/category.dart';
import 'package:shmr_hw/logic/models/rest_api_dto/transaction.dart';

part 'transaction.freezed.dart';

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    required final int id,
    required final int accountId,
    required final int categoryId,
    required final Decimal amount,
    required final DateTime transactionDate,
    required final String? comment,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _Transaction;

  factory Transaction.fromDto(final TransactionDto dto) => Transaction(
        id: dto.id,
        accountId: dto.accountId,
        categoryId: dto.categoryId,
        amount: dto.amount,
        transactionDate: dto.transactionDate,
        comment: dto.comment,
        createdAt: dto.createdAt,
        updatedAt: dto.updatedAt,
      );

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
    required final String? comment,
  }) = _TransactionRequest;

  factory TransactionRequest.fromTransaction(final Transaction transaction) =>
      TransactionRequest(
        accountId: transaction.accountId,
        categoryId: transaction.categoryId,
        amount: transaction.amount,
        transactionDate: transaction.transactionDate,
        comment: transaction.comment,
      );

  TransactionRequestDto toDto() => TransactionRequestDto(
        accountId: accountId,
        categoryId: categoryId,
        amount: amount,
        transactionDate: transactionDate,
        comment: comment,
      );
}

@freezed
abstract class TransactionResponse with _$TransactionResponse {
  const factory TransactionResponse({
    required final int id,
    required final AccountState account,
    required final Category category,
    required final Decimal amount,
    required final DateTime transactionDate,
    required final String? comment,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _TransactionResponse;

  factory TransactionResponse.fromDto(final TransactionResponseDto dto) =>
      TransactionResponse(
        id: dto.id,
        account: AccountState.fromDto(dto.account),
        category: Category.fromDto(dto.category),
        amount: dto.amount,
        transactionDate: dto.transactionDate,
        comment: dto.comment,
        createdAt: dto.createdAt,
        updatedAt: dto.updatedAt,
      );
}
