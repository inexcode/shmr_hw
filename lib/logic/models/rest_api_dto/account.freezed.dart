// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountDto {

 int get id; int get userId; String get name; Decimal get balance; String get currency; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of AccountDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountDtoCopyWith<AccountDto> get copyWith => _$AccountDtoCopyWithImpl<AccountDto>(this as AccountDto, _$identity);

  /// Serializes this AccountDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,balance,currency,createdAt,updatedAt);

@override
String toString() {
  return 'AccountDto(id: $id, userId: $userId, name: $name, balance: $balance, currency: $currency, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AccountDtoCopyWith<$Res>  {
  factory $AccountDtoCopyWith(AccountDto value, $Res Function(AccountDto) _then) = _$AccountDtoCopyWithImpl;
@useResult
$Res call({
 int id, int userId, String name, Decimal balance, String currency, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$AccountDtoCopyWithImpl<$Res>
    implements $AccountDtoCopyWith<$Res> {
  _$AccountDtoCopyWithImpl(this._self, this._then);

  final AccountDto _self;
  final $Res Function(AccountDto) _then;

/// Create a copy of AccountDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? balance = null,Object? currency = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Decimal,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AccountDto implements AccountDto {
  const _AccountDto({required this.id, required this.userId, required this.name, required this.balance, required this.currency, required this.createdAt, required this.updatedAt});
  factory _AccountDto.fromJson(Map<String, dynamic> json) => _$AccountDtoFromJson(json);

@override final  int id;
@override final  int userId;
@override final  String name;
@override final  Decimal balance;
@override final  String currency;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of AccountDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountDtoCopyWith<_AccountDto> get copyWith => __$AccountDtoCopyWithImpl<_AccountDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,balance,currency,createdAt,updatedAt);

@override
String toString() {
  return 'AccountDto(id: $id, userId: $userId, name: $name, balance: $balance, currency: $currency, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AccountDtoCopyWith<$Res> implements $AccountDtoCopyWith<$Res> {
  factory _$AccountDtoCopyWith(_AccountDto value, $Res Function(_AccountDto) _then) = __$AccountDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, int userId, String name, Decimal balance, String currency, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$AccountDtoCopyWithImpl<$Res>
    implements _$AccountDtoCopyWith<$Res> {
  __$AccountDtoCopyWithImpl(this._self, this._then);

  final _AccountDto _self;
  final $Res Function(_AccountDto) _then;

/// Create a copy of AccountDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? balance = null,Object? currency = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_AccountDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Decimal,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$AccountRequestDto {

 String get name; Decimal get balance; String get currency;
/// Create a copy of AccountRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountRequestDtoCopyWith<AccountRequestDto> get copyWith => _$AccountRequestDtoCopyWithImpl<AccountRequestDto>(this as AccountRequestDto, _$identity);

  /// Serializes this AccountRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountRequestDto&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,balance,currency);

@override
String toString() {
  return 'AccountRequestDto(name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $AccountRequestDtoCopyWith<$Res>  {
  factory $AccountRequestDtoCopyWith(AccountRequestDto value, $Res Function(AccountRequestDto) _then) = _$AccountRequestDtoCopyWithImpl;
@useResult
$Res call({
 String name, Decimal balance, String currency
});




}
/// @nodoc
class _$AccountRequestDtoCopyWithImpl<$Res>
    implements $AccountRequestDtoCopyWith<$Res> {
  _$AccountRequestDtoCopyWithImpl(this._self, this._then);

  final AccountRequestDto _self;
  final $Res Function(AccountRequestDto) _then;

/// Create a copy of AccountRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Decimal,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AccountRequestDto implements AccountRequestDto {
  const _AccountRequestDto({required this.name, required this.balance, required this.currency});
  factory _AccountRequestDto.fromJson(Map<String, dynamic> json) => _$AccountRequestDtoFromJson(json);

@override final  String name;
@override final  Decimal balance;
@override final  String currency;

/// Create a copy of AccountRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountRequestDtoCopyWith<_AccountRequestDto> get copyWith => __$AccountRequestDtoCopyWithImpl<_AccountRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountRequestDto&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,balance,currency);

@override
String toString() {
  return 'AccountRequestDto(name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$AccountRequestDtoCopyWith<$Res> implements $AccountRequestDtoCopyWith<$Res> {
  factory _$AccountRequestDtoCopyWith(_AccountRequestDto value, $Res Function(_AccountRequestDto) _then) = __$AccountRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, Decimal balance, String currency
});




}
/// @nodoc
class __$AccountRequestDtoCopyWithImpl<$Res>
    implements _$AccountRequestDtoCopyWith<$Res> {
  __$AccountRequestDtoCopyWithImpl(this._self, this._then);

  final _AccountRequestDto _self;
  final $Res Function(_AccountRequestDto) _then;

/// Create a copy of AccountRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_AccountRequestDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Decimal,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AccountResponseDto {

 int get id; String get name; Decimal get balance; String get currency; List<StatItemDto> get incomeStats; List<StatItemDto> get expenseStats; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of AccountResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountResponseDtoCopyWith<AccountResponseDto> get copyWith => _$AccountResponseDtoCopyWithImpl<AccountResponseDto>(this as AccountResponseDto, _$identity);

  /// Serializes this AccountResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountResponseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.incomeStats, incomeStats)&&const DeepCollectionEquality().equals(other.expenseStats, expenseStats)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,balance,currency,const DeepCollectionEquality().hash(incomeStats),const DeepCollectionEquality().hash(expenseStats),createdAt,updatedAt);

@override
String toString() {
  return 'AccountResponseDto(id: $id, name: $name, balance: $balance, currency: $currency, incomeStats: $incomeStats, expenseStats: $expenseStats, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AccountResponseDtoCopyWith<$Res>  {
  factory $AccountResponseDtoCopyWith(AccountResponseDto value, $Res Function(AccountResponseDto) _then) = _$AccountResponseDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, Decimal balance, String currency, List<StatItemDto> incomeStats, List<StatItemDto> expenseStats, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$AccountResponseDtoCopyWithImpl<$Res>
    implements $AccountResponseDtoCopyWith<$Res> {
  _$AccountResponseDtoCopyWithImpl(this._self, this._then);

  final AccountResponseDto _self;
  final $Res Function(AccountResponseDto) _then;

/// Create a copy of AccountResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? balance = null,Object? currency = null,Object? incomeStats = null,Object? expenseStats = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Decimal,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,incomeStats: null == incomeStats ? _self.incomeStats : incomeStats // ignore: cast_nullable_to_non_nullable
as List<StatItemDto>,expenseStats: null == expenseStats ? _self.expenseStats : expenseStats // ignore: cast_nullable_to_non_nullable
as List<StatItemDto>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AccountResponseDto implements AccountResponseDto {
  const _AccountResponseDto({required this.id, required this.name, required this.balance, required this.currency, required final  List<StatItemDto> incomeStats, required final  List<StatItemDto> expenseStats, required this.createdAt, required this.updatedAt}): _incomeStats = incomeStats,_expenseStats = expenseStats;
  factory _AccountResponseDto.fromJson(Map<String, dynamic> json) => _$AccountResponseDtoFromJson(json);

@override final  int id;
@override final  String name;
@override final  Decimal balance;
@override final  String currency;
 final  List<StatItemDto> _incomeStats;
@override List<StatItemDto> get incomeStats {
  if (_incomeStats is EqualUnmodifiableListView) return _incomeStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_incomeStats);
}

 final  List<StatItemDto> _expenseStats;
@override List<StatItemDto> get expenseStats {
  if (_expenseStats is EqualUnmodifiableListView) return _expenseStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenseStats);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of AccountResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountResponseDtoCopyWith<_AccountResponseDto> get copyWith => __$AccountResponseDtoCopyWithImpl<_AccountResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountResponseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other._incomeStats, _incomeStats)&&const DeepCollectionEquality().equals(other._expenseStats, _expenseStats)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,balance,currency,const DeepCollectionEquality().hash(_incomeStats),const DeepCollectionEquality().hash(_expenseStats),createdAt,updatedAt);

@override
String toString() {
  return 'AccountResponseDto(id: $id, name: $name, balance: $balance, currency: $currency, incomeStats: $incomeStats, expenseStats: $expenseStats, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AccountResponseDtoCopyWith<$Res> implements $AccountResponseDtoCopyWith<$Res> {
  factory _$AccountResponseDtoCopyWith(_AccountResponseDto value, $Res Function(_AccountResponseDto) _then) = __$AccountResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, Decimal balance, String currency, List<StatItemDto> incomeStats, List<StatItemDto> expenseStats, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$AccountResponseDtoCopyWithImpl<$Res>
    implements _$AccountResponseDtoCopyWith<$Res> {
  __$AccountResponseDtoCopyWithImpl(this._self, this._then);

  final _AccountResponseDto _self;
  final $Res Function(_AccountResponseDto) _then;

/// Create a copy of AccountResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? balance = null,Object? currency = null,Object? incomeStats = null,Object? expenseStats = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_AccountResponseDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Decimal,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,incomeStats: null == incomeStats ? _self._incomeStats : incomeStats // ignore: cast_nullable_to_non_nullable
as List<StatItemDto>,expenseStats: null == expenseStats ? _self._expenseStats : expenseStats // ignore: cast_nullable_to_non_nullable
as List<StatItemDto>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$AccountStateDto {

 int get id; String get name; Decimal get balance; String get currency;
/// Create a copy of AccountStateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountStateDtoCopyWith<AccountStateDto> get copyWith => _$AccountStateDtoCopyWithImpl<AccountStateDto>(this as AccountStateDto, _$identity);

  /// Serializes this AccountStateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountStateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,balance,currency);

@override
String toString() {
  return 'AccountStateDto(id: $id, name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $AccountStateDtoCopyWith<$Res>  {
  factory $AccountStateDtoCopyWith(AccountStateDto value, $Res Function(AccountStateDto) _then) = _$AccountStateDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, Decimal balance, String currency
});




}
/// @nodoc
class _$AccountStateDtoCopyWithImpl<$Res>
    implements $AccountStateDtoCopyWith<$Res> {
  _$AccountStateDtoCopyWithImpl(this._self, this._then);

  final AccountStateDto _self;
  final $Res Function(AccountStateDto) _then;

/// Create a copy of AccountStateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Decimal,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AccountStateDto implements AccountStateDto {
  const _AccountStateDto({required this.id, required this.name, required this.balance, required this.currency});
  factory _AccountStateDto.fromJson(Map<String, dynamic> json) => _$AccountStateDtoFromJson(json);

@override final  int id;
@override final  String name;
@override final  Decimal balance;
@override final  String currency;

/// Create a copy of AccountStateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountStateDtoCopyWith<_AccountStateDto> get copyWith => __$AccountStateDtoCopyWithImpl<_AccountStateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountStateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountStateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,balance,currency);

@override
String toString() {
  return 'AccountStateDto(id: $id, name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$AccountStateDtoCopyWith<$Res> implements $AccountStateDtoCopyWith<$Res> {
  factory _$AccountStateDtoCopyWith(_AccountStateDto value, $Res Function(_AccountStateDto) _then) = __$AccountStateDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, Decimal balance, String currency
});




}
/// @nodoc
class __$AccountStateDtoCopyWithImpl<$Res>
    implements _$AccountStateDtoCopyWith<$Res> {
  __$AccountStateDtoCopyWithImpl(this._self, this._then);

  final _AccountStateDto _self;
  final $Res Function(_AccountStateDto) _then;

/// Create a copy of AccountStateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_AccountStateDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Decimal,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AccountHistoryDto {

 int get id; int get accountId; String get name; AccountHistoryChangeType get changeType; AccountStateDto? get previousState; AccountStateDto get newState; DateTime get changeTimestamp; DateTime get createdAt;
/// Create a copy of AccountHistoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountHistoryDtoCopyWith<AccountHistoryDto> get copyWith => _$AccountHistoryDtoCopyWithImpl<AccountHistoryDto>(this as AccountHistoryDto, _$identity);

  /// Serializes this AccountHistoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountHistoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.name, name) || other.name == name)&&(identical(other.changeType, changeType) || other.changeType == changeType)&&(identical(other.previousState, previousState) || other.previousState == previousState)&&(identical(other.newState, newState) || other.newState == newState)&&(identical(other.changeTimestamp, changeTimestamp) || other.changeTimestamp == changeTimestamp)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,name,changeType,previousState,newState,changeTimestamp,createdAt);

@override
String toString() {
  return 'AccountHistoryDto(id: $id, accountId: $accountId, name: $name, changeType: $changeType, previousState: $previousState, newState: $newState, changeTimestamp: $changeTimestamp, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AccountHistoryDtoCopyWith<$Res>  {
  factory $AccountHistoryDtoCopyWith(AccountHistoryDto value, $Res Function(AccountHistoryDto) _then) = _$AccountHistoryDtoCopyWithImpl;
@useResult
$Res call({
 int id, int accountId, String name, AccountHistoryChangeType changeType, AccountStateDto? previousState, AccountStateDto newState, DateTime changeTimestamp, DateTime createdAt
});


$AccountStateDtoCopyWith<$Res>? get previousState;$AccountStateDtoCopyWith<$Res> get newState;

}
/// @nodoc
class _$AccountHistoryDtoCopyWithImpl<$Res>
    implements $AccountHistoryDtoCopyWith<$Res> {
  _$AccountHistoryDtoCopyWithImpl(this._self, this._then);

  final AccountHistoryDto _self;
  final $Res Function(AccountHistoryDto) _then;

/// Create a copy of AccountHistoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accountId = null,Object? name = null,Object? changeType = null,Object? previousState = freezed,Object? newState = null,Object? changeTimestamp = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,changeType: null == changeType ? _self.changeType : changeType // ignore: cast_nullable_to_non_nullable
as AccountHistoryChangeType,previousState: freezed == previousState ? _self.previousState : previousState // ignore: cast_nullable_to_non_nullable
as AccountStateDto?,newState: null == newState ? _self.newState : newState // ignore: cast_nullable_to_non_nullable
as AccountStateDto,changeTimestamp: null == changeTimestamp ? _self.changeTimestamp : changeTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of AccountHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountStateDtoCopyWith<$Res>? get previousState {
    if (_self.previousState == null) {
    return null;
  }

  return $AccountStateDtoCopyWith<$Res>(_self.previousState!, (value) {
    return _then(_self.copyWith(previousState: value));
  });
}/// Create a copy of AccountHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountStateDtoCopyWith<$Res> get newState {
  
  return $AccountStateDtoCopyWith<$Res>(_self.newState, (value) {
    return _then(_self.copyWith(newState: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _AccountHistoryDto implements AccountHistoryDto {
  const _AccountHistoryDto({required this.id, required this.accountId, required this.name, required this.changeType, required this.previousState, required this.newState, required this.changeTimestamp, required this.createdAt});
  factory _AccountHistoryDto.fromJson(Map<String, dynamic> json) => _$AccountHistoryDtoFromJson(json);

@override final  int id;
@override final  int accountId;
@override final  String name;
@override final  AccountHistoryChangeType changeType;
@override final  AccountStateDto? previousState;
@override final  AccountStateDto newState;
@override final  DateTime changeTimestamp;
@override final  DateTime createdAt;

/// Create a copy of AccountHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountHistoryDtoCopyWith<_AccountHistoryDto> get copyWith => __$AccountHistoryDtoCopyWithImpl<_AccountHistoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountHistoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountHistoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.name, name) || other.name == name)&&(identical(other.changeType, changeType) || other.changeType == changeType)&&(identical(other.previousState, previousState) || other.previousState == previousState)&&(identical(other.newState, newState) || other.newState == newState)&&(identical(other.changeTimestamp, changeTimestamp) || other.changeTimestamp == changeTimestamp)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,name,changeType,previousState,newState,changeTimestamp,createdAt);

@override
String toString() {
  return 'AccountHistoryDto(id: $id, accountId: $accountId, name: $name, changeType: $changeType, previousState: $previousState, newState: $newState, changeTimestamp: $changeTimestamp, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AccountHistoryDtoCopyWith<$Res> implements $AccountHistoryDtoCopyWith<$Res> {
  factory _$AccountHistoryDtoCopyWith(_AccountHistoryDto value, $Res Function(_AccountHistoryDto) _then) = __$AccountHistoryDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, int accountId, String name, AccountHistoryChangeType changeType, AccountStateDto? previousState, AccountStateDto newState, DateTime changeTimestamp, DateTime createdAt
});


@override $AccountStateDtoCopyWith<$Res>? get previousState;@override $AccountStateDtoCopyWith<$Res> get newState;

}
/// @nodoc
class __$AccountHistoryDtoCopyWithImpl<$Res>
    implements _$AccountHistoryDtoCopyWith<$Res> {
  __$AccountHistoryDtoCopyWithImpl(this._self, this._then);

  final _AccountHistoryDto _self;
  final $Res Function(_AccountHistoryDto) _then;

/// Create a copy of AccountHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accountId = null,Object? name = null,Object? changeType = null,Object? previousState = freezed,Object? newState = null,Object? changeTimestamp = null,Object? createdAt = null,}) {
  return _then(_AccountHistoryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,changeType: null == changeType ? _self.changeType : changeType // ignore: cast_nullable_to_non_nullable
as AccountHistoryChangeType,previousState: freezed == previousState ? _self.previousState : previousState // ignore: cast_nullable_to_non_nullable
as AccountStateDto?,newState: null == newState ? _self.newState : newState // ignore: cast_nullable_to_non_nullable
as AccountStateDto,changeTimestamp: null == changeTimestamp ? _self.changeTimestamp : changeTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of AccountHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountStateDtoCopyWith<$Res>? get previousState {
    if (_self.previousState == null) {
    return null;
  }

  return $AccountStateDtoCopyWith<$Res>(_self.previousState!, (value) {
    return _then(_self.copyWith(previousState: value));
  });
}/// Create a copy of AccountHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountStateDtoCopyWith<$Res> get newState {
  
  return $AccountStateDtoCopyWith<$Res>(_self.newState, (value) {
    return _then(_self.copyWith(newState: value));
  });
}
}


/// @nodoc
mixin _$AccountHistoryDtoResponse {

 int get accountId; String get accountName; String get currency; Decimal get currentBalance; List<AccountHistoryDto> get history;
/// Create a copy of AccountHistoryDtoResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountHistoryDtoResponseCopyWith<AccountHistoryDtoResponse> get copyWith => _$AccountHistoryDtoResponseCopyWithImpl<AccountHistoryDtoResponse>(this as AccountHistoryDtoResponse, _$identity);

  /// Serializes this AccountHistoryDtoResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountHistoryDtoResponse&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.currentBalance, currentBalance) || other.currentBalance == currentBalance)&&const DeepCollectionEquality().equals(other.history, history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,accountName,currency,currentBalance,const DeepCollectionEquality().hash(history));

@override
String toString() {
  return 'AccountHistoryDtoResponse(accountId: $accountId, accountName: $accountName, currency: $currency, currentBalance: $currentBalance, history: $history)';
}


}

/// @nodoc
abstract mixin class $AccountHistoryDtoResponseCopyWith<$Res>  {
  factory $AccountHistoryDtoResponseCopyWith(AccountHistoryDtoResponse value, $Res Function(AccountHistoryDtoResponse) _then) = _$AccountHistoryDtoResponseCopyWithImpl;
@useResult
$Res call({
 int accountId, String accountName, String currency, Decimal currentBalance, List<AccountHistoryDto> history
});




}
/// @nodoc
class _$AccountHistoryDtoResponseCopyWithImpl<$Res>
    implements $AccountHistoryDtoResponseCopyWith<$Res> {
  _$AccountHistoryDtoResponseCopyWithImpl(this._self, this._then);

  final AccountHistoryDtoResponse _self;
  final $Res Function(AccountHistoryDtoResponse) _then;

/// Create a copy of AccountHistoryDtoResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? accountName = null,Object? currency = null,Object? currentBalance = null,Object? history = null,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,currentBalance: null == currentBalance ? _self.currentBalance : currentBalance // ignore: cast_nullable_to_non_nullable
as Decimal,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<AccountHistoryDto>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AccountHistoryDtoResponse implements AccountHistoryDtoResponse {
  const _AccountHistoryDtoResponse({required this.accountId, required this.accountName, required this.currency, required this.currentBalance, required final  List<AccountHistoryDto> history}): _history = history;
  factory _AccountHistoryDtoResponse.fromJson(Map<String, dynamic> json) => _$AccountHistoryDtoResponseFromJson(json);

@override final  int accountId;
@override final  String accountName;
@override final  String currency;
@override final  Decimal currentBalance;
 final  List<AccountHistoryDto> _history;
@override List<AccountHistoryDto> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of AccountHistoryDtoResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountHistoryDtoResponseCopyWith<_AccountHistoryDtoResponse> get copyWith => __$AccountHistoryDtoResponseCopyWithImpl<_AccountHistoryDtoResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountHistoryDtoResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountHistoryDtoResponse&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.currentBalance, currentBalance) || other.currentBalance == currentBalance)&&const DeepCollectionEquality().equals(other._history, _history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,accountName,currency,currentBalance,const DeepCollectionEquality().hash(_history));

@override
String toString() {
  return 'AccountHistoryDtoResponse(accountId: $accountId, accountName: $accountName, currency: $currency, currentBalance: $currentBalance, history: $history)';
}


}

/// @nodoc
abstract mixin class _$AccountHistoryDtoResponseCopyWith<$Res> implements $AccountHistoryDtoResponseCopyWith<$Res> {
  factory _$AccountHistoryDtoResponseCopyWith(_AccountHistoryDtoResponse value, $Res Function(_AccountHistoryDtoResponse) _then) = __$AccountHistoryDtoResponseCopyWithImpl;
@override @useResult
$Res call({
 int accountId, String accountName, String currency, Decimal currentBalance, List<AccountHistoryDto> history
});




}
/// @nodoc
class __$AccountHistoryDtoResponseCopyWithImpl<$Res>
    implements _$AccountHistoryDtoResponseCopyWith<$Res> {
  __$AccountHistoryDtoResponseCopyWithImpl(this._self, this._then);

  final _AccountHistoryDtoResponse _self;
  final $Res Function(_AccountHistoryDtoResponse) _then;

/// Create a copy of AccountHistoryDtoResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? accountName = null,Object? currency = null,Object? currentBalance = null,Object? history = null,}) {
  return _then(_AccountHistoryDtoResponse(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,currentBalance: null == currentBalance ? _self.currentBalance : currentBalance // ignore: cast_nullable_to_non_nullable
as Decimal,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<AccountHistoryDto>,
  ));
}


}

// dart format on
