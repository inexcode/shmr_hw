// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AccountsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AccountsEvent()';
  }
}

/// @nodoc
class $AccountsEventCopyWith<$Res> {
  $AccountsEventCopyWith(AccountsEvent _, $Res Function(AccountsEvent) __);
}

/// @nodoc

class _LoadAccounts implements AccountsEvent {
  const _LoadAccounts();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadAccounts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AccountsEvent.loadAccounts()';
  }
}

/// @nodoc

class _SelectAccount implements AccountsEvent {
  const _SelectAccount({required this.account});

  final Account account;

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectAccountCopyWith<_SelectAccount> get copyWith =>
      __$SelectAccountCopyWithImpl<_SelectAccount>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectAccount &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  @override
  String toString() {
    return 'AccountsEvent.selectAccount(account: $account)';
  }
}

/// @nodoc
abstract mixin class _$SelectAccountCopyWith<$Res>
    implements $AccountsEventCopyWith<$Res> {
  factory _$SelectAccountCopyWith(
          _SelectAccount value, $Res Function(_SelectAccount) _then) =
      __$SelectAccountCopyWithImpl;
  @useResult
  $Res call({Account account});

  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$SelectAccountCopyWithImpl<$Res>
    implements _$SelectAccountCopyWith<$Res> {
  __$SelectAccountCopyWithImpl(this._self, this._then);

  final _SelectAccount _self;
  final $Res Function(_SelectAccount) _then;

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? account = null,
  }) {
    return _then(_SelectAccount(
      account: null == account
          ? _self.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
    ));
  }

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_self.account, (value) {
      return _then(_self.copyWith(account: value));
    });
  }
}

/// @nodoc

class _DeselectAccount implements AccountsEvent {
  const _DeselectAccount();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DeselectAccount);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AccountsEvent.deselectAccount()';
  }
}

/// @nodoc
mixin _$AccountsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AccountsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AccountsState()';
  }
}

/// @nodoc
class $AccountsStateCopyWith<$Res> {
  $AccountsStateCopyWith(AccountsState _, $Res Function(AccountsState) __);
}

/// @nodoc

class _Initial implements AccountsState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AccountsState.initial()';
  }
}

/// @nodoc

class _Loading implements AccountsState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AccountsState.loading()';
  }
}

/// @nodoc

class _NotSelected implements AccountsState {
  const _NotSelected({required final List<Account> accounts})
      : _accounts = accounts;

  final List<Account> _accounts;
  List<Account> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotSelectedCopyWith<_NotSelected> get copyWith =>
      __$NotSelectedCopyWithImpl<_NotSelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotSelected &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_accounts));

  @override
  String toString() {
    return 'AccountsState.notSelected(accounts: $accounts)';
  }
}

/// @nodoc
abstract mixin class _$NotSelectedCopyWith<$Res>
    implements $AccountsStateCopyWith<$Res> {
  factory _$NotSelectedCopyWith(
          _NotSelected value, $Res Function(_NotSelected) _then) =
      __$NotSelectedCopyWithImpl;
  @useResult
  $Res call({List<Account> accounts});
}

/// @nodoc
class __$NotSelectedCopyWithImpl<$Res> implements _$NotSelectedCopyWith<$Res> {
  __$NotSelectedCopyWithImpl(this._self, this._then);

  final _NotSelected _self;
  final $Res Function(_NotSelected) _then;

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accounts = null,
  }) {
    return _then(_NotSelected(
      accounts: null == accounts
          ? _self._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
    ));
  }
}

/// @nodoc

class _Selected implements AccountsState {
  const _Selected(
      {required this.selectedAccount, required final List<Account> accounts})
      : _accounts = accounts;

  final Account selectedAccount;
  final List<Account> _accounts;
  List<Account> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectedCopyWith<_Selected> get copyWith =>
      __$SelectedCopyWithImpl<_Selected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Selected &&
            (identical(other.selectedAccount, selectedAccount) ||
                other.selectedAccount == selectedAccount) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedAccount,
      const DeepCollectionEquality().hash(_accounts));

  @override
  String toString() {
    return 'AccountsState.selected(selectedAccount: $selectedAccount, accounts: $accounts)';
  }
}

/// @nodoc
abstract mixin class _$SelectedCopyWith<$Res>
    implements $AccountsStateCopyWith<$Res> {
  factory _$SelectedCopyWith(_Selected value, $Res Function(_Selected) _then) =
      __$SelectedCopyWithImpl;
  @useResult
  $Res call({Account selectedAccount, List<Account> accounts});

  $AccountCopyWith<$Res> get selectedAccount;
}

/// @nodoc
class __$SelectedCopyWithImpl<$Res> implements _$SelectedCopyWith<$Res> {
  __$SelectedCopyWithImpl(this._self, this._then);

  final _Selected _self;
  final $Res Function(_Selected) _then;

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedAccount = null,
    Object? accounts = null,
  }) {
    return _then(_Selected(
      selectedAccount: null == selectedAccount
          ? _self.selectedAccount
          : selectedAccount // ignore: cast_nullable_to_non_nullable
              as Account,
      accounts: null == accounts
          ? _self._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
    ));
  }

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get selectedAccount {
    return $AccountCopyWith<$Res>(_self.selectedAccount, (value) {
      return _then(_self.copyWith(selectedAccount: value));
    });
  }
}

/// @nodoc

class _Error implements AccountsState {
  const _Error({required this.errorMessage});

  final String errorMessage;

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'AccountsState.error(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $AccountsStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_Error(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
