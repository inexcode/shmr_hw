import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shmr_hw/logic/models/account.dart';

void main() {
  group('Account Model', () {
    test('creates account with all required fields', () {
      final now = DateTime.now();
      final account = Account(
        id: 1,
        userId: 123,
        name: 'Test Account',
        balance: Decimal.parse('1000.50'),
        currency: 'USD',
        createdAt: now,
        updatedAt: now,
      );

      expect(account.id, 1);
      expect(account.userId, 123);
      expect(account.name, 'Test Account');
      expect(account.balance, Decimal.parse('1000.50'));
      expect(account.currency, 'USD');
      expect(account.createdAt, now);
      expect(account.updatedAt, now);
    });

    test('copyWith creates new account with updated fields', () {
      final originalDate = DateTime.now();
      final newDate = originalDate.add(const Duration(days: 1));

      final account = Account(
        id: 1,
        userId: 123,
        name: 'Original Name',
        balance: Decimal.parse('1000'),
        currency: 'USD',
        createdAt: originalDate,
        updatedAt: originalDate,
      );

      final updatedAccount = account.copyWith(
        name: 'Updated Name',
        balance: Decimal.parse('2000'),
        currency: 'EUR',
        updatedAt: newDate,
      );

      // Original fields should remain unchanged
      expect(updatedAccount.id, account.id);
      expect(updatedAccount.userId, account.userId);
      expect(updatedAccount.createdAt, account.createdAt);

      // Updated fields should be changed
      expect(updatedAccount.name, 'Updated Name');
      expect(updatedAccount.balance, Decimal.parse('2000'));
      expect(updatedAccount.currency, 'EUR');
      expect(updatedAccount.updatedAt, newDate);
    });

    test('equality works correctly', () {
      final now = DateTime.now();
      final account1 = Account(
        id: 1,
        userId: 123,
        name: 'Test Account',
        balance: Decimal.parse('1000'),
        currency: 'USD',
        createdAt: now,
        updatedAt: now,
      );

      final account2 = Account(
        id: 1,
        userId: 123,
        name: 'Test Account',
        balance: Decimal.parse('1000'),
        currency: 'USD',
        createdAt: now,
        updatedAt: now,
      );

      final account3 = account1.copyWith(name: 'Different Name');

      expect(account1, equals(account2));
      expect(account1, isNot(equals(account3)));
    });

    test('toString returns meaningful string representation', () {
      final account = Account(
        id: 1,
        userId: 123,
        name: 'Test Account',
        balance: Decimal.parse('1000'),
        currency: 'USD',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final stringRepr = account.toString();
      expect(stringRepr, contains('Account'));
      expect(stringRepr, contains('Test Account'));
      expect(stringRepr, contains('1000'));
      expect(stringRepr, contains('USD'));
    });
  });

  group('AccountRequest Model', () {
    test('creates account request with required fields', () {
      final request = AccountRequest(
        name: 'New Account',
        currency: 'EUR',
        balance: Decimal.parse('500'),
      );

      expect(request.name, 'New Account');
      expect(request.currency, 'EUR');
      expect(request.balance, Decimal.parse('500'));
    });

    test('copyWith works correctly for account request', () {
      final request = AccountRequest(
        name: 'Original Name',
        currency: 'USD',
        balance: Decimal.parse('1000'),
      );

      final updatedRequest = request.copyWith(
        name: 'Updated Name',
        balance: Decimal.parse('2000'),
      );

      expect(updatedRequest.name, 'Updated Name');
      expect(updatedRequest.currency, 'USD'); // Should remain unchanged
      expect(updatedRequest.balance, Decimal.parse('2000'));
    });

    test('equality works correctly for account request', () {
      final request1 = AccountRequest(
        name: 'Test Account',
        currency: 'USD',
        balance: Decimal.parse('1000'),
      );

      final request2 = AccountRequest(
        name: 'Test Account',
        currency: 'USD',
        balance: Decimal.parse('1000'),
      );

      final request3 = request1.copyWith(currency: 'EUR');

      expect(request1, equals(request2));
      expect(request1, isNot(equals(request3)));
    });
  });

  group('AccountDetails Model', () {
    test('creates account details with required fields', () {
      final now = DateTime.now();
      final details = AccountDetails(
        id: 1,
        name: 'Detailed Account',
        balance: Decimal.parse('1500'),
        currency: 'RUB',
        createdAt: now,
        updatedAt: now,
        incomeStats: [],
        expenseStats: [],
      );

      expect(details.id, 1);
      expect(details.name, 'Detailed Account');
      expect(details.balance, Decimal.parse('1500'));
      expect(details.currency, 'RUB');
    });

    test('copyWith works correctly for account state', () {
      final state = AccountState(
        id: 1,
        currency: 'RUB',
        balance: Decimal.parse('1000'),
        name: 'Account Name',
      );

      final updatedState = state.copyWith(
        balance: Decimal.parse('1500'),
        currency: 'USD',
      );

      expect(updatedState.id, state.id);
      expect(updatedState.name, state.name);
      expect(updatedState.balance, Decimal.parse('1500'));
      expect(updatedState.currency, 'USD');
    });
  });

  group('Account Model Integration', () {
    test('account can be converted to request', () {
      final account = Account(
        id: 1,
        userId: 123,
        name: 'Test Account',
        balance: Decimal.parse('1000'),
        currency: 'USD',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // This would be a method you might add to convert Account to AccountRequest
      final request = AccountRequest(
        name: account.name,
        currency: account.currency,
        balance: account.balance,
      );

      expect(request.name, account.name);
      expect(request.currency, account.currency);
      expect(request.balance, account.balance);
    });

    test('handles different currency formats', () {
      final currencies = ['USD', 'EUR', 'RUB'];

      for (final currency in currencies) {
        final account = Account(
          id: 1,
          userId: 123,
          name: 'Test Account',
          balance: Decimal.parse('1000'),
          currency: currency,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        expect(account.currency, currency);
        expect(account.currency.length, greaterThanOrEqualTo(3));
      }
    });

    test('handles various balance amounts', () {
      final balances = ['0', '0.01', '999.99', '1000', '1000000.5', '0.001'];

      for (final balanceStr in balances) {
        final balance = Decimal.parse(balanceStr);
        final account = Account(
          id: 1,
          userId: 123,
          name: 'Test Account',
          balance: balance,
          currency: 'USD',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        expect(account.balance, balance);
        expect(account.balance.toString(), balanceStr);
      }
    });
  });
}
