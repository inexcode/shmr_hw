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

class _Account implements Account {
  const _Account(
      {required this.id,
      required this.userId,
      required this.name,
      required this.balance,
      required this.currency,
      required this.createdAt,
      required this.updatedAt});

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

class _AccountRequest extends AccountRequest {
  const _AccountRequest(
      {required this.name, required this.balance, required this.currency})
      : super._();

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
  _$AccountRequestCopyWith<_AccountRequest> get copyWith =>
      __$AccountRequestCopyWithImpl<_AccountRequest>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountRequest &&
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
abstract mixin class _$AccountRequestCopyWith<$Res>
    implements $AccountRequestCopyWith<$Res> {
  factory _$AccountRequestCopyWith(
          _AccountRequest value, $Res Function(_AccountRequest) _then) =
      __$AccountRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String name, Decimal balance, String currency});
}

/// @nodoc
class __$AccountRequestCopyWithImpl<$Res>
    implements _$AccountRequestCopyWith<$Res> {
  __$AccountRequestCopyWithImpl(this._self, this._then);

  final _AccountRequest _self;
  final $Res Function(_AccountRequest) _then;

  /// Create a copy of AccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? balance = null,
    Object? currency = null,
  }) {
    return _then(_AccountRequest(
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
mixin _$AccountDetails {
  int get id;
  String get name;
  Decimal get balance;
  String get currency;
  List<StatItem> get incomeStats;
  List<StatItem> get expenseStats;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of AccountDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountDetailsCopyWith<AccountDetails> get copyWith =>
      _$AccountDetailsCopyWithImpl<AccountDetails>(
          this as AccountDetails, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountDetails &&
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
    return 'AccountDetails(id: $id, name: $name, balance: $balance, currency: $currency, incomeStats: $incomeStats, expenseStats: $expenseStats, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $AccountDetailsCopyWith<$Res> {
  factory $AccountDetailsCopyWith(
          AccountDetails value, $Res Function(AccountDetails) _then) =
      _$AccountDetailsCopyWithImpl;
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
class _$AccountDetailsCopyWithImpl<$Res>
    implements $AccountDetailsCopyWith<$Res> {
  _$AccountDetailsCopyWithImpl(this._self, this._then);

  final AccountDetails _self;
  final $Res Function(AccountDetails) _then;

  /// Create a copy of AccountDetails
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

class _AccountDetails implements AccountDetails {
  const _AccountDetails(
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

  /// Create a copy of AccountDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountDetailsCopyWith<_AccountDetails> get copyWith =>
      __$AccountDetailsCopyWithImpl<_AccountDetails>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountDetails &&
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
    return 'AccountDetails(id: $id, name: $name, balance: $balance, currency: $currency, incomeStats: $incomeStats, expenseStats: $expenseStats, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$AccountDetailsCopyWith<$Res>
    implements $AccountDetailsCopyWith<$Res> {
  factory _$AccountDetailsCopyWith(
          _AccountDetails value, $Res Function(_AccountDetails) _then) =
      __$AccountDetailsCopyWithImpl;
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
class __$AccountDetailsCopyWithImpl<$Res>
    implements _$AccountDetailsCopyWith<$Res> {
  __$AccountDetailsCopyWithImpl(this._self, this._then);

  final _AccountDetails _self;
  final $Res Function(_AccountDetails) _then;

  /// Create a copy of AccountDetails
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
    return _then(_AccountDetails(
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

class _AccountState implements AccountState {
  const _AccountState(
      {required this.id,
      required this.name,
      required this.balance,
      required this.currency});

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
mixin _$AccountHistoryElement {
  int get id;
  int get accountId;
  String get name;
  AccountHistoryChangeType get changeType;
  AccountState? get previousState;
  AccountState get newState;
  DateTime get changeTimestamp;
  DateTime get createdAt;

  /// Create a copy of AccountHistoryElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountHistoryElementCopyWith<AccountHistoryElement> get copyWith =>
      _$AccountHistoryElementCopyWithImpl<AccountHistoryElement>(
          this as AccountHistoryElement, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountHistoryElement &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, accountId, name, changeType,
      previousState, newState, changeTimestamp, createdAt);

  @override
  String toString() {
    return 'AccountHistoryElement(id: $id, accountId: $accountId, name: $name, changeType: $changeType, previousState: $previousState, newState: $newState, changeTimestamp: $changeTimestamp, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $AccountHistoryElementCopyWith<$Res> {
  factory $AccountHistoryElementCopyWith(AccountHistoryElement value,
          $Res Function(AccountHistoryElement) _then) =
      _$AccountHistoryElementCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int accountId,
      String name,
      AccountHistoryChangeType changeType,
      AccountState? previousState,
      AccountState newState,
      DateTime changeTimestamp,
      DateTime createdAt});

  $AccountStateCopyWith<$Res>? get previousState;
  $AccountStateCopyWith<$Res> get newState;
}

/// @nodoc
class _$AccountHistoryElementCopyWithImpl<$Res>
    implements $AccountHistoryElementCopyWith<$Res> {
  _$AccountHistoryElementCopyWithImpl(this._self, this._then);

  final AccountHistoryElement _self;
  final $Res Function(AccountHistoryElement) _then;

  /// Create a copy of AccountHistoryElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? name = null,
    Object? changeType = null,
    Object? previousState = freezed,
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
      previousState: freezed == previousState
          ? _self.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as AccountState?,
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

  /// Create a copy of AccountHistoryElement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountStateCopyWith<$Res>? get previousState {
    if (_self.previousState == null) {
      return null;
    }

    return $AccountStateCopyWith<$Res>(_self.previousState!, (value) {
      return _then(_self.copyWith(previousState: value));
    });
  }

  /// Create a copy of AccountHistoryElement
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

class _AccountHistoryElement implements AccountHistoryElement {
  const _AccountHistoryElement(
      {required this.id,
      required this.accountId,
      required this.name,
      required this.changeType,
      required this.previousState,
      required this.newState,
      required this.changeTimestamp,
      required this.createdAt});

  @override
  final int id;
  @override
  final int accountId;
  @override
  final String name;
  @override
  final AccountHistoryChangeType changeType;
  @override
  final AccountState? previousState;
  @override
  final AccountState newState;
  @override
  final DateTime changeTimestamp;
  @override
  final DateTime createdAt;

  /// Create a copy of AccountHistoryElement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountHistoryElementCopyWith<_AccountHistoryElement> get copyWith =>
      __$AccountHistoryElementCopyWithImpl<_AccountHistoryElement>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountHistoryElement &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, accountId, name, changeType,
      previousState, newState, changeTimestamp, createdAt);

  @override
  String toString() {
    return 'AccountHistoryElement(id: $id, accountId: $accountId, name: $name, changeType: $changeType, previousState: $previousState, newState: $newState, changeTimestamp: $changeTimestamp, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$AccountHistoryElementCopyWith<$Res>
    implements $AccountHistoryElementCopyWith<$Res> {
  factory _$AccountHistoryElementCopyWith(_AccountHistoryElement value,
          $Res Function(_AccountHistoryElement) _then) =
      __$AccountHistoryElementCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int accountId,
      String name,
      AccountHistoryChangeType changeType,
      AccountState? previousState,
      AccountState newState,
      DateTime changeTimestamp,
      DateTime createdAt});

  @override
  $AccountStateCopyWith<$Res>? get previousState;
  @override
  $AccountStateCopyWith<$Res> get newState;
}

/// @nodoc
class __$AccountHistoryElementCopyWithImpl<$Res>
    implements _$AccountHistoryElementCopyWith<$Res> {
  __$AccountHistoryElementCopyWithImpl(this._self, this._then);

  final _AccountHistoryElement _self;
  final $Res Function(_AccountHistoryElement) _then;

  /// Create a copy of AccountHistoryElement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? name = null,
    Object? changeType = null,
    Object? previousState = freezed,
    Object? newState = null,
    Object? changeTimestamp = null,
    Object? createdAt = null,
  }) {
    return _then(_AccountHistoryElement(
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
      previousState: freezed == previousState
          ? _self.previousState
          : previousState // ignore: cast_nullable_to_non_nullable
              as AccountState?,
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

  /// Create a copy of AccountHistoryElement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountStateCopyWith<$Res>? get previousState {
    if (_self.previousState == null) {
      return null;
    }

    return $AccountStateCopyWith<$Res>(_self.previousState!, (value) {
      return _then(_self.copyWith(previousState: value));
    });
  }

  /// Create a copy of AccountHistoryElement
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
mixin _$AccountHistory {
  int get accountId;
  String get accountName;
  String get currency;
  Decimal get currentBalance;
  List<AccountHistoryElement> get history;

  /// Create a copy of AccountHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountHistoryCopyWith<AccountHistory> get copyWith =>
      _$AccountHistoryCopyWithImpl<AccountHistory>(
          this as AccountHistory, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountHistory &&
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

  @override
  int get hashCode => Object.hash(runtimeType, accountId, accountName, currency,
      currentBalance, const DeepCollectionEquality().hash(history));

  @override
  String toString() {
    return 'AccountHistory(accountId: $accountId, accountName: $accountName, currency: $currency, currentBalance: $currentBalance, history: $history)';
  }
}

/// @nodoc
abstract mixin class $AccountHistoryCopyWith<$Res> {
  factory $AccountHistoryCopyWith(
          AccountHistory value, $Res Function(AccountHistory) _then) =
      _$AccountHistoryCopyWithImpl;
  @useResult
  $Res call(
      {int accountId,
      String accountName,
      String currency,
      Decimal currentBalance,
      List<AccountHistoryElement> history});
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
              as List<AccountHistoryElement>,
    ));
  }
}

/// @nodoc

class _AccountHistory implements AccountHistory {
  const _AccountHistory(
      {required this.accountId,
      required this.accountName,
      required this.currency,
      required this.currentBalance,
      required final List<AccountHistoryElement> history})
      : _history = history;

  @override
  final int accountId;
  @override
  final String accountName;
  @override
  final String currency;
  @override
  final Decimal currentBalance;
  final List<AccountHistoryElement> _history;
  @override
  List<AccountHistoryElement> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  /// Create a copy of AccountHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountHistoryCopyWith<_AccountHistory> get copyWith =>
      __$AccountHistoryCopyWithImpl<_AccountHistory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountHistory &&
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

  @override
  int get hashCode => Object.hash(runtimeType, accountId, accountName, currency,
      currentBalance, const DeepCollectionEquality().hash(_history));

  @override
  String toString() {
    return 'AccountHistory(accountId: $accountId, accountName: $accountName, currency: $currency, currentBalance: $currentBalance, history: $history)';
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
      {int accountId,
      String accountName,
      String currency,
      Decimal currentBalance,
      List<AccountHistoryElement> history});
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
    Object? accountId = null,
    Object? accountName = null,
    Object? currency = null,
    Object? currentBalance = null,
    Object? history = null,
  }) {
    return _then(_AccountHistory(
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
              as List<AccountHistoryElement>,
    ));
  }
}

// dart format on
