import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/logic/models/enums.dart';
import 'package:shmr_hw/logic/models/rest_api_dto/stat_item.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
abstract class AccountDto with _$AccountDto {
  const factory AccountDto({
    required final int id,
    required final int userId,
    required final String name,
    required final Decimal balance,
    required final String currency,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _AccountDto;

  factory AccountDto.fromJson(final Map<String, dynamic> json) =>
      _$AccountDtoFromJson(json);
}

// API defines AccountCreateRequest and AccountUpdateRequest that are
// the same.
@freezed
abstract class AccountRequestDto with _$AccountRequestDto {
  const factory AccountRequestDto({
    required final String name,
    required final Decimal balance,
    required final String currency,
  }) = _AccountRequestDto;

  factory AccountRequestDto.fromJson(final Map<String, dynamic> json) =>
      _$AccountRequestDtoFromJson(json);
}

@freezed
abstract class AccountResponseDto with _$AccountResponseDto {
  const factory AccountResponseDto({
    required final int id,
    required final String name,
    required final Decimal balance,
    required final String currency,
    required final List<StatItemDto> incomeStats,
    required final List<StatItemDto> expenseStats,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _AccountResponseDto;

  factory AccountResponseDto.fromJson(final Map<String, dynamic> json) =>
      _$AccountResponseDtoFromJson(json);
}

@freezed
abstract class AccountStateDto with _$AccountStateDto {
  const factory AccountStateDto({
    required final int id,
    required final String name,
    required final Decimal balance,
    required final String currency,
  }) = _AccountStateDto;

  factory AccountStateDto.fromJson(final Map<String, dynamic> json) =>
      _$AccountStateDtoFromJson(json);
}

// AccountBrief right now is the same as AccountStateDto.
typedef AccountBriefDto = AccountStateDto;

@freezed
abstract class AccountHistoryDto with _$AccountHistoryDto {
  const factory AccountHistoryDto({
    required final int id,
    required final int accountId,
    required final String name,
    required final AccountHistoryChangeType changeType,
    required final AccountStateDto? previousState,
    required final AccountStateDto newState,
    required final DateTime changeTimestamp,
    required final DateTime createdAt,
  }) = _AccountHistoryDto;

  factory AccountHistoryDto.fromJson(final Map<String, dynamic> json) =>
      _$AccountHistoryDtoFromJson(json);
}

@freezed
abstract class AccountHistoryDtoResponse with _$AccountHistoryDtoResponse {
  const factory AccountHistoryDtoResponse({
    required final int accountId,
    required final String accountName,
    required final String currency,
    required final Decimal currentBalance,
    required final List<AccountHistoryDto> history,
  }) = _AccountHistoryDtoResponse;

  factory AccountHistoryDtoResponse.fromJson(final Map<String, dynamic> json) =>
      _$AccountHistoryDtoResponseFromJson(json);
}
