import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shmr_hw/logic/repositories/abstract/accounts.dart';
import 'package:shmr_hw/logic/repositories/abstract/categories.dart';
import 'package:shmr_hw/logic/repositories/abstract/transactions.dart';
import 'package:shmr_hw/logic/repositories/drift/accounts.dart';
import 'package:shmr_hw/logic/repositories/drift/categories.dart';
import 'package:shmr_hw/logic/repositories/drift/transactions.dart';
import 'package:shmr_hw/logic/repositories/fake/accounts.dart';
import 'package:shmr_hw/logic/repositories/fake/categories.dart';
import 'package:shmr_hw/logic/repositories/fake/transactions.dart';
import 'package:shmr_hw/logic/repositories/rest_api/accounts.dart';
import 'package:shmr_hw/logic/repositories/rest_api/categories.dart';
import 'package:shmr_hw/logic/repositories/rest_api/transactions.dart';

enum RepositoryType {
  fake,
  api,
  db;

  static RepositoryType get selectedRepository {
    return api;

    // to be deleted
    final envRepository = dotenv.env['DATA_REPOSITORY'];
    if (envRepository == 'FAKE') {
      return fake;
    }
    if (envRepository == 'API') {
      return api;
    }
    if (envRepository == 'DB') {
      return db;
    }
    return db;
  }
}

class Repositories {
  factory Repositories() => _instance ??= Repositories._();
  Repositories._() {
    switch (RepositoryType.selectedRepository) {
      case RepositoryType.fake:
        _accountsRepository = FakeAccountsRepository();
        _categoriesRepository = FakeCategoriesRepository();
        _transactionsRepository = FakeTransactionsRepository();
      case RepositoryType.api:
        _accountsRepository = RestApiAccountsRepository();
        _categoriesRepository = RestApiCategoriesRepository();
        _transactionsRepository = RestApiTransactionsRepository();
      case RepositoryType.db:
        _accountsRepository = DriftAccountsRepository();
        _categoriesRepository = DriftCategoriesRepository();
        _transactionsRepository = DriftTransactionsRepository();
    }
  }

  static Repositories? _instance;

  late final AccountsRepository _accountsRepository;
  late final CategoriesRepository _categoriesRepository;
  late final TransactionsRepository _transactionsRepository;

  late final DriftAccountsRepository _localAccountsRepository =
      DriftAccountsRepository();
  late final CategoriesRepository _localCategoriesRepository =
      DriftCategoriesRepository();
  late final DriftTransactionsRepository _localTransactionsRepository =
      DriftTransactionsRepository();

  AccountsRepository get accountsRepository => _accountsRepository;

  CategoriesRepository get categoriesRepository => _categoriesRepository;

  TransactionsRepository get transactionsRepository => _transactionsRepository;

  DriftAccountsRepository get localAccountsRepository =>
      _localAccountsRepository;

  CategoriesRepository get localCategoriesRepository =>
      _localCategoriesRepository;

  DriftTransactionsRepository get localTransactionsRepository =>
      _localTransactionsRepository;
}
