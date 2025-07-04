import 'package:decimal/decimal.dart';
import 'package:shmr_hw/logic/models/account.dart';
import 'package:shmr_hw/logic/models/enums.dart';
import 'package:shmr_hw/logic/models/stat_item.dart';
import 'package:shmr_hw/logic/repositories/abstract/accounts.dart';

class FakeAccountsRepository implements AccountsRepository {
  @override
  Future<List<Account>> fetchAccounts() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Account(
        id: 1,
        userId: 1,
        name: 'Основной счёт',
        balance: Decimal.parse('1000.00'),
        currency: 'RUB',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];
  }

  @override
  Future<Account> createAccount({required final AccountRequest request}) async {
    await Future.delayed(const Duration(seconds: 1));
    return Account(
      id: 2,
      userId: 1,
      name: request.name,
      balance: request.balance,
      currency: request.currency,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<AccountDetails> getAccount({required final int id}) async {
    await Future.delayed(const Duration(seconds: 1));
    return AccountDetails(
      id: id,
      name: 'Основной счёт',
      balance: Decimal.parse('1000.00'),
      currency: 'RUB',
      incomeStats: [
        StatItem(
          categoryId: 1,
          categoryName: 'Зарплата',
          emoji: '💰',
          amount: Decimal.parse('500.00'),
        ),
      ],
      expenseStats: [
        StatItem(
          categoryId: 1,
          categoryName: 'Еда',
          emoji: '🍔',
          amount: Decimal.parse('500.00'),
        ),
      ],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<Account> updateAccount({
    required final int id,
    required final AccountRequest request,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return Account(
      id: id,
      userId: 1,
      name: request.name,
      balance: request.balance,
      currency: request.currency,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<AccountHistory> getAccountHistory({required final int id}) async {
    await Future.delayed(const Duration(seconds: 1));
    return AccountHistory(
      accountId: 1,
      accountName: 'Основной счёт',
      currency: 'USD',
      currentBalance: Decimal.parse('2000.00'),
      history: [
        AccountHistoryElement(
          id: 1,
          accountId: 1,
          name: 'name',
          changeType: AccountHistoryChangeType.modification,
          previousState: AccountState(
            id: 1,
            name: 'name',
            balance: Decimal.parse('1000.00'),
            currency: 'USD',
          ),
          newState: AccountState(
            id: 1,
            name: 'name',
            balance: Decimal.parse('1000.00'),
            currency: 'USD',
          ),
          changeTimestamp: DateTime.now(),
          createdAt: DateTime.now(),
        ),
      ],
    );
  }
}
