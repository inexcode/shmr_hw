import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shmr_hw/config/preferences/preferences_provider.dart';
import 'package:shmr_hw/logic/bloc/balance_spoiler/balance_spoiler_bloc.dart';
import 'package:shmr_hw/logic/bloc/transactions/transactions_bloc.dart';
import 'package:shmr_hw/ui/router/destinations.dart';
import 'package:shmr_hw/ui/utils/error_dialog_helper.dart';

@RoutePage()
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  StreamSubscription? _accelSub;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      // Initial state for accelerometer
      _accelSub = accelerometerEventStream().listen((final event) {
        // Shake detection
        if (context.mounted) {
          if (event.x.abs() > 12 || event.y.abs() > 12 || event.z.abs() > 12) {
            if (context.mounted) {
              context.read<BalanceSpoilerBloc>().add(
                const ToggleBalanceSpoilerEvent(),
              );
            }
          }
        }
      });
    });
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await _accelSub?.cancel();
  }

  @override
  Widget build(final BuildContext context) => AutoTabsRouter(
    routes: rootDestinations
        .map((final destination) => destination.route)
        .toList(),
    builder: (final context, final child) {
      final tabsRouter = AutoTabsRouter.of(context);
      return Scaffold(
        body: BlocListener<TransactionsBloc, TransactionsState>(
          listenWhen: (final previous, final current) =>
              previous.syncErrorMessage != current.syncErrorMessage &&
              current.syncErrorMessage != null,
          listener: (final context, final state) {
            if (state.syncErrorMessage != null) {
              showSyncErrorDialog(
                context: context,
                errorMessage: state.syncErrorMessage!,
                onRetryCallback:
                    state.failedSyncFunction == FailedSyncFunction.full
                    ? () => context.read<TransactionsBloc>()
                        ..add(const TransactionsEvent.clearSyncError())
                        ..add(const TransactionsEvent.loadTransactions())
                    : () => context.read<TransactionsBloc>()
                        ..add(const TransactionsEvent.clearSyncError())
                        ..add(const TransactionsEvent.syncTransactions()),
                onCloseCallback: () {
                  context.read<TransactionsBloc>().add(
                    const TransactionsEvent.clearSyncError(),
                  );
                },
              );
            }
          },
          child: child,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected:
              (final int index, {final bool notify = true}) async {
                tabsRouter.setActiveIndex(index, notify: notify);
                if (await PreferencesProvider.storeOf(
                  context,
                ).isHapticFeedbackEnabled()) {
                  await HapticFeedback.lightImpact();
                }
              },
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
