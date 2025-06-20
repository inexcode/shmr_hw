// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountDto _$AccountDtoFromJson(Map<String, dynamic> json) => _AccountDto(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      name: json['name'] as String,
      balance: Decimal.fromJson(json['balance'] as String),
      currency: json['currency'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AccountDtoToJson(_AccountDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'balance': instance.balance,
      'currency': instance.currency,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_AccountRequestDto _$AccountRequestDtoFromJson(Map<String, dynamic> json) =>
    _AccountRequestDto(
      name: json['name'] as String,
      balance: Decimal.fromJson(json['balance'] as String),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$AccountRequestDtoToJson(_AccountRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'balance': instance.balance,
      'currency': instance.currency,
    };

_AccountResponseDto _$AccountResponseDtoFromJson(Map<String, dynamic> json) =>
    _AccountResponseDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      balance: Decimal.fromJson(json['balance'] as String),
      currency: json['currency'] as String,
      incomeStats: (json['incomeStats'] as List<dynamic>)
          .map((e) => StatItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      expenseStats: (json['expenseStats'] as List<dynamic>)
          .map((e) => StatItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AccountResponseDtoToJson(_AccountResponseDto instance) =>
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

_AccountStateDto _$AccountStateDtoFromJson(Map<String, dynamic> json) =>
    _AccountStateDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      balance: Decimal.fromJson(json['balance'] as String),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$AccountStateDtoToJson(_AccountStateDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'currency': instance.currency,
    };

_AccountHistoryDto _$AccountHistoryDtoFromJson(Map<String, dynamic> json) =>
    _AccountHistoryDto(
      id: (json['id'] as num).toInt(),
      accountId: (json['accountId'] as num).toInt(),
      name: json['name'] as String,
      changeType:
          $enumDecode(_$AccountHistoryChangeTypeEnumMap, json['changeType']),
      previousState: json['previousState'] == null
          ? null
          : AccountStateDto.fromJson(
              json['previousState'] as Map<String, dynamic>),
      newState:
          AccountStateDto.fromJson(json['newState'] as Map<String, dynamic>),
      changeTimestamp: DateTime.parse(json['changeTimestamp'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AccountHistoryDtoToJson(_AccountHistoryDto instance) =>
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
  AccountHistoryChangeType.modification: 'MODIFICATION',
};

_AccountHistoryDtoResponse _$AccountHistoryDtoResponseFromJson(
        Map<String, dynamic> json) =>
    _AccountHistoryDtoResponse(
      accountId: (json['accountId'] as num).toInt(),
      accountName: json['accountName'] as String,
      currency: json['currency'] as String,
      currentBalance: Decimal.fromJson(json['currentBalance'] as String),
      history: (json['history'] as List<dynamic>)
          .map((e) => AccountHistoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountHistoryDtoResponseToJson(
        _AccountHistoryDtoResponse instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'accountName': instance.accountName,
      'currency': instance.currency,
      'currentBalance': instance.currentBalance,
      'history': instance.history,
    };
