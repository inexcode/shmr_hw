import 'package:decimal/decimal.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shmr_hw/logic/models/enums.dart';
import 'package:shmr_hw/logic/models/fake_data/fake_categories.dart';
import 'package:shmr_hw/logic/models/fake_data/fake_transactions.dart';

part 'database.g.dart';

@DataClassName('DatabaseCategory')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get emoji => text().withLength(min: 1, max: 10)();
  BoolColumn get isIncome => boolean()();
}

@DataClassName('DatabaseAccount')
class Accounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  TextColumn get name => text()();
  TextColumn get balance => text().map(const DecimalConverter())();
  TextColumn get currency => text().withLength(min: 3, max: 3)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DataClassName('DatabaseTransaction')
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get accountId => integer().references(Accounts, #id)();
  IntColumn get categoryId => integer().references(Categories, #id)();
  TextColumn get amount => text().map(const DecimalConverter())();
  DateTimeColumn get transactionDate => dateTime()();
  TextColumn get comment => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DataClassName('DatabaseAccountState')
class AccountStates extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get accountId => integer().references(Accounts, #id)();
  TextColumn get name => text()();
  TextColumn get balance => text().map(const DecimalConverter())();
  TextColumn get currency => text().withLength(min: 3, max: 3)();
}

@DataClassName('DatabaseHistoryElement')
class HistoryElements extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get accountId => integer().references(Accounts, #id)();
  TextColumn get name => text()();
  IntColumn get changeType => intEnum<AccountHistoryChangeType>()();
  @ReferenceName('previousStateId')
  IntColumn get previousStateId =>
      integer().nullable().references(AccountStates, #id)();
  @ReferenceName('newStateId')
  IntColumn get newStateId => integer().references(AccountStates, #id)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

class DatabaseHistoryElementWithStates {
  DatabaseHistoryElementWithStates({
    required this.element,
    required this.newState,
    this.previousState,
  });

  final DatabaseHistoryElement element;
  final DatabaseAccountState? previousState;
  final DatabaseAccountState newState;
}

class DatabaseTransactionWithCategory {
  DatabaseTransactionWithCategory({
    required this.transaction,
    required this.category,
  });

  final DatabaseTransaction transaction;
  final DatabaseCategory category;
}

@DriftDatabase(
  tables: [Categories, Accounts, Transactions, AccountStates, HistoryElements],
)
class Database extends _$Database {
  Database([final QueryExecutor? executor])
    : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<DatabaseAccount>> allAccounts() => select(accounts).get();

  Future<DatabaseAccount> createAccount(final AccountsCompanion account) async {
    final id = await into(accounts).insert(account);
    // Create the initial state for the new account
    final stateId = await into(accountStates).insert(
      AccountStatesCompanion.insert(
        accountId: id,
        name: account.name.value,
        balance: account.balance.value,
        currency: account.currency.value,
      ),
    );
    // Create the initial history element for the new account
    await into(historyElements).insert(
      HistoryElementsCompanion.insert(
        accountId: id,
        name: account.name.value,
        changeType: AccountHistoryChangeType.creation,
        previousStateId: const Value(null), // No previous state for creation
        newStateId: stateId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    return (select(
      accounts,
    )..where((final tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<DatabaseAccount> getAccount(final int id) =>
      (select(accounts)..where((final tbl) => tbl.id.equals(id))).getSingle();

  Future<DatabaseAccount> updateAccount(
    final int id,
    final AccountsCompanion account,
  ) async {
    // write the new state and history element
    final newStateId = await into(accountStates).insert(
      AccountStatesCompanion.insert(
        accountId: id,
        name: account.name.value,
        balance: account.balance.value,
        currency: account.currency.value,
      ),
    );
    // We need to get the previous state ID for the history element.
    final previousState =
        await (select(historyElements)
              ..where((final tbl) => tbl.accountId.equals(id))
              ..orderBy([(final tbl) => OrderingTerm.desc(tbl.createdAt)])
              ..limit(1))
            .getSingleOrNull();

    await into(historyElements).insert(
      HistoryElementsCompanion.insert(
        accountId: id,
        name: account.name.value,
        changeType: AccountHistoryChangeType.modification,
        previousStateId: Value(
          previousState?.previousStateId,
        ), // No previous state for update
        newStateId: newStateId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    await (update(
      accounts,
    )..where((final tbl) => tbl.id.equals(id))).write(account);
    return getAccount(id);
  }

  // Get account history, but with AccountState elements being present, not just IDs.
  Future<List<DatabaseHistoryElementWithStates>> getAccountHistory(
    final int accountId,
  ) async {
    final query = select(historyElements)
      ..where((final tbl) => tbl.accountId.equals(accountId))
      ..orderBy([(final tbl) => OrderingTerm.desc(tbl.createdAt)]);

    final previousStates = alias(accountStates, 'previous_states');
    final newStates = alias(accountStates, 'new_states');

    final elements = await query.join([
      leftOuterJoin(
        previousStates,
        previousStates.id.equalsExp(historyElements.previousStateId),
      ),
      innerJoin(newStates, newStates.id.equalsExp(historyElements.newStateId)),
    ]).get();

    return elements
        .map(
          (final row) => DatabaseHistoryElementWithStates(
            element: row.readTable(historyElements),
            previousState: row.readTableOrNull(previousStates),
            newState: row.readTable(newStates),
          ),
        )
        .toList();
  }

  Future<List<DatabaseCategory>> allCategories() => select(categories).get();

  Future<List<DatabaseCategory>> categoriesByType({
    required final bool isIncome,
  }) => (select(
    categories,
  )..where((final tbl) => tbl.isIncome.equals(isIncome))).get();

  Future<DatabaseTransactionWithCategory> createTransaction(
    final TransactionsCompanion transaction,
  ) async {
    final id = await into(transactions).insert(transaction);

    final dbTransaction =
        await (select(
          transactions,
        )..where((final tbl) => tbl.id.equals(id))).join([
          innerJoin(
            categories,
            categories.id.equalsExp(transactions.categoryId),
          ),
          // join the account
          innerJoin(accounts, accounts.id.equalsExp(transactions.accountId)),
        ]).getSingle();

    final databaseTransaction = dbTransaction.readTable(transactions);
    final category = dbTransaction.readTable(categories);
    final account = dbTransaction.readTable(accounts);

    final previousHistoryElement =
        await (select(historyElements)
              ..where((final tbl) => tbl.accountId.equals(id))
              ..orderBy([(final tbl) => OrderingTerm.desc(tbl.createdAt)])
              ..limit(1))
            .getSingleOrNull();

    final previousStateId = previousHistoryElement?.newStateId;
    final previousBalance = account.balance;

    final newBalance = category.isIncome
        ? previousBalance + databaseTransaction.amount
        : previousBalance - databaseTransaction.amount;

    final newStateId = await into(accountStates).insert(
      AccountStatesCompanion.insert(
        accountId: databaseTransaction.accountId,
        name: databaseTransaction.comment ?? '',
        balance: databaseTransaction.amount,
        currency: account.currency,
      ),
    );

    await into(historyElements).insert(
      HistoryElementsCompanion.insert(
        accountId: databaseTransaction.accountId,
        name: databaseTransaction.comment ?? '',
        changeType: AccountHistoryChangeType.modification,
        previousStateId: Value(previousStateId),
        newStateId: newStateId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    // TODO(inex): Should rewrite it so we calculate the balance on account select
    await (update(accounts)
          ..where((final tbl) => tbl.id.equals(databaseTransaction.accountId)))
        .write(
          AccountsCompanion(
            balance: Value(newBalance),
            updatedAt: Value(DateTime.now()),
          ),
        );

    return DatabaseTransactionWithCategory(
      transaction: databaseTransaction,
      category: category,
    );
  }

  Future<DatabaseTransactionWithCategory> getTransaction(final int id) async {
    final dbTransaction =
        await (select(
          transactions,
        )..where((final tbl) => tbl.id.equals(id))).join([
          innerJoin(
            categories,
            categories.id.equalsExp(transactions.categoryId),
          ),
        ]).getSingle();
    return DatabaseTransactionWithCategory(
      transaction: dbTransaction.readTable(transactions),
      category: dbTransaction.readTable(categories),
    );
  }

  Future<DatabaseTransactionWithCategory> updateTransaction(
    final int id,
    final TransactionsCompanion transaction,
  ) async {
    final previousTransaction = await getTransaction(id);
    await (update(
      transactions,
    )..where((final tbl) => tbl.id.equals(id))).write(transaction);

    final dbTransaction =
        await (select(
          transactions,
        )..where((final tbl) => tbl.id.equals(id))).join([
          innerJoin(
            categories,
            categories.id.equalsExp(transactions.categoryId),
          ),
          // join the account
          innerJoin(accounts, accounts.id.equalsExp(transactions.accountId)),
        ]).getSingle();

    final databaseTransaction = dbTransaction.readTable(transactions);
    final category = dbTransaction.readTable(categories);
    final account = dbTransaction.readTable(accounts);

    final amountDelta =
        previousTransaction.category.isIncome == category.isIncome
        ? databaseTransaction.amount - previousTransaction.transaction.amount
        : previousTransaction.transaction.amount + databaseTransaction.amount;

    final previousHistoryElement =
        await (select(historyElements)
              ..where(
                (final tbl) =>
                    tbl.accountId.equals(databaseTransaction.accountId),
              )
              ..orderBy([(final tbl) => OrderingTerm.desc(tbl.createdAt)])
              ..limit(1))
            .getSingleOrNull();
    final previousStateId = previousHistoryElement?.newStateId;
    final previousBalance = account.balance;
    final newBalance = previousTransaction.category.isIncome
        ? previousBalance + amountDelta
        : previousBalance - amountDelta;

    final newStateId = await into(accountStates).insert(
      AccountStatesCompanion.insert(
        accountId: databaseTransaction.accountId,
        name: databaseTransaction.comment ?? '',
        balance: newBalance,
        currency: account.currency,
      ),
    );
    await into(historyElements).insert(
      HistoryElementsCompanion.insert(
        accountId: databaseTransaction.accountId,
        name: databaseTransaction.comment ?? '',
        changeType: AccountHistoryChangeType.modification,
        previousStateId: Value(previousStateId),
        newStateId: newStateId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
    // Update the account balance
    await (update(accounts)
          ..where((final tbl) => tbl.id.equals(databaseTransaction.accountId)))
        .write(
          AccountsCompanion(
            balance: Value(newBalance),
            updatedAt: Value(DateTime.now()),
          ),
        );

    return DatabaseTransactionWithCategory(
      transaction: databaseTransaction,
      category: category,
    );
  }

  Future<void> deleteTransaction(final int id) async {
    final dbTransaction =
        await (select(
          transactions,
        )..where((final tbl) => tbl.id.equals(id))).join([
          innerJoin(
            categories,
            categories.id.equalsExp(transactions.categoryId),
          ),
          // join the account
          innerJoin(accounts, accounts.id.equalsExp(transactions.accountId)),
        ]).getSingle();

    final databaseTransaction = dbTransaction.readTable(transactions);
    final category = dbTransaction.readTable(categories);
    final account = dbTransaction.readTable(accounts);

    await (delete(transactions)..where((final tbl) => tbl.id.equals(id))).go();

    final previousHistoryElement =
        await (select(historyElements)
              ..where(
                (final tbl) =>
                    tbl.accountId.equals(databaseTransaction.accountId),
              )
              ..orderBy([(final tbl) => OrderingTerm.desc(tbl.createdAt)])
              ..limit(1))
            .getSingleOrNull();
    final previousStateId = previousHistoryElement?.newStateId;
    final previousBalance = account.balance;
    final amount = databaseTransaction.amount;
    final newBalance = category.isIncome
        ? previousBalance - amount
        : previousBalance + amount;
    final newStateId = await into(accountStates).insert(
      AccountStatesCompanion.insert(
        accountId: databaseTransaction.accountId,
        name: databaseTransaction.comment ?? '',
        balance: newBalance,
        currency: account.currency,
      ),
    );
    await into(historyElements).insert(
      HistoryElementsCompanion.insert(
        accountId: databaseTransaction.accountId,
        name: databaseTransaction.comment ?? '',
        changeType: AccountHistoryChangeType.modification,
        previousStateId: Value(previousStateId),
        newStateId: newStateId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    await (update(accounts)
          ..where((final tbl) => tbl.id.equals(databaseTransaction.accountId)))
        .write(
          AccountsCompanion(
            balance: Value(newBalance),
            updatedAt: Value(DateTime.now()),
          ),
        );
  }

  Future<List<DatabaseTransactionWithCategory>> getTransactionsByDates({
    required final int accountId,
    required final DateTime startDate,
    required final DateTime endDate,
  }) async {
    final query = select(transactions)
      ..where(
        (final tbl) =>
            tbl.transactionDate.isBiggerOrEqualValue(startDate) &
            tbl.transactionDate.isSmallerOrEqualValue(endDate),
      )
      ..orderBy([(final tbl) => OrderingTerm.desc(tbl.transactionDate)]);
    final results = await query.join([
      innerJoin(categories, categories.id.equalsExp(transactions.categoryId)),
    ]).get();
    return results
        .map(
          (final row) => DatabaseTransactionWithCategory(
            transaction: row.readTable(transactions),
            category: row.readTable(categories),
          ),
        )
        .toList();
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (final Migrator m) async {
      await m.createAll();
      await batch((final batch) {
        batch.insertAll(
          categories,
          fakeCategories.map(
            (final category) => CategoriesCompanion.insert(
              name: category.name,
              emoji: category.emoji,
              isIncome: category.isIncome,
            ),
          ),
        );
      });
      await into(accounts).insert(
        AccountsCompanion.insert(
          userId: 1,
          name: 'Main Account',
          balance: Decimal.zero,
          currency: 'RUB',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
      for (final transaction in fakeTransactions) {
        await createTransaction(
          TransactionsCompanion.insert(
            accountId: transaction.accountId,
            categoryId: transaction.categoryId,
            amount: transaction.amount,
            transactionDate: transaction.transactionDate,
            createdAt: transaction.createdAt,
            updatedAt: transaction.updatedAt,
            comment: Value(transaction.comment),
          ),
        );
      }
    },
    beforeOpen: (final details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  static QueryExecutor _openConnection() => driftDatabase(
    name: 'database',
    native: const DriftNativeOptions(
      databaseDirectory: getApplicationSupportDirectory,
    ),
  );
}

class DecimalConverter extends TypeConverter<Decimal, String> {
  const DecimalConverter();

  @override
  Decimal fromSql(final String fromDb) => Decimal.parse(fromDb);

  @override
  String toSql(final Decimal value) => value.toString();
}
