import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shmr_hw/logic/bloc/accounts/accounts_bloc.dart';
import 'package:shmr_hw/logic/models/enums.dart';
import 'package:shmr_hw/logic/repositories/abstract/accounts.dart';
import 'package:shmr_hw/logic/repositories/drift/accounts.dart';

import '../../../helpers/test_helpers.dart';

class MockAccountsRepository extends Mock implements AccountsRepository {}

class MockDriftAccountsRepository extends Mock
    implements DriftAccountsRepository {}

void main() {
  group('AccountsBloc', () {
    late MockAccountsRepository mockRemoteRepository;
    late MockDriftAccountsRepository mockLocalRepository;

    setUpAll(() {
      // Register fallback values for any() matchers
      registerFallbackValue(
        TestHelpers.createTestAccount(
          id: 0,
          name: 'Fallback',
          balance: 0,
          currency: Currency.usd,
        ),
      );
      registerFallbackValue(
        TestHelpers.createTestAccountRequest(
          name: 'Fallback',
          currency: 'USD',
          balance: TestHelpers.createTestAccount(
            id: 0,
            name: 'test',
            balance: 0,
            currency: Currency.usd,
          ).balance,
        ),
      );
    });

    setUp(() {
      mockRemoteRepository = MockAccountsRepository();
      mockLocalRepository = MockDriftAccountsRepository();
    });

    group('LoadAccounts', () {
      final testAccounts = [
        TestHelpers.createTestAccount(
          id: 1,
          name: 'Test Account 1',
          balance: 1000,
          currency: Currency.usd,
        ),
        TestHelpers.createTestAccount(
          id: 2,
          name: 'Test Account 2',
          balance: 500,
          currency: Currency.eur,
        ),
      ];

      blocTest<AccountsBloc, AccountsState>(
        'emits loading then notSelected state when loading accounts succeeds',
        setUp: () {
          when(
            () => mockLocalRepository.fetchAccounts(),
          ).thenAnswer((_) async => testAccounts);
          when(
            () => mockRemoteRepository.fetchAccounts(),
          ).thenAnswer((_) async => testAccounts);
          when(
            () => mockLocalRepository.saveAccounts(
              accounts: any(named: 'accounts'),
            ),
          ).thenAnswer((_) async {});
          when(
            () => mockLocalRepository.updateAccount(
              id: any(named: 'id'),
              request: any(named: 'request'),
            ),
          ).thenAnswer((_) async => testAccounts.first);
        },
        build: () => AccountsBloc(
          accountsRepository: mockRemoteRepository,
          localAccountsRepository: mockLocalRepository,
        ),
        act: (final bloc) => bloc.add(const AccountsEvent.loadAccounts()),
        expect: () => [
          const AccountsState.loading(),
          AccountsState.notSelected(accounts: testAccounts, fromCache: true),
          AccountsState.notSelected(accounts: testAccounts, fromCache: false),
        ],
        verify: (_) {
          verify(() => mockLocalRepository.fetchAccounts()).called(1);
          verify(() => mockRemoteRepository.fetchAccounts()).called(1);
        },
      );

      blocTest<AccountsBloc, AccountsState>(
        'emits loading then notSelected state with sync error when remote loading fails',
        setUp: () {
          when(
            () => mockLocalRepository.fetchAccounts(),
          ).thenAnswer((_) async => testAccounts);
          when(
            () => mockRemoteRepository.fetchAccounts(),
          ).thenThrow(Exception('Network error'));
        },
        build: () => AccountsBloc(
          accountsRepository: mockRemoteRepository,
          localAccountsRepository: mockLocalRepository,
        ),
        act: (final bloc) => bloc.add(const AccountsEvent.loadAccounts()),
        expect: () => [
          const AccountsState.loading(),
          AccountsState.notSelected(accounts: testAccounts, fromCache: true),
          AccountsState.notSelected(
            accounts: testAccounts,
            fromCache: true,
            syncErrorMessage:
                'Failed to sync transactions: Exception: Network error',
          ),
        ],
        verify: (_) {
          verify(() => mockLocalRepository.fetchAccounts()).called(1);
          verify(() => mockRemoteRepository.fetchAccounts()).called(1);
        },
      );

      blocTest<AccountsBloc, AccountsState>(
        'emits loading then error state when local loading fails',
        setUp: () {
          when(
            () => mockLocalRepository.fetchAccounts(),
          ).thenThrow(Exception('Database error'));
        },
        build: () => AccountsBloc(
          accountsRepository: mockRemoteRepository,
          localAccountsRepository: mockLocalRepository,
        ),
        act: (final bloc) => bloc.add(const AccountsEvent.loadAccounts()),
        expect: () => [
          const AccountsState.loading(),
          const AccountsState.error(errorMessage: 'Exception: Database error'),
        ],
        verify: (_) {
          verify(() => mockLocalRepository.fetchAccounts()).called(1);
        },
      );

      blocTest<AccountsBloc, AccountsState>(
        'syncs new accounts from remote to local',
        setUp: () {
          final localAccounts = [
            testAccounts.first,
          ]; // Only first account locally
          final remoteAccounts = testAccounts; // Both accounts remotely

          when(
            () => mockLocalRepository.fetchAccounts(),
          ).thenAnswer((_) async => localAccounts);
          when(
            () => mockRemoteRepository.fetchAccounts(),
          ).thenAnswer((_) async => remoteAccounts);
          when(
            () => mockLocalRepository.saveAccounts(
              accounts: any(named: 'accounts'),
            ),
          ).thenAnswer((_) async {});
          when(
            () => mockLocalRepository.updateAccount(
              id: any(named: 'id'),
              request: any(named: 'request'),
            ),
          ).thenAnswer((_) async => testAccounts.first);
        },
        build: () => AccountsBloc(
          accountsRepository: mockRemoteRepository,
          localAccountsRepository: mockLocalRepository,
        ),
        act: (final bloc) => bloc.add(const AccountsEvent.loadAccounts()),
        verify: (_) {
          // Should save new accounts (the second account in this case)
          verify(
            () => mockLocalRepository.saveAccounts(
              accounts: any(named: 'accounts'),
            ),
          ).called(1);
          // Should update existing account
          verify(
            () => mockLocalRepository.updateAccount(
              id: any(named: 'id'),
              request: any(named: 'request'),
            ),
          ).called(1);
        },
      );
    });

    group('SelectAccount', () {
      final testAccounts = [
        TestHelpers.createTestAccount(
          id: 1,
          name: 'Test Account 1',
          balance: 1000,
          currency: Currency.usd,
        ),
        TestHelpers.createTestAccount(
          id: 2,
          name: 'Test Account 2',
          balance: 500,
          currency: Currency.eur,
        ),
      ];

      blocTest<AccountsBloc, AccountsState>(
        'emits selected state when selecting an account',
        seed: () =>
            AccountsState.notSelected(accounts: testAccounts, fromCache: false),
        build: () => AccountsBloc(
          accountsRepository: mockRemoteRepository,
          localAccountsRepository: mockLocalRepository,
        ),
        act: (final bloc) =>
            bloc.add(AccountsEvent.selectAccount(account: testAccounts.first)),
        expect: () => [
          AccountsState.selected(
            selectedAccount: testAccounts.first,
            accounts: testAccounts,
            isUpdating: false,
          ),
        ],
      );

      blocTest<AccountsBloc, AccountsState>(
        'does not emit when already in selected state',
        seed: () => AccountsState.selected(
          selectedAccount: testAccounts.first,
          accounts: testAccounts,
          isUpdating: false,
        ),
        build: () => AccountsBloc(
          accountsRepository: mockRemoteRepository,
          localAccountsRepository: mockLocalRepository,
        ),
        act: (final bloc) =>
            bloc.add(AccountsEvent.selectAccount(account: testAccounts.first)),
        expect: () => <AccountsState>[],
      );
    });

    group('DeselectAccount', () {
      final testAccounts = [
        TestHelpers.createTestAccount(
          id: 1,
          name: 'Test Account',
          balance: 1000,
          currency: Currency.usd,
        ),
      ];

      blocTest<AccountsBloc, AccountsState>(
        'triggers LoadAccounts when deselecting an account',
        setUp: () {
          when(
            () => mockLocalRepository.fetchAccounts(),
          ).thenAnswer((_) async => testAccounts);
          when(
            () => mockRemoteRepository.fetchAccounts(),
          ).thenAnswer((_) async => testAccounts);
          when(
            () => mockLocalRepository.saveAccounts(
              accounts: any(named: 'accounts'),
            ),
          ).thenAnswer((_) async {});
          when(
            () => mockLocalRepository.updateAccount(
              id: any(named: 'id'),
              request: any(named: 'request'),
            ),
          ).thenAnswer((_) async => testAccounts.first);
        },
        seed: () => AccountsState.selected(
          selectedAccount: testAccounts.first,
          accounts: testAccounts,
          isUpdating: false,
        ),
        build: () => AccountsBloc(
          accountsRepository: mockRemoteRepository,
          localAccountsRepository: mockLocalRepository,
        ),
        act: (final bloc) => bloc.add(const AccountsEvent.deselectAccount()),
        expect: () => [
          AccountsState.notSelected(accounts: testAccounts, fromCache: true),
          AccountsState.notSelected(accounts: testAccounts, fromCache: false),
        ],
      );
    });

    group('RenameAccount', () {
      final testAccount = TestHelpers.createTestAccount(
        id: 1,
        name: 'Old Name',
        balance: 1000,
        currency: Currency.usd,
      );

      final testAccounts = [testAccount];

      blocTest<AccountsBloc, AccountsState>(
        'emits updating then updated state when renaming succeeds',
        setUp: () {
          when(
            () => mockRemoteRepository.updateAccount(
              id: any(named: 'id'),
              request: any(named: 'request'),
            ),
          ).thenAnswer((_) async => testAccount.copyWith(name: 'New Name'));
        },
        seed: () => AccountsState.selected(
          selectedAccount: testAccount,
          accounts: testAccounts,
          isUpdating: false,
        ),
        build: () => AccountsBloc(
          accountsRepository: mockRemoteRepository,
          localAccountsRepository: mockLocalRepository,
        ),
        act: (final bloc) =>
            bloc.add(const AccountsEvent.renameAccount(newName: 'New Name')),
        expect: () => [
          AccountsState.selected(
            selectedAccount: testAccount,
            accounts: testAccounts,
            isUpdating: true,
          ),
          AccountsState.selected(
            selectedAccount: testAccount.copyWith(name: 'New Name'),
            accounts: [testAccount.copyWith(name: 'New Name')],
            isUpdating: false,
          ),
        ],
        verify: (_) {
          verify(
            () => mockRemoteRepository.updateAccount(
              id: testAccount.id,
              request: any(named: 'request'),
            ),
          ).called(1);
        },
      );
    });

    group('ChangeCurrency', () {
      final testAccount = TestHelpers.createTestAccount(
        id: 1,
        name: 'Test Account',
        balance: 1000,
        currency: Currency.usd,
      );

      final testAccounts = [testAccount];

      blocTest<AccountsBloc, AccountsState>(
        'emits updating then updated state when changing currency succeeds',
        setUp: () {
          when(
            () => mockRemoteRepository.updateAccount(
              id: any(named: 'id'),
              request: any(named: 'request'),
            ),
          ).thenAnswer((_) async => testAccount.copyWith(currency: 'EUR'));
        },
        seed: () => AccountsState.selected(
          selectedAccount: testAccount,
          accounts: testAccounts,
          isUpdating: false,
        ),
        build: () => AccountsBloc(
          accountsRepository: mockRemoteRepository,
          localAccountsRepository: mockLocalRepository,
        ),
        act: (final bloc) =>
            bloc.add(const AccountsEvent.changeCurrency(newCurrency: 'EUR')),
        expect: () => [
          AccountsState.selected(
            selectedAccount: testAccount,
            accounts: testAccounts,
            isUpdating: true,
          ),
          AccountsState.selected(
            selectedAccount: testAccount.copyWith(currency: 'EUR'),
            accounts: [testAccount.copyWith(currency: 'EUR')],
            isUpdating: false,
          ),
        ],
        verify: (_) {
          verify(
            () => mockRemoteRepository.updateAccount(
              id: testAccount.id,
              request: any(named: 'request'),
            ),
          ).called(1);
        },
      );
    });

    group('ClearSyncError', () {
      blocTest<AccountsBloc, AccountsState>(
        'clears sync error message',
        seed: () => const AccountsState.notSelected(
          accounts: [],
          fromCache: true,
          syncErrorMessage: 'Sync failed',
        ),
        build: () => AccountsBloc(
          accountsRepository: mockRemoteRepository,
          localAccountsRepository: mockLocalRepository,
        ),
        act: (final bloc) => bloc.add(const AccountsEvent.clearSyncError()),
        expect: () => [
          const AccountsState.notSelected(accounts: [], fromCache: true),
        ],
      );
    });
  });
}
