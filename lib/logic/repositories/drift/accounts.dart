import 'package:drift/drift.dart';
import 'package:shmr_hw/logic/models/account.dart';
import 'package:shmr_hw/logic/models/drift/database.dart';
import 'package:shmr_hw/logic/models/drift/database_singleton.dart';
import 'package:shmr_hw/logic/models/enums.dart';
import 'package:shmr_hw/logic/repositories/abstract/accounts.dart';

class DriftAccountsRepository implements AccountsRepository {
  DriftAccountsRepository() : _databaseSingleton = DatabaseSingleton();

  final DatabaseSingleton _databaseSingleton;

  @override
  Future<List<Account>> fetchAccounts() async {
    final accounts = await _databaseSingleton.database.allAccounts();
    return accounts.map(Account.fromDatabase).toList();
  }

  @override
  Future<Account> createAccount({required final AccountRequest request}) async {
    final account = await _databaseSingleton.database.createAccount(
      AccountsCompanion.insert(
        userId: 1,
        name: request.name,
        balance: request.balance,
        currency: request.currency,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
    return Account.fromDatabase(account);
  }

  Future<void> saveAccounts({required final List<Account> accounts}) async {
    final companions = accounts
        .map(
          (final account) => AccountsCompanion.insert(
            id: Value(account.id),
            userId: account.userId,
            name: account.name,
            balance: account.balance,
            currency: Currency.fromString(account.currency).name,
            createdAt: account.createdAt,
            updatedAt: account.updatedAt,
          ),
        )
        .toList();
    await _databaseSingleton.database.batch((final batch) {
      batch.insertAll(_databaseSingleton.database.accounts, companions);
    });
  }

  @override
  Future<AccountDetails> getAccount({required final int id}) async {
    final account = await _databaseSingleton.database.getAccount(id);
    return AccountDetails.fromDatabase(account);
  }

  @override
  Future<Account> updateAccount({
    required final int id,
    required final AccountRequest request,
  }) async {
    final updatedAccount = await _databaseSingleton.database.updateAccount(
      id,
      AccountsCompanion(
        name: Value(request.name),
        balance: Value(request.balance),
        currency: Value(request.currency),
        updatedAt: Value(DateTime.now()),
      ),
    );
    return Account.fromDatabase(updatedAccount);
  }
}
