import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/logic/models/drift/database.dart';
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

  factory Account.fromDatabase(final DatabaseAccount dbAccount) => Account(
    id: dbAccount.id,
    userId: dbAccount.userId,
    name: dbAccount.name,
    balance: dbAccount.balance,
    currency: dbAccount.currency,
    createdAt: dbAccount.createdAt,
    updatedAt: dbAccount.updatedAt,
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
  }) = _AccountRequest;

  const AccountRequest._();

  AccountRequestDto toDto() =>
      AccountRequestDto(name: name, balance: balance, currency: currency);
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

  factory AccountDetails.fromDatabase(final DatabaseAccount dbAccount) =>
      AccountDetails(
        id: dbAccount.id,
        name: dbAccount.name,
        balance: dbAccount.balance,
        currency: dbAccount.currency,
        createdAt: dbAccount.createdAt,
        updatedAt: dbAccount.updatedAt,
        // TODO(inex): Not clear what exactly should be here.
        incomeStats: const [],
        expenseStats: const [],
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

  factory AccountState.fromDatabase(final DatabaseAccountState dbState) =>
      AccountState(
        id: dbState.id,
        name: dbState.name,
        balance: dbState.balance,
        currency: dbState.currency,
      );

  factory AccountState.empty() =>
      AccountState(id: 0, name: '', balance: Decimal.zero, currency: '');
}
