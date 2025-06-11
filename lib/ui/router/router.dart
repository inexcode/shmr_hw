import 'package:auto_route/auto_route.dart';
import 'package:shmr_hw/ui/layouts/root_page.dart';
import 'package:shmr_hw/ui/pages/account/account.dart';
import 'package:shmr_hw/ui/pages/categories/categories.dart';
import 'package:shmr_hw/ui/pages/expenses/expenses.dart';
import 'package:shmr_hw/ui/pages/income/income.dart';
import 'package:shmr_hw/ui/pages/settings/settings.dart';

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
        AutoRoute(page: ExpensesRoute.page, path: 'expenses', initial: true),
        AutoRoute(page: IncomeRoute.page, path: 'income'),
        AutoRoute(page: AccountRoute.page, path: 'account'),
        AutoRoute(page: CategoriesRoute.page, path: 'categories'),
        AutoRoute(page: SettingsRoute.page, path: 'settings'),
      ],
    ),
  ];
}
