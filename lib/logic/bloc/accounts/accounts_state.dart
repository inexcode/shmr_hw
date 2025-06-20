part of 'accounts_bloc.dart';

@freezed
abstract class AccountsState with _$AccountsState {
  const factory AccountsState.initial() = _Initial;
  const factory AccountsState.loading() = _Loading;
  const factory AccountsState.notSelected({
    required final List<Account> accounts,
  }) = _NotSelected;
  const factory AccountsState.selected({
    required final Account selectedAccount,
    required final List<Account> accounts,
  }) = _Selected;
  const factory AccountsState.error({
    required final String errorMessage,
  }) = _Error;
}
