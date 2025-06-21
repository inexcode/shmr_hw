import 'package:decimal/decimal.dart';
import 'package:shmr_hw/logic/models/account.dart';
import 'package:shmr_hw/logic/models/category.dart';
import 'package:shmr_hw/logic/models/transaction.dart';
import 'package:shmr_hw/logic/repositories/abstract/transactions.dart';

class FakeTransactionsRepository implements TransactionsRepository {
  @override
  Future<Transaction> createTransaction({
    required final TransactionRequest request,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return Transaction(
      id: 1,
      accountId: request.accountId,
      categoryId: request.categoryId,
      amount: request.amount,
      transactionDate: DateTime.now(),
      comment: request.comment,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<TransactionResponse> getTransaction({
    required final int id,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return TransactionResponse(
      id: id,
      account: AccountState(
        id: 1,
        name: 'Основной счёт',
        balance: Decimal.parse('1000.00'),
        currency: 'RUB',
      ),
      category: const Category(
        id: 1,
        name: 'Еда',
        emoji: '🍔',
        isIncome: false,
      ),
      amount: Decimal.parse('100.00'),
      transactionDate: DateTime.now(),
      comment: 'Покупка еды',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<TransactionResponse> updateTransaction({
    required final int id,
    required final TransactionRequest request,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return TransactionResponse(
      id: id,
      account: AccountState(
        id: request.accountId,
        name: 'Основной счёт',
        balance: Decimal.parse('1000.00'),
        currency: 'RUB',
      ),
      category: Category(
        id: request.categoryId,
        name: 'Еда',
        emoji: '🍔',
        isIncome: false,
      ),
      amount: request.amount,
      transactionDate: request.transactionDate,
      comment: request.comment,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<void> deleteTransaction({
    required final int id,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    // duh.
    return;
  }

  @override
  Future<List<TransactionResponse>> fetchTransactions({
    required final int accountId,
    final DateTime? startDate,
    final DateTime? endDate,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      TransactionResponse(
        id: 1,
        account: AccountState(
          id: accountId,
          name: 'Основной счёт',
          balance: Decimal.parse('1000.00'),
          currency: 'RUB',
        ),
        category: const Category(
          id: 1,
          name: 'Еда',
          emoji: '🍔',
          isIncome: false,
        ),
        amount: Decimal.parse('100.00'),
        transactionDate: DateTime.now(),
        comment: 'Покупка еды',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      TransactionResponse(
        id: 2,
        account: AccountState(
          id: accountId,
          name: 'Основной счёт',
          balance: Decimal.parse('1000.00'),
          currency: 'RUB',
        ),
        category: const Category(
          id: 1,
          name: 'Еда',
          emoji: '🍔',
          isIncome: false,
        ),
        amount: Decimal.parse('150.00'),
        transactionDate: DateTime.now(),
        comment: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      // some income
      TransactionResponse(
        id: 3,
        account: AccountState(
          id: accountId,
          name: 'Основной счёт',
          balance: Decimal.parse('1000.00'),
          currency: 'RUB',
        ),
        category: const Category(
          id: 2,
          name: 'Зарплата',
          emoji: '💰',
          isIncome: true,
        ),
        amount: Decimal.parse('5000.00'),
        transactionDate: DateTime.now(),
        comment: 'Зарплата за месяц',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];
  }
}
