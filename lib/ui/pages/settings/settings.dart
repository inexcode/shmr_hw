import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('settings.title'.tr()).tr()),
    body: ListView(
      children: [
        SwitchListTile(
          title: Text('settings.dark_mode'.tr()),
          value: false,
          onChanged: (final bool value) {},
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
  );
}
