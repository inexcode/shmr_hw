import 'package:drift/drift.dart';
import 'package:shmr_hw/logic/models/account.dart';
import 'package:shmr_hw/logic/models/drift/database.dart';
import 'package:shmr_hw/logic/models/drift/database_singleton.dart';
import 'package:shmr_hw/logic/models/enums.dart';
import 'package:shmr_hw/logic/models/transaction.dart';
import 'package:shmr_hw/logic/repositories/abstract/transactions.dart';

class DriftTransactionsRepository implements TransactionsRepository {
  DriftTransactionsRepository() : _databaseSingleton = DatabaseSingleton();

  final DatabaseSingleton _databaseSingleton;

  @override
  Future<Transaction> createTransaction({
    required final TransactionRequest request,
  }) async {
    final transaction = await _databaseSingleton.database.createTransaction(
      TransactionsCompanion.insert(
        accountId: request.accountId,
        categoryId: request.categoryId,
        amount: request.amount,
        transactionDate: request.transactionDate,
        comment: Value(request.comment),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    await _databaseSingleton.database.createTransactionEvent(
      transactionId: transaction.transaction.id,
      eventType: TransactionEventType.creation,
    );

    return Transaction.fromDatabase(transaction);
  }

  @override
  Future<void> setTransactions({
    required final List<Transaction> transactions,
  }) async {
    // first, truncate the existing transactions
    await _databaseSingleton.database.truncateTransactions();
    final companions = transactions
        .map(
          (final transaction) => TransactionsCompanion.insert(
            id: Value(transaction.id),
            accountId: transaction.accountId,
            categoryId: transaction.categoryId,
            amount: transaction.amount,
            transactionDate: transaction.transactionDate,
            comment: Value(transaction.comment),
            createdAt: transaction.createdAt,
            updatedAt: transaction.updatedAt,
          ),
        )
        .toList();
    await _databaseSingleton.database.batch((final batch) {
      batch.insertAll(_databaseSingleton.database.transactions, companions);
    });
  }

  @override
  Future<TransactionResponse> getTransaction({required final int id}) async {
    final dbTransaction = await _databaseSingleton.database.getTransaction(id);
    final account = await _databaseSingleton.database.getAccount(
      dbTransaction.transaction.accountId,
    );
    final accountState = AccountState(
      id: account.id,
      name: account.name,
      balance: account.balance,
      currency: account.currency,
    );
    return TransactionResponse.fromDatabase(dbTransaction, accountState);
  }

  @override
  Future<TransactionResponse> updateTransaction({
    required final int id,
    required final TransactionRequest request,
  }) async {
    final updatedTransaction = await _databaseSingleton.database
        .updateTransaction(
          id,
          TransactionsCompanion(
            accountId: Value(request.accountId),
            categoryId: Value(request.categoryId),
            amount: Value(request.amount),
            transactionDate: Value(request.transactionDate),
            comment: Value(request.comment),
            updatedAt: Value(DateTime.now()),
          ),
        );

    await _databaseSingleton.database.createTransactionEvent(
      transactionId: id,
      eventType: TransactionEventType.modification,
    );

    final account = await _databaseSingleton.database.getAccount(
      updatedTransaction.transaction.accountId,
    );
    final accountState = AccountState(
      id: account.id,
      name: account.name,
      balance: account.balance,
      currency: account.currency,
    );
    return TransactionResponse.fromDatabase(updatedTransaction, accountState);
  }

  @override
  Future<void> deleteTransaction({required final int id}) async {
    await _databaseSingleton.database.createTransactionEvent(
      transactionId: id,
      eventType: TransactionEventType.deletion,
    );

    await _databaseSingleton.database.deleteTransaction(id);
  }

  @override
  Future<List<TransactionResponse>> fetchTransactions({
    required final int accountId,
    final DateTime? startDate,
    final DateTime? endDate,
  }) async {
    final startDateAdjusted =
        startDate?.copyWith(hour: 0, minute: 0, second: 0) ??
        DateTime.now().copyWith(day: 0, hour: 0, minute: 0, second: 0);
    final endDateAdjusted =
        endDate?.copyWith(hour: 23, minute: 59, second: 59) ??
        DateTime.now().copyWith(hour: 23, minute: 59, second: 59);

    final transactions = await _databaseSingleton.database
        .getTransactionsByDates(
          accountId: accountId,
          startDate: startDateAdjusted,
          endDate: endDateAdjusted,
        );

    final List<TransactionResponse> responses = [];
    for (final dbTransaction in transactions) {
      final account = await _databaseSingleton.database.getAccount(
        dbTransaction.transaction.accountId,
      );
      final accountState = AccountState(
        id: account.id,
        name: account.name,
        balance: account.balance,
        currency: account.currency,
      );
      responses.add(
        TransactionResponse.fromDatabase(dbTransaction, accountState),
      );
    }
    return responses;
  }

  Future<List<DatabaseTransactionEvent>> getPendingEvents() =>
      _databaseSingleton.database.getAllPendingEvents();

  Future<void> deleteTransactionEvent({required final int eventId}) async {
    await _databaseSingleton.database.deleteTransactionEvent(eventId);
  }
}
