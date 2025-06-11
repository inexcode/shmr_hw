import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shmr_hw/ui/router/destinations.dart';

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => AutoTabsRouter(
        routes: rootDestinations
            .map((final destination) => destination.route)
            .toList(),
        builder: (final context, final child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: NavigationBar(
              selectedIndex: tabsRouter.activeIndex,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              onDestinationSelected: tabsRouter.setActiveIndex,
              destinations: [
                for (final destination in rootDestinations)
                  NavigationDestination(
                    icon: Icon(destination.icon),
                    label: destination.label.tr(),
                  ),
              ].toList(),
            ),
          );
        },
      );
}
