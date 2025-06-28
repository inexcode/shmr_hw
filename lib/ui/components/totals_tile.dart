import 'package:flutter/material.dart';
import 'package:shmr_hw/ui/components/spoiler_balance.dart';
import 'package:shmr_hw/ui/theme.dart';

class TotalsTile extends StatelessWidget {
  const TotalsTile({
    required this.title,
    required this.trailing,
    this.onTap,
    this.showTrailingArrow = false,
    this.shouldApplySpoiler = false,
    super.key,
  });

  final String title;
  final String trailing;
  final GestureTapCallback? onTap;
  final bool showTrailingArrow;
  final bool shouldApplySpoiler;

  @override
  Widget build(final BuildContext context) => ListTile(
        title: Text(title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (shouldApplySpoiler)
              SpoilerBalance(
                child: Text(
                  trailing,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            else
              Text(
                trailing,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            if (showTrailingArrow) ...[
              const SizedBox(width: 8),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context)
                    .colorScheme
                    .onSurfaceVariant
                    .withAlpha(76),
              ),
            ],
          ],
        ),
        tileColor: ThemeColors.lightGreen,
        onTap: onTap,
      );
}
