import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/logic/models/rest_api_dto/account.dart';
import 'package:shmr_hw/logic/models/rest_api_dto/category.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
abstract class TransactionDto with _$TransactionDto {
  const factory TransactionDto({
    required final int id,
    required final int accountId,
    required final int categoryId,
    required final Decimal amount,
    required final DateTime transactionDate,
    required final String? comment,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _TransactionDto;

  factory TransactionDto.fromJson(final Map<String, dynamic> json) =>
      _$TransactionDtoFromJson(json);
}

@freezed
abstract class TransactionRequestDto with _$TransactionRequestDto {
  const factory TransactionRequestDto({
    required final int accountId,
    required final int categoryId,
    required final Decimal amount,
    required final DateTime transactionDate,
    required final String? comment,
  }) = _TransactionRequestDto;

  factory TransactionRequestDto.fromJson(final Map<String, dynamic> json) =>
      _$TransactionRequestDtoFromJson(json);
}

// Only returned by API when updating a transaction.
// But when we create one, it returns TransactionDto.
// wut?
// We also get TransactionDtoResponse when we fetch a history of transactions.
@freezed
abstract class TransactionResponseDto with _$TransactionResponseDto {
  const factory TransactionResponseDto({
    required final int id,
    required final AccountBriefDto account,
    required final CategoryDto category,
    required final Decimal amount,
    required final DateTime transactionDate,
    required final String? comment,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _TransactionResponseDto;

  factory TransactionResponseDto.fromJson(final Map<String, dynamic> json) =>
      _$TransactionResponseDtoFromJson(json);
}
