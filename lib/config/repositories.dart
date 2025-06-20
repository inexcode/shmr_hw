import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shmr_hw/logic/repositories/abstract/accounts.dart';
import 'package:shmr_hw/logic/repositories/abstract/categories.dart';
import 'package:shmr_hw/logic/repositories/abstract/transactions.dart';
import 'package:shmr_hw/logic/repositories/fake/accounts.dart';
import 'package:shmr_hw/logic/repositories/fake/categories.dart';
import 'package:shmr_hw/logic/repositories/fake/transactions.dart';

import 'package:shmr_hw/logic/repositories/rest_api/accounts.dart';
import 'package:shmr_hw/logic/repositories/rest_api/categories.dart';
import 'package:shmr_hw/logic/repositories/rest_api/transactions.dart';

class Repositories {
  factory Repositories() => _instance ??= Repositories._();
  Repositories._()
      : _accountsRepository = selectedRepository == 'FAKE'
            ? FakeAccountsRepository()
            : RestApiAccountsRepository(),
        _categoriesRepository = selectedRepository == 'FAKE'
            ? FakeCategoriesRepository()
            : RestApiCategoriesRepository(),
        _transactionsRepository = selectedRepository == 'FAKE'
            ? FakeTransactionsRepository()
            : RestApiTransactionsRepository();

  static Repositories? _instance;
  static final selectedRepository = dotenv.env['DATA_REPOSITORY'] ?? 'API';

  final AccountsRepository _accountsRepository;
  final CategoriesRepository _categoriesRepository;
  final TransactionsRepository _transactionsRepository;

  AccountsRepository get accountsRepository => _accountsRepository;

  CategoriesRepository get categoriesRepository => _categoriesRepository;

  TransactionsRepository get transactionsRepository => _transactionsRepository;
}
