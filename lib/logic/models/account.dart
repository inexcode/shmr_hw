import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/logic/models/enums.dart';
import 'package:shmr_hw/logic/models/rest_api_dto/account.dart';
import 'package:shmr_hw/logic/models/stat_item.dart';

part 'account.freezed.dart';

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

  factory Account.fromDto(final AccountDto dto) => Account(
        id: dto.id,
        userId: dto.userId,
        name: dto.name,
        balance: dto.balance,
        currency: dto.currency,
        createdAt: dto.createdAt,
        updatedAt: dto.updatedAt,
      );
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
abstract class AccountDetails with _$AccountDetails {
  const factory AccountDetails({
    required final int id,
    required final String name,
    required final Decimal balance,
    required final String currency,
    required final List<StatItem> incomeStats,
    required final List<StatItem> expenseStats,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _AccountDetails;

  factory AccountDetails.fromDto(final AccountResponseDto dto) =>
      AccountDetails(
        id: dto.id,
        name: dto.name,
        balance: dto.balance,
        currency: dto.currency,
        incomeStats: dto.incomeStats.map(StatItem.fromDto).toList(),
        expenseStats: dto.expenseStats.map(StatItem.fromDto).toList(),
        createdAt: dto.createdAt,
        updatedAt: dto.updatedAt,
      );
}

@freezed
abstract class AccountState with _$AccountState {
  const factory AccountState({
    required final int id,
    required final String name,
    required final Decimal balance,
    required final String currency,
  }) = _AccountState;

  factory AccountState.fromDto(final AccountStateDto dto) => AccountState(
        id: dto.id,
        name: dto.name,
        balance: dto.balance,
        currency: dto.currency,
      );
}

@freezed
abstract class AccountHistoryElement with _$AccountHistoryElement {
  const factory AccountHistoryElement({
    required final int id,
    required final int accountId,
    required final String name,
    required final AccountHistoryChangeType changeType,
    required final AccountState? previousState,
    required final AccountState newState,
    required final DateTime changeTimestamp,
    required final DateTime createdAt,
  }) = _AccountHistoryElement;

  factory AccountHistoryElement.fromDto(final AccountHistoryDto dto) =>
      AccountHistoryElement(
        id: dto.id,
        accountId: dto.accountId,
        name: dto.name,
        changeType: dto.changeType,
        previousState: dto.previousState != null
            ? AccountState.fromDto(dto.previousState!)
            : null,
        newState: AccountState.fromDto(dto.newState),
        changeTimestamp: dto.changeTimestamp,
        createdAt: dto.createdAt,
      );
}

@freezed
abstract class AccountHistory with _$AccountHistory {
  const factory AccountHistory({
    required final int accountId,
    required final String accountName,
    required final String currency,
    required final Decimal currentBalance,
    required final List<AccountHistoryElement> history,
  }) = _AccountHistory;

  factory AccountHistory.fromDto(final AccountHistoryDtoResponse dto) =>
      AccountHistory(
        accountId: dto.accountId,
        accountName: dto.accountName,
        currency: dto.currency,
        currentBalance: dto.currentBalance,
        history: dto.history.map(AccountHistoryElement.fromDto).toList(),
      );
}
