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

class LoadAccounts implements AccountsEvent {
  const LoadAccounts();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadAccounts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AccountsEvent.loadAccounts()';
  }
}

/// @nodoc

class SelectAccount implements AccountsEvent {
  const SelectAccount({required this.account});

  final Account account;

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectAccountCopyWith<SelectAccount> get copyWith =>
      _$SelectAccountCopyWithImpl<SelectAccount>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectAccount &&
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
abstract mixin class $SelectAccountCopyWith<$Res>
    implements $AccountsEventCopyWith<$Res> {
  factory $SelectAccountCopyWith(
          SelectAccount value, $Res Function(SelectAccount) _then) =
      _$SelectAccountCopyWithImpl;
  @useResult
  $Res call({Account account});

  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class _$SelectAccountCopyWithImpl<$Res>
    implements $SelectAccountCopyWith<$Res> {
  _$SelectAccountCopyWithImpl(this._self, this._then);

  final SelectAccount _self;
  final $Res Function(SelectAccount) _then;

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? account = null,
  }) {
    return _then(SelectAccount(
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

class DeselectAccount implements AccountsEvent {
  const DeselectAccount();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeselectAccount);
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

class InitialAccountsState implements AccountsState {
  const InitialAccountsState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitialAccountsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AccountsState.initial()';
  }
}

/// @nodoc

class LoadingAccountsState implements AccountsState {
  const LoadingAccountsState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingAccountsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AccountsState.loading()';
  }
}

/// @nodoc

class NotSelectedAccountsState implements AccountsState {
  const NotSelectedAccountsState({required final List<Account> accounts})
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
  $NotSelectedAccountsStateCopyWith<NotSelectedAccountsState> get copyWith =>
      _$NotSelectedAccountsStateCopyWithImpl<NotSelectedAccountsState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotSelectedAccountsState &&
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
abstract mixin class $NotSelectedAccountsStateCopyWith<$Res>
    implements $AccountsStateCopyWith<$Res> {
  factory $NotSelectedAccountsStateCopyWith(NotSelectedAccountsState value,
          $Res Function(NotSelectedAccountsState) _then) =
      _$NotSelectedAccountsStateCopyWithImpl;
  @useResult
  $Res call({List<Account> accounts});
}

/// @nodoc
class _$NotSelectedAccountsStateCopyWithImpl<$Res>
    implements $NotSelectedAccountsStateCopyWith<$Res> {
  _$NotSelectedAccountsStateCopyWithImpl(this._self, this._then);

  final NotSelectedAccountsState _self;
  final $Res Function(NotSelectedAccountsState) _then;

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accounts = null,
  }) {
    return _then(NotSelectedAccountsState(
      accounts: null == accounts
          ? _self._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
    ));
  }
}

/// @nodoc

class SelectedAccountsState implements AccountsState {
  const SelectedAccountsState(
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
  $SelectedAccountsStateCopyWith<SelectedAccountsState> get copyWith =>
      _$SelectedAccountsStateCopyWithImpl<SelectedAccountsState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectedAccountsState &&
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
abstract mixin class $SelectedAccountsStateCopyWith<$Res>
    implements $AccountsStateCopyWith<$Res> {
  factory $SelectedAccountsStateCopyWith(SelectedAccountsState value,
          $Res Function(SelectedAccountsState) _then) =
      _$SelectedAccountsStateCopyWithImpl;
  @useResult
  $Res call({Account selectedAccount, List<Account> accounts});

  $AccountCopyWith<$Res> get selectedAccount;
}

/// @nodoc
class _$SelectedAccountsStateCopyWithImpl<$Res>
    implements $SelectedAccountsStateCopyWith<$Res> {
  _$SelectedAccountsStateCopyWithImpl(this._self, this._then);

  final SelectedAccountsState _self;
  final $Res Function(SelectedAccountsState) _then;

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedAccount = null,
    Object? accounts = null,
  }) {
    return _then(SelectedAccountsState(
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

class ErrorAccountsState implements AccountsState {
  const ErrorAccountsState({required this.errorMessage});

  final String errorMessage;

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorAccountsStateCopyWith<ErrorAccountsState> get copyWith =>
      _$ErrorAccountsStateCopyWithImpl<ErrorAccountsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorAccountsState &&
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
abstract mixin class $ErrorAccountsStateCopyWith<$Res>
    implements $AccountsStateCopyWith<$Res> {
  factory $ErrorAccountsStateCopyWith(
          ErrorAccountsState value, $Res Function(ErrorAccountsState) _then) =
      _$ErrorAccountsStateCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class _$ErrorAccountsStateCopyWithImpl<$Res>
    implements $ErrorAccountsStateCopyWith<$Res> {
  _$ErrorAccountsStateCopyWithImpl(this._self, this._then);

  final ErrorAccountsState _self;
  final $Res Function(ErrorAccountsState) _then;

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(ErrorAccountsState(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
