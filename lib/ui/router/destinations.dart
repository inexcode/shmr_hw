import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shmr_hw/ui/components/custom_icons.dart';
import 'package:shmr_hw/ui/router/router.dart';

class RouteDestination {
  const RouteDestination({
    required this.route,
    required this.icon,
    required this.label,
  });

  final PageRouteInfo route;
  final IconData icon;
  final String label;
}

final List<RouteDestination> rootDestinations = [
  RouteDestination(
    route: TransactionsRoute(isIncome: false),
    icon: CustomIcons.expenses,
    label: 'expenses.title',
  ),
  RouteDestination(
    route: TransactionsRoute(isIncome: true),
    icon: CustomIcons.income,
    label: 'income.title',
  ),
  const RouteDestination(
    route: AccountRoute(),
    icon: CustomIcons.account,
    label: 'account.title',
  ),
  const RouteDestination(
    route: CategoriesRoute(),
    icon: CustomIcons.categories,
    label: 'categories.title',
  ),
  const RouteDestination(
    route: SettingsRoute(),
    icon: CustomIcons.settings,
    label: 'settings.title',
  ),
];
