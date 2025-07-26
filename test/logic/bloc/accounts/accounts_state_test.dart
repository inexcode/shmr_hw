import 'package:flutter_test/flutter_test.dart';
import 'package:shmr_hw/logic/bloc/accounts/accounts_bloc.dart';
import 'package:shmr_hw/logic/models/enums.dart';

import '../../../helpers/test_helpers.dart';

void main() {
  group('SelectedAccountsStateExtension', () {
    group('currencySymbol', () {
      test('returns correct symbol for USD currency', () {
        final account = TestHelpers.createTestAccount(
          id: 1,
          name: 'Test Account',
          balance: 1000,
          currency: Currency.usd,
        );

        final state = SelectedAccountsState(
          selectedAccount: account,
          accounts: [account],
          isUpdating: false,
        );

        expect(state.currencySymbol, r'$');
      });

      test('returns correct symbol for EUR currency', () {
        final account = TestHelpers.createTestAccount(
          id: 1,
          name: 'Test Account',
          balance: 1000,
          currency: Currency.eur,
        );

        final state = SelectedAccountsState(
          selectedAccount: account,
          accounts: [account],
          isUpdating: false,
        );

        expect(state.currencySymbol, '€');
      });

      test('returns correct symbol for RUB currency', () {
        final account = TestHelpers.createTestAccount(
          id: 1,
          name: 'Test Account',
          balance: 1000,
          currency: Currency.rub,
        );

        final state = SelectedAccountsState(
          selectedAccount: account,
          accounts: [account],
          isUpdating: false,
        );

        expect(state.currencySymbol, '₽');
      });

      test('returns currency string for unknown currency', () {
        final account = TestHelpers.createTestAccount(
          id: 1,
          name: 'Test Account',
          balance: 1000,
          currency: Currency.usd,
        ).copyWith(currency: 'UNKNOWN');

        final state = SelectedAccountsState(
          selectedAccount: account,
          accounts: [account],
          isUpdating: false,
        );

        expect(state.currencySymbol, 'UNKNOWN');
      });
    });

    group('accountById', () {
      final accounts = [
        TestHelpers.createTestAccount(
          id: 1,
          name: 'Account 1',
          balance: 1000,
          currency: Currency.usd,
        ),
        TestHelpers.createTestAccount(
          id: 2,
          name: 'Account 2',
          balance: 500,
          currency: Currency.eur,
        ),
        TestHelpers.createTestAccount(
          id: 3,
          name: 'Account 3',
          balance: 750,
          currency: Currency.rub,
        ),
      ];

      test('returns correct account when id exists', () {
        final state = SelectedAccountsState(
          selectedAccount: accounts.first,
          accounts: accounts,
          isUpdating: false,
        );

        final result = state.accountById(2);
        expect(result, equals(accounts[1]));
        expect(result?.name, 'Account 2');
      });

      test('returns null when id does not exist', () {
        final state = SelectedAccountsState(
          selectedAccount: accounts.first,
          accounts: accounts,
          isUpdating: false,
        );

        final result = state.accountById(999);
        expect(result, isNull);
      });

      test('returns null when accounts list is empty', () {
        final state = SelectedAccountsState(
          selectedAccount: accounts.first,
          accounts: [],
          isUpdating: false,
        );

        final result = state.accountById(1);
        expect(result, isNull);
      });
    });
  });

  group('AccountsState', () {
    test('initial state has correct properties', () {
      const state = AccountsState.initial();
      expect(state, isA<InitialAccountsState>());
    });

    test('loading state has correct properties', () {
      const state = AccountsState.loading();
      expect(state, isA<LoadingAccountsState>());
    });

    test('notSelected state has correct properties', () {
      final accounts = TestHelpers.createTestAccountList(count: 2);

      final state = AccountsState.notSelected(
        accounts: accounts,
        fromCache: true,
        syncErrorMessage: 'Test error',
      );

      expect(state, isA<NotSelectedAccountsState>());

      final notSelectedState = state as NotSelectedAccountsState;
      expect(notSelectedState.accounts, equals(accounts));
      expect(notSelectedState.fromCache, isTrue);
      expect(notSelectedState.syncErrorMessage, 'Test error');
    });

    test('selected state has correct properties', () {
      final accounts = TestHelpers.createTestAccountList(count: 2);
      final selectedAccount = accounts.first;

      final state = AccountsState.selected(
        selectedAccount: selectedAccount,
        accounts: accounts,
        isUpdating: true,
      );

      expect(state, isA<SelectedAccountsState>());

      final selectedState = state as SelectedAccountsState;
      expect(selectedState.selectedAccount, equals(selectedAccount));
      expect(selectedState.accounts, equals(accounts));
      expect(selectedState.isUpdating, isTrue);
    });

    test('error state has correct properties', () {
      const errorMessage = 'Test error message';
      const state = AccountsState.error(errorMessage: errorMessage);

      expect(state, isA<ErrorAccountsState>());

      const errorState = state as ErrorAccountsState;
      expect(errorState.errorMessage, errorMessage);
    });
  });

  group('AccountsEvent', () {
    test('loadAccounts event is created correctly', () {
      const event = AccountsEvent.loadAccounts();
      expect(event, isA<LoadAccounts>());
    });

    test('selectAccount event is created correctly', () {
      final account = TestHelpers.createTestAccount(
        id: 1,
        name: 'Test Account',
        balance: 1000,
        currency: Currency.usd,
      );

      final event = AccountsEvent.selectAccount(account: account);
      expect(event, isA<SelectAccount>());

      final selectEvent = event as SelectAccount;
      expect(selectEvent.account, equals(account));
    });

    test('deselectAccount event is created correctly', () {
      const event = AccountsEvent.deselectAccount();
      expect(event, isA<DeselectAccount>());
    });

    test('renameAccount event is created correctly', () {
      const newName = 'New Account Name';
      const event = AccountsEvent.renameAccount(newName: newName);
      expect(event, isA<RenameAccount>());

      const renameEvent = event as RenameAccount;
      expect(renameEvent.newName, newName);
    });

    test('changeCurrency event is created correctly', () {
      const newCurrency = 'EUR';
      const event = AccountsEvent.changeCurrency(newCurrency: newCurrency);
      expect(event, isA<ChangeCurrency>());

      const changeCurrencyEvent = event as ChangeCurrency;
      expect(changeCurrencyEvent.newCurrency, newCurrency);
    });

    test('clearSyncError event is created correctly', () {
      const event = AccountsEvent.clearSyncError();
      expect(event, isA<ClearAccountsSyncError>());
    });
  });
}
