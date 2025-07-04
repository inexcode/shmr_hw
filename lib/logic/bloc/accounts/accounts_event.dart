part of 'accounts_bloc.dart';

@freezed
class AccountsEvent with _$AccountsEvent {
  const factory AccountsEvent.loadAccounts() = LoadAccounts;
  const factory AccountsEvent.selectAccount({required final Account account}) =
      SelectAccount;
  const factory AccountsEvent.deselectAccount() = DeselectAccount;
  const factory AccountsEvent.renameAccount({required final String newName}) =
      RenameAccount;
  const factory AccountsEvent.changeCurrency({
    required final String newCurrency,
  }) = ChangeCurrency;
}
