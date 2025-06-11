// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Account _$AccountFromJson(Map<String, dynamic> json) => _Account(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      name: json['name'] as String,
      balance: Decimal.fromJson(json['balance'] as String),
      currency: json['currency'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AccountToJson(_Account instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'balance': instance.balance,
      'currency': instance.currency,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_AccountResponse _$AccountResponseFromJson(Map<String, dynamic> json) =>
    _AccountResponse(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      balance: Decimal.fromJson(json['balance'] as String),
      currency: json['currency'] as String,
      incomeStats: (json['incomeStats'] as List<dynamic>)
          .map((e) => StatItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      expenseStats: (json['expenseStats'] as List<dynamic>)
          .map((e) => StatItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AccountResponseToJson(_AccountResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'currency': instance.currency,
      'incomeStats': instance.incomeStats,
      'expenseStats': instance.expenseStats,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_AccountState _$AccountStateFromJson(Map<String, dynamic> json) =>
    _AccountState(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      balance: Decimal.fromJson(json['balance'] as String),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$AccountStateToJson(_AccountState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'currency': instance.currency,
    };

_AccountHistory _$AccountHistoryFromJson(Map<String, dynamic> json) =>
    _AccountHistory(
      id: (json['id'] as num).toInt(),
      accountId: (json['accountId'] as num).toInt(),
      name: json['name'] as String,
      changeType:
          $enumDecode(_$AccountHistoryChangeTypeEnumMap, json['changeType']),
      previousState:
          AccountState.fromJson(json['previousState'] as Map<String, dynamic>),
      newState: AccountState.fromJson(json['newState'] as Map<String, dynamic>),
      changeTimestamp: DateTime.parse(json['changeTimestamp'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AccountHistoryToJson(_AccountHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'name': instance.name,
      'changeType': _$AccountHistoryChangeTypeEnumMap[instance.changeType]!,
      'previousState': instance.previousState,
      'newState': instance.newState,
      'changeTimestamp': instance.changeTimestamp.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$AccountHistoryChangeTypeEnumMap = {
  AccountHistoryChangeType.creation: 'CREATION',
  AccountHistoryChangeType.modification: 'DELETION',
};

_AccountHistoryResponse _$AccountHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    _AccountHistoryResponse(
      accountId: (json['accountId'] as num).toInt(),
      accountName: json['accountName'] as String,
      currency: json['currency'] as String,
      currentBalance: Decimal.fromJson(json['currentBalance'] as String),
      history: (json['history'] as List<dynamic>)
          .map((e) => AccountHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountHistoryResponseToJson(
        _AccountHistoryResponse instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'accountName': instance.accountName,
      'currency': instance.currency,
      'currentBalance': instance.currentBalance,
      'history': instance.history,
    };
