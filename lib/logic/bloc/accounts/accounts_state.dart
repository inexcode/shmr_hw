part of 'accounts_bloc.dart';

@freezed
abstract class AccountsState with _$AccountsState {
  const factory AccountsState.initial() = InitialAccountsState;
  const factory AccountsState.loading() = LoadingAccountsState;
  const factory AccountsState.notSelected({
    required final List<Account> accounts,
    required final bool fromCache,
    final String? syncErrorMessage,
  }) = NotSelectedAccountsState;
  const factory AccountsState.selected({
    required final Account selectedAccount,
    required final List<Account> accounts,
    required final bool isUpdating,
  }) = SelectedAccountsState;
  const factory AccountsState.error({required final String errorMessage}) =
      ErrorAccountsState;
}

// extension on SelectedAccountsState to have a currency symbol getter
extension SelectedAccountsStateExtension on SelectedAccountsState {
  String get currencySymbol {
    try {
      return Currency.fromString(selectedAccount.currency).symbol;
    } on UnknownCurrencyException {
      return selectedAccount.currency;
    }
  }

  Account? accountById(final int id) =>
      accounts.firstWhereOrNull((final account) => account.id == id);
}
