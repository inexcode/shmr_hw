import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shmr_hw/ui/layouts/root_page.dart';
import 'package:shmr_hw/ui/pages/account/account.dart';
import 'package:shmr_hw/ui/pages/categories/categories.dart';
import 'package:shmr_hw/ui/pages/settings/settings.dart';
import 'package:shmr_hw/ui/pages/transactions/transactions.dart';
import 'package:shmr_hw/ui/pages/transactions/transactions_analysis.dart';
import 'package:shmr_hw/ui/pages/transactions/transactions_history.dart';
import 'package:shmr_hw/ui/pages/transactions/transactions_today.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class RootRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: RootRoute.page,
      path: '/',
      initial: true,
      children: [
        AutoRoute(
          page: TransactionsRoute.page,
          path: 'transactions',
          initial: true,
          children: [
            AutoRoute(
              page: TransactionsTodayRoute.page,
              path: 'today',
              initial: true,
            ),
            AutoRoute(page: TransactionsHistoryRoute.page, path: 'history'),
            AutoRoute(page: TransactionsAnalysisRoute.page, path: 'analysis'),
          ],
        ),
        AutoRoute(page: AccountRoute.page, path: 'account'),
        AutoRoute(page: CategoriesRoute.page, path: 'categories'),
        AutoRoute(page: SettingsRoute.page, path: 'settings'),
      ],
    ),
  ];
}
