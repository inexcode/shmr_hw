// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AccountPage]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
    : super(AccountRoute.name, initialChildren: children);

  static const String name = 'AccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AccountPage();
    },
  );
}

/// generated route for
/// [CategoriesPage]
class CategoriesRoute extends PageRouteInfo<void> {
  const CategoriesRoute({List<PageRouteInfo>? children})
    : super(CategoriesRoute.name, initialChildren: children);

  static const String name = 'CategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CategoriesPage();
    },
  );
}

/// generated route for
/// [RootPage]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
    : super(RootRoute.name, initialChildren: children);

  static const String name = 'RootRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RootPage();
    },
  );
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsPage();
    },
  );
}

/// generated route for
/// [TransactionsAnalysisPage]
class TransactionsAnalysisRoute
    extends PageRouteInfo<TransactionsAnalysisRouteArgs> {
  TransactionsAnalysisRoute({
    required bool isIncome,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         TransactionsAnalysisRoute.name,
         args: TransactionsAnalysisRouteArgs(isIncome: isIncome, key: key),
         initialChildren: children,
       );

  static const String name = 'TransactionsAnalysisRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TransactionsAnalysisRouteArgs>();
      return TransactionsAnalysisPage(isIncome: args.isIncome, key: args.key);
    },
  );
}

class TransactionsAnalysisRouteArgs {
  const TransactionsAnalysisRouteArgs({required this.isIncome, this.key});

  final bool isIncome;

  final Key? key;

  @override
  String toString() {
    return 'TransactionsAnalysisRouteArgs{isIncome: $isIncome, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TransactionsAnalysisRouteArgs) return false;
    return isIncome == other.isIncome && key == other.key;
  }

  @override
  int get hashCode => isIncome.hashCode ^ key.hashCode;
}

/// generated route for
/// [TransactionsHistoryPage]
class TransactionsHistoryRoute
    extends PageRouteInfo<TransactionsHistoryRouteArgs> {
  TransactionsHistoryRoute({
    required bool isIncome,
    int? categoryId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         TransactionsHistoryRoute.name,
         args: TransactionsHistoryRouteArgs(
           isIncome: isIncome,
           categoryId: categoryId,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'TransactionsHistoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TransactionsHistoryRouteArgs>();
      return TransactionsHistoryPage(
        isIncome: args.isIncome,
        categoryId: args.categoryId,
        key: args.key,
      );
    },
  );
}

class TransactionsHistoryRouteArgs {
  const TransactionsHistoryRouteArgs({
    required this.isIncome,
    this.categoryId,
    this.key,
  });

  final bool isIncome;

  final int? categoryId;

  final Key? key;

  @override
  String toString() {
    return 'TransactionsHistoryRouteArgs{isIncome: $isIncome, categoryId: $categoryId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TransactionsHistoryRouteArgs) return false;
    return isIncome == other.isIncome &&
        categoryId == other.categoryId &&
        key == other.key;
  }

  @override
  int get hashCode => isIncome.hashCode ^ categoryId.hashCode ^ key.hashCode;
}

/// generated route for
/// [TransactionsPage]
class TransactionsRoute extends PageRouteInfo<void> {
  const TransactionsRoute({List<PageRouteInfo>? children})
    : super(TransactionsRoute.name, initialChildren: children);

  static const String name = 'TransactionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TransactionsPage();
    },
  );
}

/// generated route for
/// [TransactionsTodayPage]
class TransactionsTodayRoute extends PageRouteInfo<TransactionsTodayRouteArgs> {
  TransactionsTodayRoute({
    bool isIncome = false,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         TransactionsTodayRoute.name,
         args: TransactionsTodayRouteArgs(isIncome: isIncome, key: key),
         initialChildren: children,
       );

  static const String name = 'TransactionsTodayRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TransactionsTodayRouteArgs>(
        orElse: () => const TransactionsTodayRouteArgs(),
      );
      return TransactionsTodayPage(isIncome: args.isIncome, key: args.key);
    },
  );
}

class TransactionsTodayRouteArgs {
  const TransactionsTodayRouteArgs({this.isIncome = false, this.key});

  final bool isIncome;

  final Key? key;

  @override
  String toString() {
    return 'TransactionsTodayRouteArgs{isIncome: $isIncome, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TransactionsTodayRouteArgs) return false;
    return isIncome == other.isIncome && key == other.key;
  }

  @override
  int get hashCode => isIncome.hashCode ^ key.hashCode;
}
