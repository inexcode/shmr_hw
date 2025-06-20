// This is a mock right now, probably later it will have some logic
// ignore_for_file: avoid_classes_with_only_static_members

import 'package:shmr_hw/logic/repositories/abstract/accounts.dart';
import 'package:shmr_hw/logic/repositories/abstract/categories.dart';
import 'package:shmr_hw/logic/repositories/abstract/transactions.dart';

import 'package:shmr_hw/logic/repositories/rest_api/accounts.dart';
import 'package:shmr_hw/logic/repositories/rest_api/categories.dart';
import 'package:shmr_hw/logic/repositories/rest_api/transactions.dart';

class Repositories {
  static AccountsRepository get accountRepository =>
      RestApiAccountsRepository();
  static CategoriesRepository get categoryRepository =>
      RestApiCategoriesRepository();
  static TransactionsRepository get transactionRepository =>
      RestApiTransactionsRepository();
}
