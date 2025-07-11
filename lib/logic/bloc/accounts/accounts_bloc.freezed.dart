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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountsEvent()';
}


}

/// @nodoc
class $AccountsEventCopyWith<$Res>  {
$AccountsEventCopyWith(AccountsEvent _, $Res Function(AccountsEvent) __);
}


/// @nodoc


class LoadAccounts implements AccountsEvent {
  const LoadAccounts();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadAccounts);
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
  

 final  Account account;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectAccountCopyWith<SelectAccount> get copyWith => _$SelectAccountCopyWithImpl<SelectAccount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectAccount&&(identical(other.account, account) || other.account == account));
}


@override
int get hashCode => Object.hash(runtimeType,account);

@override
String toString() {
  return 'AccountsEvent.selectAccount(account: $account)';
}


}

/// @nodoc
abstract mixin class $SelectAccountCopyWith<$Res> implements $AccountsEventCopyWith<$Res> {
  factory $SelectAccountCopyWith(SelectAccount value, $Res Function(SelectAccount) _then) = _$SelectAccountCopyWithImpl;
@useResult
$Res call({
 Account account
});


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
@pragma('vm:prefer-inline') $Res call({Object? account = null,}) {
  return _then(SelectAccount(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeselectAccount);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountsEvent.deselectAccount()';
}


}




/// @nodoc


class RenameAccount implements AccountsEvent {
  const RenameAccount({required this.newName});
  

 final  String newName;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenameAccountCopyWith<RenameAccount> get copyWith => _$RenameAccountCopyWithImpl<RenameAccount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenameAccount&&(identical(other.newName, newName) || other.newName == newName));
}


@override
int get hashCode => Object.hash(runtimeType,newName);

@override
String toString() {
  return 'AccountsEvent.renameAccount(newName: $newName)';
}


}

/// @nodoc
abstract mixin class $RenameAccountCopyWith<$Res> implements $AccountsEventCopyWith<$Res> {
  factory $RenameAccountCopyWith(RenameAccount value, $Res Function(RenameAccount) _then) = _$RenameAccountCopyWithImpl;
@useResult
$Res call({
 String newName
});




}
/// @nodoc
class _$RenameAccountCopyWithImpl<$Res>
    implements $RenameAccountCopyWith<$Res> {
  _$RenameAccountCopyWithImpl(this._self, this._then);

  final RenameAccount _self;
  final $Res Function(RenameAccount) _then;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newName = null,}) {
  return _then(RenameAccount(
newName: null == newName ? _self.newName : newName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChangeCurrency implements AccountsEvent {
  const ChangeCurrency({required this.newCurrency});
  

 final  String newCurrency;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeCurrencyCopyWith<ChangeCurrency> get copyWith => _$ChangeCurrencyCopyWithImpl<ChangeCurrency>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeCurrency&&(identical(other.newCurrency, newCurrency) || other.newCurrency == newCurrency));
}


@override
int get hashCode => Object.hash(runtimeType,newCurrency);

@override
String toString() {
  return 'AccountsEvent.changeCurrency(newCurrency: $newCurrency)';
}


}

/// @nodoc
abstract mixin class $ChangeCurrencyCopyWith<$Res> implements $AccountsEventCopyWith<$Res> {
  factory $ChangeCurrencyCopyWith(ChangeCurrency value, $Res Function(ChangeCurrency) _then) = _$ChangeCurrencyCopyWithImpl;
@useResult
$Res call({
 String newCurrency
});




}
/// @nodoc
class _$ChangeCurrencyCopyWithImpl<$Res>
    implements $ChangeCurrencyCopyWith<$Res> {
  _$ChangeCurrencyCopyWithImpl(this._self, this._then);

  final ChangeCurrency _self;
  final $Res Function(ChangeCurrency) _then;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newCurrency = null,}) {
  return _then(ChangeCurrency(
newCurrency: null == newCurrency ? _self.newCurrency : newCurrency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearAccountsSyncError implements AccountsEvent {
  const ClearAccountsSyncError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearAccountsSyncError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountsEvent.clearSyncError()';
}


}




/// @nodoc
mixin _$AccountsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountsState()';
}


}

/// @nodoc
class $AccountsStateCopyWith<$Res>  {
$AccountsStateCopyWith(AccountsState _, $Res Function(AccountsState) __);
}


/// @nodoc


class InitialAccountsState implements AccountsState {
  const InitialAccountsState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialAccountsState);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingAccountsState);
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
  const NotSelectedAccountsState({required final  List<Account> accounts, required this.fromCache, this.syncErrorMessage}): _accounts = accounts;
  

 final  List<Account> _accounts;
 List<Account> get accounts {
  if (_accounts is EqualUnmodifiableListView) return _accounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accounts);
}

 final  bool fromCache;
 final  String? syncErrorMessage;

/// Create a copy of AccountsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotSelectedAccountsStateCopyWith<NotSelectedAccountsState> get copyWith => _$NotSelectedAccountsStateCopyWithImpl<NotSelectedAccountsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotSelectedAccountsState&&const DeepCollectionEquality().equals(other._accounts, _accounts)&&(identical(other.fromCache, fromCache) || other.fromCache == fromCache)&&(identical(other.syncErrorMessage, syncErrorMessage) || other.syncErrorMessage == syncErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_accounts),fromCache,syncErrorMessage);

@override
String toString() {
  return 'AccountsState.notSelected(accounts: $accounts, fromCache: $fromCache, syncErrorMessage: $syncErrorMessage)';
}


}

/// @nodoc
abstract mixin class $NotSelectedAccountsStateCopyWith<$Res> implements $AccountsStateCopyWith<$Res> {
  factory $NotSelectedAccountsStateCopyWith(NotSelectedAccountsState value, $Res Function(NotSelectedAccountsState) _then) = _$NotSelectedAccountsStateCopyWithImpl;
@useResult
$Res call({
 List<Account> accounts, bool fromCache, String? syncErrorMessage
});




}
/// @nodoc
class _$NotSelectedAccountsStateCopyWithImpl<$Res>
    implements $NotSelectedAccountsStateCopyWith<$Res> {
  _$NotSelectedAccountsStateCopyWithImpl(this._self, this._then);

  final NotSelectedAccountsState _self;
  final $Res Function(NotSelectedAccountsState) _then;

/// Create a copy of AccountsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accounts = null,Object? fromCache = null,Object? syncErrorMessage = freezed,}) {
  return _then(NotSelectedAccountsState(
accounts: null == accounts ? _self._accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<Account>,fromCache: null == fromCache ? _self.fromCache : fromCache // ignore: cast_nullable_to_non_nullable
as bool,syncErrorMessage: freezed == syncErrorMessage ? _self.syncErrorMessage : syncErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SelectedAccountsState implements AccountsState {
  const SelectedAccountsState({required this.selectedAccount, required final  List<Account> accounts, required this.isUpdating}): _accounts = accounts;
  

 final  Account selectedAccount;
 final  List<Account> _accounts;
 List<Account> get accounts {
  if (_accounts is EqualUnmodifiableListView) return _accounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accounts);
}

 final  bool isUpdating;

/// Create a copy of AccountsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedAccountsStateCopyWith<SelectedAccountsState> get copyWith => _$SelectedAccountsStateCopyWithImpl<SelectedAccountsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedAccountsState&&(identical(other.selectedAccount, selectedAccount) || other.selectedAccount == selectedAccount)&&const DeepCollectionEquality().equals(other._accounts, _accounts)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating));
}


@override
int get hashCode => Object.hash(runtimeType,selectedAccount,const DeepCollectionEquality().hash(_accounts),isUpdating);

@override
String toString() {
  return 'AccountsState.selected(selectedAccount: $selectedAccount, accounts: $accounts, isUpdating: $isUpdating)';
}


}

/// @nodoc
abstract mixin class $SelectedAccountsStateCopyWith<$Res> implements $AccountsStateCopyWith<$Res> {
  factory $SelectedAccountsStateCopyWith(SelectedAccountsState value, $Res Function(SelectedAccountsState) _then) = _$SelectedAccountsStateCopyWithImpl;
@useResult
$Res call({
 Account selectedAccount, List<Account> accounts, bool isUpdating
});


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
@pragma('vm:prefer-inline') $Res call({Object? selectedAccount = null,Object? accounts = null,Object? isUpdating = null,}) {
  return _then(SelectedAccountsState(
selectedAccount: null == selectedAccount ? _self.selectedAccount : selectedAccount // ignore: cast_nullable_to_non_nullable
as Account,accounts: null == accounts ? _self._accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<Account>,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,
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
  

 final  String errorMessage;

/// Create a copy of AccountsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorAccountsStateCopyWith<ErrorAccountsState> get copyWith => _$ErrorAccountsStateCopyWithImpl<ErrorAccountsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorAccountsState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'AccountsState.error(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorAccountsStateCopyWith<$Res> implements $AccountsStateCopyWith<$Res> {
  factory $ErrorAccountsStateCopyWith(ErrorAccountsState value, $Res Function(ErrorAccountsState) _then) = _$ErrorAccountsStateCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$ErrorAccountsStateCopyWithImpl<$Res>
    implements $ErrorAccountsStateCopyWith<$Res> {
  _$ErrorAccountsStateCopyWithImpl(this._self, this._then);

  final ErrorAccountsState _self;
  final $Res Function(ErrorAccountsState) _then;

/// Create a copy of AccountsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(ErrorAccountsState(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
