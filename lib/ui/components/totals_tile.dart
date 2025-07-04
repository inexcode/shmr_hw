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
    this.greenBackground = true,
    super.key,
  });

  final String title;
  final String trailing;
  final GestureTapCallback? onTap;
  final bool showTrailingArrow;
  final bool shouldApplySpoiler;
  final bool greenBackground;

  @override
  Widget build(final BuildContext context) => ListTile(
    title: Text(title),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (shouldApplySpoiler)
          SpoilerBalance(
            child: Text(trailing, style: Theme.of(context).textTheme.bodyLarge),
          )
        else
          DecoratedBox(
            decoration: BoxDecoration(
              color: !greenBackground ? ThemeColors.toxicGreen : null,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: !greenBackground
                  ? const EdgeInsets.symmetric(horizontal: 16, vertical: 4)
                  : EdgeInsets.zero,
              child: Text(
                trailing,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: !greenBackground
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        if (showTrailingArrow) ...[
          const SizedBox(width: 8),
          Icon(
            Icons.chevron_right,
            color: Theme.of(context).colorScheme.onSurfaceVariant.withAlpha(76),
          ),
        ],
      ],
    ),
    tileColor: greenBackground ? ThemeColors.lightGreen : null,
    onTap: onTap,
  );
}
