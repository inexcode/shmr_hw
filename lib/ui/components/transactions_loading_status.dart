import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_hw/logic/bloc/transactions/transactions_bloc.dart';

class TransactionsLoadingStatus extends StatelessWidget {
  const TransactionsLoadingStatus({super.key});

  @override
  Widget build(final BuildContext context) {
    final transactionsState = context.watch<TransactionsBloc>().state;

    if (transactionsState.failedSync) {
      return const OfflineModeIndicator();
    }
    if (transactionsState.status == TransactionsStatus.loading) {
      return const SynchronizingIndicator();
    }
    return const SizedBox.shrink();
  }
}

class OfflineModeIndicator extends StatelessWidget {
  const OfflineModeIndicator({super.key});

  @override
  Widget build(final BuildContext context) => Container(
    padding: const EdgeInsets.all(8),
    color: Theme.of(context).colorScheme.errorContainer,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.cloud_off,
          color: Theme.of(context).colorScheme.onErrorContainer,
        ),
        const SizedBox(width: 8),
        Text(
          'common.offline_mode'.tr(),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onErrorContainer,
          ),
        ),
      ],
    ),
  );
}

class SynchronizingIndicator extends StatelessWidget {
  const SynchronizingIndicator({super.key});

  @override
  Widget build(final BuildContext context) => Container(
    padding: const EdgeInsets.all(8),
    color: Theme.of(context).colorScheme.surfaceContainerHighest,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          constraints: const BoxConstraints.tightFor(width: 12, height: 12),
          strokeWidth: 3,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(width: 8),
        Text(
          'common.synchronizing'.tr(),
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    ),
  );
}
