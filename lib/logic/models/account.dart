import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/logic/models/stat_item.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
abstract class Account with _$Account {
  const factory Account({
    required final int id,
    required final int userId,
    required final String name,
    required final Decimal balance,
    required final String currency,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _Account;

  factory Account.fromJson(final Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

// API defines AccountCreateRequest and AccountUpdateRequest that are
// the same.
@freezed
abstract class AccountRequest with _$AccountRequest {
  const factory AccountRequest({
    required final String name,
    required final Decimal balance,
    required final String currency,
  }) = _Create;
}

@freezed
abstract class AccountResponse with _$AccountResponse {
  const factory AccountResponse({
    required final int id,
    required final String name,
    required final Decimal balance,
    required final String currency,
    required final List<StatItem> incomeStats,
    required final List<StatItem> expenseStats,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _AccountResponse;

  factory AccountResponse.fromJson(final Map<String, dynamic> json) =>
      _$AccountResponseFromJson(json);
}

// I feel like AccountResponse should have been Account,
// but we can't cast because AccountResponse has StatItems,
// but doesn't have userId.
// So let's call it AccountDetails for clarity.
typedef AccountDetails = AccountResponse;

@freezed
abstract class AccountState with _$AccountState {
  const factory AccountState({
    required final int id,
    required final String name,
    required final Decimal balance,
    required final String currency,
  }) = _AccountState;

  factory AccountState.fromJson(final Map<String, dynamic> json) =>
      _$AccountStateFromJson(json);
}

// AccountBrief right now is the same as AccountState.
typedef AccountBrief = AccountState;

enum AccountHistoryChangeType {
  @JsonValue('CREATION')
  creation,
  @JsonValue('DELETION')
  modification,
}

@freezed
abstract class AccountHistory with _$AccountHistory {
  const factory AccountHistory({
    required final int id,
    required final int accountId,
    required final String name,
    required final AccountHistoryChangeType changeType,
    required final AccountState previousState,
    required final AccountState newState,
    required final DateTime changeTimestamp,
    required final DateTime createdAt,
  }) = _AccountHistory;

  factory AccountHistory.fromJson(final Map<String, dynamic> json) =>
      _$AccountHistoryFromJson(json);
}

@freezed
abstract class AccountHistoryResponse with _$AccountHistoryResponse {
  const factory AccountHistoryResponse({
    required final int accountId,
    required final String accountName,
    required final String currency,
    required final Decimal currentBalance,
    required final List<AccountHistory> history,
  }) = _AccountHistoryResponse;

  factory AccountHistoryResponse.fromJson(final Map<String, dynamic> json) =>
      _$AccountHistoryResponseFromJson(json);
}
