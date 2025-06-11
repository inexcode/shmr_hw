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
mixin _$Account {
  int get id;
  int get userId;
  String get name;
  Decimal get balance;
  String get currency;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountCopyWith<Account> get copyWith =>
      _$AccountCopyWithImpl<Account>(this as Account, _$identity);

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Account &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, name, balance, currency, createdAt, updatedAt);

  @override
  String toString() {
    return 'Account(id: $id, userId: $userId, name: $name, balance: $balance, currency: $currency, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) _then) =
      _$AccountCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int userId,
      String name,
      Decimal balance,
      String currency,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res> implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._self, this._then);

  final Account _self;
  final $Res Function(Account) _then;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? balance = null,
    Object? currency = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as Decimal,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Account implements Account {
  const _Account(
      {required this.id,
      required this.userId,
      required this.name,
      required this.balance,
      required this.currency,
      required this.createdAt,
      required this.updatedAt});
  factory _Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String name;
  @override
  final Decimal balance;
  @override
  final String currency;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountCopyWith<_Account> get copyWith =>
      __$AccountCopyWithImpl<_Account>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AccountToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Account &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, name, balance, currency, createdAt, updatedAt);

  @override
  String toString() {
    return 'Account(id: $id, userId: $userId, name: $name, balance: $balance, currency: $currency, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) _then) =
      __$AccountCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      String name,
      Decimal balance,
      String currency,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$AccountCopyWithImpl<$Res> implements _$AccountCopyWith<$Res> {
  __$AccountCopyWithImpl(this._self, this._then);

  final _Account _self;
  final $Res Function(_Account) _then;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? balance = null,
    Object? currency = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_Account(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as Decimal,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$AccountRequest {
  String get name;
  Decimal get balance;
  String get currency;

  /// Create a copy of AccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountRequestCopyWith<AccountRequest> get copyWith =>
      _$AccountRequestCopyWithImpl<AccountRequest>(
          this as AccountRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountRequest &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, balance, currency);

  @override
  String toString() {
    return 'AccountRequest(name: $name, balance: $balance, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class $AccountRequestCopyWith<$Res> {
  factory $AccountRequestCopyWith(
          AccountRequest value, $Res Function(AccountRequest) _then) =
      _$AccountRequestCopyWithImpl;
  @useResult
  $Res call({String name, Decimal balance, String currency});
}

/// @nodoc
class _$AccountRequestCopyWithImpl<$Res>
    implements $AccountRequestCopyWith<$Res> {
  _$AccountRequestCopyWithImpl(this._self, this._then);

  final AccountRequest _self;
  final $Res Function(AccountRequest) _then;

  /// Create a copy of AccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? balance = null,
    Object? currency = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as Decimal,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Create implements AccountRequest {
  const _Create(
      {required this.name, required this.balance, required this.currency});

  @override
  final String name;
  @override
  final Decimal balance;
  @override
  final String currency;

  /// Create a copy of AccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateCopyWith<_Create> get copyWith =>
      __$CreateCopyWithImpl<_Create>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Create &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, balance, currency);

  @override
  String toString() {
    return 'AccountRequest(name: $name, balance: $balance, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res>
    implements $AccountRequestCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) =
      __$CreateCopyWithImpl;
  @override
  @useResult
  $Res call({String name, Decimal balance, String currency});
}

/// @nodoc
class __$CreateCopyWithImpl<$Res> implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

  /// Create a copy of AccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? balance = null,
    Object? currency = null,
  }) {
    return _then(_Create(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as Decimal,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$AccountResponse {
  int get id;
  String get name;
  Decimal get balance;
  String get currency;
  List<StatItem> get incomeStats;
  List<StatItem> get expenseStats;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of AccountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountResponseCopyWith<AccountResponse> get copyWith =>
      _$AccountResponseCopyWithImpl<AccountResponse>(
          this as AccountResponse, _$identity);

  /// Serializes this AccountResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality()
                .equals(other.incomeStats, incomeStats) &&
            const DeepCollectionEquality()
                .equals(other.expenseStats, expenseStats) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      balance,
      currency,
      const DeepCollectionEquality().hash(incomeStats),
      const DeepCollectionEquality().hash(expenseStats),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'AccountResponse(id: $id, name: $name, balance: $balance, currency: $currency, incomeStats: $incomeStats, expenseStats: $expenseStats, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $AccountResponseCopyWith<$Res> {
  factory $AccountResponseCopyWith(
          AccountResponse value, $Res Function(AccountResponse) _then) =
      _$AccountResponseCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      Decimal balance,
      String currency,
      List<StatItem> incomeStats,
      List<StatItem> expenseStats,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$AccountResponseCopyWithImpl<$Res>
    implements $AccountResponseCopyWith<$Res> {
  _$AccountResponseCopyWithImpl(this._self, this._then);

  final AccountResponse _self;
  final $Res Function(AccountResponse) _then;

  /// Create a copy of AccountResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? balance = null,
    Object? currency = null,
    Object? incomeStats = null,
    Object? expenseStats = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as Decimal,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      incomeStats: null == incomeStats
          ? _self.incomeStats
          : incomeStats // ignore: cast_nullable_to_non_nullable
              as List<StatItem>,
      expenseStats: null == expenseStats
          ? _self.expenseStats
          : expenseStats // ignore: cast_nullable_to_non_nullable
              as List<StatItem>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AccountResponse implements AccountResponse {
  const _AccountResponse(
      {required this.id,
      required this.name,
      required this.balance,
      required this.currency,
      required final List<StatItem> incomeStats,
      required final List<StatItem> expenseStats,
      required this.createdAt,
      required this.updatedAt})
      : _incomeStats = incomeStats,
        _expenseStats = expenseStats;
  factory _AccountResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final Decimal balance;
  @override
  final String currency;
  final List<StatItem> _incomeStats;
  @override
  List<StatItem> get incomeStats {
    if (_incomeStats is EqualUnmodifiableListView) return _incomeStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomeStats);
  }

  final List<StatItem> _expenseStats;
  @override
  List<StatItem> get expenseStats {
    if (_expenseStats is EqualUnmodifiableListView) return _expenseStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseStats);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of AccountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountResponseCopyWith<_AccountResponse> get copyWith =>
      __$AccountResponseCopyWithImpl<_AccountResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AccountResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality()
                .equals(other._incomeStats, _incomeStats) &&
            const DeepCollectionEquality()
                .equals(other._expenseStats, _expenseStats) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      balance,
      currency,
      const DeepCollectionEquality().hash(_incomeStats),
      const DeepCollectionEquality().hash(_expenseStats),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'AccountResponse(id: $id, name: $name, balance: $balance, currency: $currency, incomeStats: $incomeStats, expenseStats: $expenseStats, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$AccountResponseCopyWith<$Res>
    implements $AccountResponseCopyWith<$Res> {
  factory _$AccountResponseCopyWith(
          _AccountResponse value, $Res Function(_AccountResponse) _then) =
      __$AccountResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      Decimal balance,
      String currency,
      List<StatItem> incomeStats,
      List<StatItem> expenseStats,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$AccountResponseCopyWithImpl<$Res>
    implements _$AccountResponseCopyWith<$Res> {
  __$AccountResponseCopyWithImpl(this._self, this._then);

  final _AccountResponse _self;
  final $Res Function(_AccountResponse) _then;

  /// Create a copy of AccountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? balance = null,
    Object? currency = null,
    Object? incomeStats = null,
    Object? expenseStats = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_AccountResponse(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as Decimal,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      incomeStats: null == incomeStats
          ? _self._incomeStats
          : incomeStats // ignore: cast_nullable_to_non_nullable
              as List<StatItem>,
      expenseStats: null == expenseStats
          ? _self._expenseStats
          : expenseStats // ignore: cast_nullable_to_non_nullable
              as List<StatItem>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$AccountState {
  int get id;
  String get name;
  Decimal get balance;
  String get currency;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountStateCopyWith<AccountState> get copyWith =>
      _$AccountStateCopyWithImpl<AccountState>(
          this as AccountState, _$identity);

  /// Serializes this AccountState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, balance, currency);

  @override
  String toString() {
    return 'AccountState(id: $id, name: $name, balance: $balance, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) _then) =
      _$AccountStateCopyWithImpl;
  @useResult
  $Res call({int id, String name, Decimal balance, String currency});
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res> implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._self, this._then);

  final AccountState _self;
  final $Res Function(AccountState) _then;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? balance = null,
    Object? currency = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as Decimal,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AccountState implements AccountState {
  const _AccountState(
      {required this.id,
      required this.name,
      required this.balance,
      required this.currency});
  factory _AccountState.fromJson(Map<String, dynamic> json) =>
      _$AccountStateFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final Decimal balance;
  @override
  final String currency;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountStateCopyWith<_AccountState> get copyWith =>
      __$AccountStateCopyWithImpl<_AccountState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AccountStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, balance, currency);

  @override
  String toString() {
    return 'AccountState(id: $id, name: $name, balance: $balance, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class _$AccountStateCopyWith<$Res>
    implements $AccountStateCopyWith<$Res> {
  factory _$AccountStateCopyWith(
          _AccountState value, $Res Function(_AccountState) _then) =
      __$AccountStateCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, Decimal balance, String currency});
}

/// @nodoc
class __$AccountStateCopyWithImpl<$Res>
    implements _$AccountStateCopyWith<$Res> {
  __$AccountStateCopyWithImpl(this._self, this._then);

  final _AccountState _self;
  final $Res Function(_AccountState) _then;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? balance = null,
    Object? currency = null,
  }) {
    return _then(_AccountState(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as Decimal,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$AccountHistory {
  int get id;
  int get accountId;
  String get name;
  AccountHistoryChangeType get changeType;
  AccountState get previousState;
  AccountState get newState;
  DateTime get changeTimestamp;
  DateTime get createdAt;

  /// Create a copy of AccountHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountHistoryCopyWith<AccountHistory> get copyWith =>
      _$AccountHistoryCopyWithImpl<AccountHistory>(
          this as AccountHistory, _$identity);

  /// Serializes this AccountHistory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.changeType, changeType) ||
                other.changeType == changeType) &&
            (identical(other.previousState, previousState) ||
                other.previousState == previousState) &&
            (identical(other.newState, newState) ||
                other.newState == newState) &&
            (identical(other.changeTimestamp, changeTimestamp) ||
                other.changeTimestamp == changeTimestamp) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, accountId, name, changeType,
      previousState, newState, changeTimestamp, createdAt);

  @override
  String toString() {
    return 'AccountHistory(id: $id, accountId: $accountId, name: $name, changeType: $changeType, previousState: $previousState, newState: $newState, changeTimestamp: $changeTimestamp, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $AccountHistoryCopyWith<$Res> {
  factory $AccountHistoryCopyWith(
          AccountHistory value, $Res Function(AccountHistory) _then) =
      _$AccountHistoryCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int accountId,
      String name,
      AccountHistoryChangeType changeType,
      AccountState previousState,
      AccountState newState,
      DateTime changeTimestamp,
      DateTime createdAt});

  $AccountStateCopyWith<$Res> get previousState;
  $AccountStateCopyWith<$Res> get newState;
}

/// @nodoc
class _$AccountHistoryCopyWithImpl<$Res>
    implements $AccountHistoryCopyWith<$Res> {
  _$AccountHistoryCopyWithImpl(this._self, this._then);

  final AccountHistory _self;
  final $Res Function(AccountHistory) _then;

  /// Create a copy of AccountHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? name = null,
    Object? changeType = null,
    Object? previousState = null,
    Object? newState = null,
    Object? changeTimestamp = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      accountId: null == accountId
          ? _self.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      changeType: null == changeType
          ? _self.changeType
          : changeType // ignore: cast_nullable_to_non_nullable
              as AccountHistoryChangeType,
      previousState: null == previousState
          ? _self.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as AccountState,
      newState: null == newState
          ? _self.newState
          : newState // ignore: cast_nullable_to_non_nullable
              as AccountState,
      changeTimestamp: null == changeTimestamp
          ? _self.changeTimestamp
          : changeTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of AccountHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountStateCopyWith<$Res> get previousState {
    return $AccountStateCopyWith<$Res>(_self.previousState, (value) {
      return _then(_self.copyWith(previousState: value));
    });
  }

  /// Create a copy of AccountHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountStateCopyWith<$Res> get newState {
    return $AccountStateCopyWith<$Res>(_self.newState, (value) {
      return _then(_self.copyWith(newState: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _AccountHistory implements AccountHistory {
  const _AccountHistory(
      {required this.id,
      required this.accountId,
      required this.name,
      required this.changeType,
      required this.previousState,
      required this.newState,
      required this.changeTimestamp,
      required this.createdAt});
  factory _AccountHistory.fromJson(Map<String, dynamic> json) =>
      _$AccountHistoryFromJson(json);

  @override
  final int id;
  @override
  final int accountId;
  @override
  final String name;
  @override
  final AccountHistoryChangeType changeType;
  @override
  final AccountState previousState;
  @override
  final AccountState newState;
  @override
  final DateTime changeTimestamp;
  @override
  final DateTime createdAt;

  /// Create a copy of AccountHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountHistoryCopyWith<_AccountHistory> get copyWith =>
      __$AccountHistoryCopyWithImpl<_AccountHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AccountHistoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.changeType, changeType) ||
                other.changeType == changeType) &&
            (identical(other.previousState, previousState) ||
                other.previousState == previousState) &&
            (identical(other.newState, newState) ||
                other.newState == newState) &&
            (identical(other.changeTimestamp, changeTimestamp) ||
                other.changeTimestamp == changeTimestamp) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, accountId, name, changeType,
      previousState, newState, changeTimestamp, createdAt);

  @override
  String toString() {
    return 'AccountHistory(id: $id, accountId: $accountId, name: $name, changeType: $changeType, previousState: $previousState, newState: $newState, changeTimestamp: $changeTimestamp, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$AccountHistoryCopyWith<$Res>
    implements $AccountHistoryCopyWith<$Res> {
  factory _$AccountHistoryCopyWith(
          _AccountHistory value, $Res Function(_AccountHistory) _then) =
      __$AccountHistoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int accountId,
      String name,
      AccountHistoryChangeType changeType,
      AccountState previousState,
      AccountState newState,
      DateTime changeTimestamp,
      DateTime createdAt});

  @override
  $AccountStateCopyWith<$Res> get previousState;
  @override
  $AccountStateCopyWith<$Res> get newState;
}

/// @nodoc
class __$AccountHistoryCopyWithImpl<$Res>
    implements _$AccountHistoryCopyWith<$Res> {
  __$AccountHistoryCopyWithImpl(this._self, this._then);

  final _AccountHistory _self;
  final $Res Function(_AccountHistory) _then;

  /// Create a copy of AccountHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? name = null,
    Object? changeType = null,
    Object? previousState = null,
    Object? newState = null,
    Object? changeTimestamp = null,
    Object? createdAt = null,
  }) {
    return _then(_AccountHistory(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      accountId: null == accountId
          ? _self.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      changeType: null == changeType
          ? _self.changeType
          : changeType // ignore: cast_nullable_to_non_nullable
              as AccountHistoryChangeType,
      previousState: null == previousState
          ? _self.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as AccountState,
      newState: null == newState
          ? _self.newState
          : newState // ignore: cast_nullable_to_non_nullable
              as AccountState,
      changeTimestamp: null == changeTimestamp
          ? _self.changeTimestamp
          : changeTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of AccountHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountStateCopyWith<$Res> get previousState {
    return $AccountStateCopyWith<$Res>(_self.previousState, (value) {
      return _then(_self.copyWith(previousState: value));
    });
  }

  /// Create a copy of AccountHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountStateCopyWith<$Res> get newState {
    return $AccountStateCopyWith<$Res>(_self.newState, (value) {
      return _then(_self.copyWith(newState: value));
    });
  }
}

/// @nodoc
mixin _$AccountHistoryResponse {
  int get accountId;
  String get accountName;
  String get currency;
  Decimal get currentBalance;
  List<AccountHistory> get history;

  /// Create a copy of AccountHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountHistoryResponseCopyWith<AccountHistoryResponse> get copyWith =>
      _$AccountHistoryResponseCopyWithImpl<AccountHistoryResponse>(
          this as AccountHistoryResponse, _$identity);

  /// Serializes this AccountHistoryResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountHistoryResponse &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            const DeepCollectionEquality().equals(other.history, history));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accountId, accountName, currency,
      currentBalance, const DeepCollectionEquality().hash(history));

  @override
  String toString() {
    return 'AccountHistoryResponse(accountId: $accountId, accountName: $accountName, currency: $currency, currentBalance: $currentBalance, history: $history)';
  }
}

/// @nodoc
abstract mixin class $AccountHistoryResponseCopyWith<$Res> {
  factory $AccountHistoryResponseCopyWith(AccountHistoryResponse value,
          $Res Function(AccountHistoryResponse) _then) =
      _$AccountHistoryResponseCopyWithImpl;
  @useResult
  $Res call(
      {int accountId,
      String accountName,
      String currency,
      Decimal currentBalance,
      List<AccountHistory> history});
}

/// @nodoc
class _$AccountHistoryResponseCopyWithImpl<$Res>
    implements $AccountHistoryResponseCopyWith<$Res> {
  _$AccountHistoryResponseCopyWithImpl(this._self, this._then);

  final AccountHistoryResponse _self;
  final $Res Function(AccountHistoryResponse) _then;

  /// Create a copy of AccountHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? accountName = null,
    Object? currency = null,
    Object? currentBalance = null,
    Object? history = null,
  }) {
    return _then(_self.copyWith(
      accountId: null == accountId
          ? _self.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      accountName: null == accountName
          ? _self.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currentBalance: null == currentBalance
          ? _self.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as Decimal,
      history: null == history
          ? _self.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<AccountHistory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AccountHistoryResponse implements AccountHistoryResponse {
  const _AccountHistoryResponse(
      {required this.accountId,
      required this.accountName,
      required this.currency,
      required this.currentBalance,
      required final List<AccountHistory> history})
      : _history = history;
  factory _AccountHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountHistoryResponseFromJson(json);

  @override
  final int accountId;
  @override
  final String accountName;
  @override
  final String currency;
  @override
  final Decimal currentBalance;
  final List<AccountHistory> _history;
  @override
  List<AccountHistory> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  /// Create a copy of AccountHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountHistoryResponseCopyWith<_AccountHistoryResponse> get copyWith =>
      __$AccountHistoryResponseCopyWithImpl<_AccountHistoryResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AccountHistoryResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountHistoryResponse &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accountId, accountName, currency,
      currentBalance, const DeepCollectionEquality().hash(_history));

  @override
  String toString() {
    return 'AccountHistoryResponse(accountId: $accountId, accountName: $accountName, currency: $currency, currentBalance: $currentBalance, history: $history)';
  }
}

/// @nodoc
abstract mixin class _$AccountHistoryResponseCopyWith<$Res>
    implements $AccountHistoryResponseCopyWith<$Res> {
  factory _$AccountHistoryResponseCopyWith(_AccountHistoryResponse value,
          $Res Function(_AccountHistoryResponse) _then) =
      __$AccountHistoryResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int accountId,
      String accountName,
      String currency,
      Decimal currentBalance,
      List<AccountHistory> history});
}

/// @nodoc
class __$AccountHistoryResponseCopyWithImpl<$Res>
    implements _$AccountHistoryResponseCopyWith<$Res> {
  __$AccountHistoryResponseCopyWithImpl(this._self, this._then);

  final _AccountHistoryResponse _self;
  final $Res Function(_AccountHistoryResponse) _then;

  /// Create a copy of AccountHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accountId = null,
    Object? accountName = null,
    Object? currency = null,
    Object? currentBalance = null,
    Object? history = null,
  }) {
    return _then(_AccountHistoryResponse(
      accountId: null == accountId
          ? _self.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      accountName: null == accountName
          ? _self.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currentBalance: null == currentBalance
          ? _self.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as Decimal,
      history: null == history
          ? _self._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<AccountHistory>,
    ));
  }
}

// dart format on
