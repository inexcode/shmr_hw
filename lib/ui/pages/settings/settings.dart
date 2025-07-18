import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shmr_hw/config/preferences/theme_notifier.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _getThemeModeDisplayName(final ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return 'settings.theme_mode.light'.tr();
      case ThemeMode.dark:
        return 'settings.theme_mode.dark'.tr();
      case ThemeMode.system:
        return 'settings.theme_mode.system'.tr();
    }
  }

  void _showThemeModeSelector() {
    final themeNotifier = context.read<ThemeNotifier>();

    unawaited(
      showModalBottomSheet<void>(
        context: context,
        builder: (final BuildContext context) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'settings.theme_mode.title'.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              ...ThemeMode.values.map(
                (final themeMode) => ListTile(
                  title: Text(_getThemeModeDisplayName(themeMode)),
                  leading: Radio<ThemeMode>(
                    value: themeMode,
                    groupValue: themeNotifier.themeMode,
                    onChanged: (final ThemeMode? value) {
                      if (value != null) {
                        unawaited(themeNotifier.setThemeMode(value));
                        Navigator.pop(context);
                      }
                    },
                  ),
                  onTap: () {
                    unawaited(themeNotifier.setThemeMode(themeMode));
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('settings.title'.tr())),
    body: Consumer<ThemeNotifier>(
      builder: (final context, final themeNotifier, final child) => ListView(
        children: [
          ListTile(
            title: Text('settings.theme_mode.title'.tr()),
            subtitle: Text(_getThemeModeDisplayName(themeNotifier.themeMode)),
            trailing: const Icon(Icons.arrow_right),
            onTap: _showThemeModeSelector,
          ),
          const Divider(height: 0),
          ListTile(
            title: Text('settings.primary_color'.tr()),
            trailing: const Icon(Icons.arrow_right),
          ),
          const Divider(height: 0),
          ListTile(
            title: Text('settings.sounds'.tr()),
            trailing: const Icon(Icons.arrow_right),
          ),
          const Divider(height: 0),
          ListTile(
            title: Text('settings.haptics'.tr()),
            trailing: const Icon(Icons.arrow_right),
          ),
          const Divider(height: 0),
          ListTile(
            title: Text('settings.code_password'.tr()),
            trailing: const Icon(Icons.arrow_right),
          ),
          const Divider(height: 0),
          ListTile(
            title: Text('settings.synchronization'.tr()),
            trailing: const Icon(Icons.arrow_right),
          ),
          const Divider(height: 0),
          ListTile(
            title: Text('settings.language'.tr()),
            trailing: const Icon(Icons.arrow_right),
          ),
          const Divider(height: 0),
          ListTile(
            title: Text('settings.about'.tr()),
            trailing: const Icon(Icons.arrow_right),
          ),
          const Divider(height: 0),
        ],
      ),
    ),
  );
}
