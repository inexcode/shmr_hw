part of 'accounts_bloc.dart';

@freezed
class AccountsEvent with _$AccountsEvent {
  const factory AccountsEvent.loadAccounts() = _LoadAccounts;
  const factory AccountsEvent.selectAccount({
    required final Account account,
  }) = _SelectAccount;
  const factory AccountsEvent.deselectAccount() = _DeselectAccount;
}
