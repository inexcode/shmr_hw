part of 'accounts_bloc.dart';

@freezed
class AccountsEvent with _$AccountsEvent {
  const factory AccountsEvent.loadAccounts() = LoadAccounts;
  const factory AccountsEvent.selectAccount({
    required final Account account,
  }) = SelectAccount;
  const factory AccountsEvent.deselectAccount() = DeselectAccount;
}
