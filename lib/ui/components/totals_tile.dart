import 'package:flutter/material.dart';
import 'package:shmr_hw/ui/theme.dart';

class TotalsTile extends StatelessWidget {
  const TotalsTile({
    required this.title,
    required this.trailing,
    this.onTap,
    super.key,
  });

  final String title;
  final String trailing;
  final GestureTapCallback? onTap;

  @override
  Widget build(final BuildContext context) => ListTile(
        title: Text(title),
        trailing: Text(
          trailing,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        tileColor: ThemeColors.lightGreen,
        onTap: onTap,
      );
}
