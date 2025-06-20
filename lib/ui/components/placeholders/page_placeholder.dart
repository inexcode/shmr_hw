import 'package:flutter/material.dart';

class PagePlaceholder extends StatelessWidget {
  const PagePlaceholder({
    required this.title,
    required this.iconData,
    this.description,
    super.key,
  });

  final IconData iconData;
  final String title;
  final String? description;

  @override
  Widget build(final BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 48,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
              textAlign: TextAlign.center,
            ),
            if (description != null) const SizedBox(height: 8),
            if (description != null)
              Text(
                description!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
          ],
        ),
      );
}
