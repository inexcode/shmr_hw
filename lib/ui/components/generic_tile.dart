import 'package:flutter/material.dart';

class GenericTile extends StatelessWidget {
  const GenericTile({
    required this.title,
    required this.trailing,
    this.leading,
    this.subtitle,
    this.onTap,
    this.showTrailingChevron = false,
    super.key,
  });

  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final GestureTapCallback? onTap;
  final bool showTrailingChevron;
  final Widget? trailing;

  @override
  Widget build(final BuildContext context) => ListTile(
    leading: leading,
    title: title,
    subtitle: subtitle,
    minTileHeight: 70,
    onTap: onTap,
    trailing: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ?trailing,
        ...showTrailingChevron
            ? [
                const SizedBox(width: 8),
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurfaceVariant.withAlpha(76),
                ),
              ]
            : const [],
      ],
    ),
  );
}
