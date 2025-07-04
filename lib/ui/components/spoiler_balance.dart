import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_hw/logic/bloc/balance_spoiler/balance_spoiler_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SpoilerBalance extends StatelessWidget {
  const SpoilerBalance({required this.child, super.key});

  final Widget child;

  @override
  Widget build(final BuildContext context) {
    final spoilerState = context.watch<BalanceSpoilerBloc>().state;

    return Skeletonizer(
      enabled: spoilerState is HideBalanceSpoilerState,
      effect: SoldColorEffect(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
      ),
      enableSwitchAnimation: true,
      child: child,
    );
  }
}
