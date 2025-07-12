import 'package:decimal/decimal.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shmr_hw/logic/models/drift/database.steps.dart';
import 'package:shmr_hw/logic/models/enums.dart';
import 'package:shmr_hw/logic/models/fake_data/fake_categories.dart';

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

// Table for pending events not yet synced with the server
@DataClassName('DatabaseTransactionEvent')
class TransactionEvents extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get transactionId => integer().references(Transactions, #id)();
  IntColumn get eventType => intEnum<TransactionEventType>()();
  DateTimeColumn get createdAt => dateTime()();
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
  tables: [
    Categories,
    Accounts,
    Transactions,
    AccountStates,
    TransactionEvents,
  ],
)
class Database extends _$Database {
  Database([final QueryExecutor? executor])
    : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 2;

  Future<List<DatabaseAccount>> allAccounts() => select(accounts).get();

  Future<DatabaseAccount> createAccount(final AccountsCompanion account) async {
    final id = await into(accounts).insert(account);
    // Create the initial state for the new account
    await into(accountStates).insert(
      AccountStatesCompanion.insert(
        accountId: id,
        name: account.name.value,
        balance: account.balance.value,
        currency: account.currency.value,
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
    await into(accountStates).insert(
      AccountStatesCompanion.insert(
        accountId: id,
        name: account.name.value,
        balance: account.balance.value,
        currency: account.currency.value,
      ),
    );

    await (update(
      accounts,
    )..where((final tbl) => tbl.id.equals(id))).write(account);
    return getAccount(id);
  }

  Future<List<DatabaseCategory>> allCategories() => select(categories).get();

  Future<List<DatabaseCategory>> categoriesByType({
    required final bool isIncome,
  }) => (select(
    categories,
  )..where((final tbl) => tbl.isIncome.equals(isIncome))).get();

  Future<void> saveCategories({
    required final List<DatabaseCategory> categories,
  }) async {
    final currentCategories = await allCategories();

    final currentCategoriesMap = {
      for (final category in currentCategories) category.id: category,
    };
    final newCategoriesMap = {
      for (final category in categories) category.id: category,
    };

    final categoriesToDelete = currentCategories
        .where((final current) => !newCategoriesMap.containsKey(current.id))
        .toList();

    final categoriesToInsert = categories
        .where(
          (final newCategory) =>
              !currentCategoriesMap.containsKey(newCategory.id),
        )
        .toList();

    final categoriesToUpdate = <DatabaseCategory>[];
    for (final newCategory in categories) {
      final currentCategory = currentCategoriesMap[newCategory.id];
      if (currentCategory != null &&
          _categoriesAreDifferent(currentCategory, newCategory)) {
        categoriesToUpdate.add(newCategory);
      }
    }

    await batch((final batch) {
      for (final categoryToDelete in categoriesToDelete) {
        batch.delete(this.categories, categoryToDelete);
      }

      for (final categoryToInsert in categoriesToInsert) {
        batch.insert(this.categories, categoryToInsert);
      }

      for (final categoryToUpdate in categoriesToUpdate) {
        batch.update(this.categories, categoryToUpdate);
      }
    });
  }

  bool _categoriesAreDifferent(
    final DatabaseCategory current,
    final DatabaseCategory newCategory,
  ) =>
      current.name != newCategory.name ||
      current.emoji != newCategory.emoji ||
      current.isIncome != newCategory.isIncome;

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

    final previousBalance = account.balance;

    final newBalance = category.isIncome
        ? previousBalance + databaseTransaction.amount
        : previousBalance - databaseTransaction.amount;

    await into(accountStates).insert(
      AccountStatesCompanion.insert(
        accountId: databaseTransaction.accountId,
        name: databaseTransaction.comment ?? '',
        balance: databaseTransaction.amount,
        currency: account.currency,
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

    final previousBalance = account.balance;
    final newBalance = previousTransaction.category.isIncome
        ? previousBalance + amountDelta
        : previousBalance - amountDelta;

    await into(accountStates).insert(
      AccountStatesCompanion.insert(
        accountId: databaseTransaction.accountId,
        name: databaseTransaction.comment ?? '',
        balance: newBalance,
        currency: account.currency,
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

    final previousBalance = account.balance;
    final amount = databaseTransaction.amount;
    final newBalance = category.isIncome
        ? previousBalance - amount
        : previousBalance + amount;
    await into(accountStates).insert(
      AccountStatesCompanion.insert(
        accountId: databaseTransaction.accountId,
        name: databaseTransaction.comment ?? '',
        balance: newBalance,
        currency: account.currency,
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

  // Transaction Events Management
  Future<List<DatabaseTransactionEvent>> getAllPendingEvents() =>
      select(transactionEvents).get();

  Future<void> createTransactionEvent({
    required final int transactionId,
    required final TransactionEventType eventType,
  }) async {
    // Check if there's already an event for this transaction
    final existingEvent =
        await (select(transactionEvents)
              ..where((final tbl) => tbl.transactionId.equals(transactionId)))
            .getSingleOrNull();

    if (existingEvent != null) {
      await _handleExistingEvent(existingEvent, eventType);
    } else {
      // No existing event, create new one
      await into(transactionEvents).insert(
        TransactionEventsCompanion.insert(
          transactionId: transactionId,
          eventType: eventType,
          createdAt: DateTime.now(),
        ),
      );
    }
  }

  Future<void> _handleExistingEvent(
    final DatabaseTransactionEvent existingEvent,
    final TransactionEventType newEventType,
  ) async {
    switch (newEventType) {
      case TransactionEventType.creation:
        // Creation events are ignored if there's already an event
        break;
      case TransactionEventType.modification:
        // If existing event is creation, ignore modification
        // If existing event is modification or deletion, update to modification
        if (existingEvent.eventType != TransactionEventType.creation) {
          await (update(
            transactionEvents,
          )..where((final tbl) => tbl.id.equals(existingEvent.id))).write(
            TransactionEventsCompanion(
              eventType: const Value(TransactionEventType.modification),
              createdAt: Value(DateTime.now()),
            ),
          );
        }
      case TransactionEventType.deletion:
        // Deletion events replace all other types
        if (existingEvent.eventType == TransactionEventType.creation) {
          // Deletion over creation - just delete the event
          await (delete(
            transactionEvents,
          )..where((final tbl) => tbl.id.equals(existingEvent.id))).go();
        } else {
          // Deletion over modification - replace with deletion
          await (update(
            transactionEvents,
          )..where((final tbl) => tbl.id.equals(existingEvent.id))).write(
            TransactionEventsCompanion(
              eventType: const Value(TransactionEventType.deletion),
              createdAt: Value(DateTime.now()),
            ),
          );
        }
    }
  }

  Future<void> deleteTransactionEvent(final int eventId) async {
    await (delete(
      transactionEvents,
    )..where((final tbl) => tbl.id.equals(eventId))).go();
  }

  Future<void> deleteTransactionEventByTransactionId(
    final int transactionId,
  ) async {
    await (delete(
      transactionEvents,
    )..where((final tbl) => tbl.transactionId.equals(transactionId))).go();
  }

  Future<void> truncateTransactions() async {
    await customStatement('DELETE FROM transactions');
    await customStatement('DELETE FROM account_states');
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
              id: Value(category.id),
              name: category.name,
              emoji: category.emoji,
              isIncome: category.isIncome,
            ),
          ),
        );
      });
    },
    beforeOpen: (final details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
    onUpgrade: stepByStep(
      from1To2: (final m, final schema) async {
        await m.deleteTable('history_elements');
        await m.createTable(schema.transactionEvents);
      },
    ),
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
