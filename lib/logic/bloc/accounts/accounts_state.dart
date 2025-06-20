part of 'accounts_bloc.dart';

@freezed
abstract class AccountsState with _$AccountsState {
  const factory AccountsState.initial() = InitialAccountsState;
  const factory AccountsState.loading() = LoadingAccountsState;
  const factory AccountsState.notSelected({
    required final List<Account> accounts,
  }) = NotSelectedAccountsState;
  const factory AccountsState.selected({
    required final Account selectedAccount,
    required final List<Account> accounts,
  }) = SelectedAccountsState;
  const factory AccountsState.error({
    required final String errorMessage,
  }) = ErrorAccountsState;
}

// extension on SelectedAccountsState to have a currency symbol getter
extension SelectedAccountsStateExtension on SelectedAccountsState {
  String get currencySymbol {
    switch (selectedAccount.currency) {
      case 'USD':
        return r'$';
      case 'RUB':
        return '₽';
      case 'EUR':
        return '€';
      default:
        return selectedAccount.currency;
    }
  }
}
