import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:shmr_hw/config/preferences/theme_notifier.dart';
import 'package:shmr_hw/config/security/authentication_service.dart';
import 'package:shmr_hw/config/security/pin_service.dart';
import 'package:shmr_hw/ui/pages/security/pin_page.dart';
import 'package:shmr_hw/ui/theme.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isPinSet = false;
  bool _isBiometricAvailable = false;
  bool _isBiometricEnabled = false;
  List<BiometricType> _availableBiometrics = [];

  @override
  void initState() {
    super.initState();
    unawaited(_checkSecurityStatus());
  }

  Future<void> _checkSecurityStatus() async {
    final authService = context.read<AuthenticationService>();
    final isPinSet = await authService.isPinSet();
    final isBiometricAvailable = await authService.isBiometricAvailable();
    final isBiometricEnabled = await authService.isBiometricEnabled();
    final availableBiometrics = await PinService.getAvailableBiometrics();

    if (mounted) {
      setState(() {
        _isPinSet = isPinSet;
        _isBiometricAvailable = isBiometricAvailable;
        _isBiometricEnabled = isBiometricEnabled;
        _availableBiometrics = availableBiometrics;
      });
    }
  }

  String _getBiometricDisplayName() {
    if (_availableBiometrics.contains(BiometricType.face)) {
      return 'security.biometric.face_id'.tr();
    } else if (_availableBiometrics.contains(BiometricType.fingerprint)) {
      return 'security.biometric.fingerprint'.tr();
    } else if (_availableBiometrics.contains(BiometricType.iris)) {
      return 'security.biometric.iris'.tr();
    }
    return 'security.biometric.biometric'.tr();
  }

  Future<void> _toggleBiometric(final bool enabled) async {
    if (!_isPinSet && enabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('security.biometric.pin_required'.tr()),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      return;
    }

    try {
      final authService = context.read<AuthenticationService>();
      await authService.setBiometricEnabled(enabled: enabled);
      await _checkSecurityStatus();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('security.biometric.error_toggle'.tr()),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Future<void> _checkPinStatus() async {
    final authService = context.read<AuthenticationService>();
    final isPinSet = await authService.isPinSet();
    if (mounted) {
      setState(() {
        _isPinSet = isPinSet;
      });
    }
  }

  Future<void> _handlePinSetup() async {
    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (final context) => const PinPage(mode: PinScreenMode.setup),
      ),
    );

    if ((result ?? false) && mounted) {
      await _checkPinStatus();
    }
  }

  Future<void> _handlePinChange() async {
    // First verify current PIN
    final verifyResult = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (final context) => const PinPage(mode: PinScreenMode.verify),
      ),
    );

    if ((verifyResult ?? false) && mounted) {
      // Then set new PIN
      final setupResult = await Navigator.of(context).push<bool>(
        MaterialPageRoute(
          builder: (final context) => const PinPage(mode: PinScreenMode.setup),
        ),
      );

      if ((setupResult ?? false) && mounted) {
        await _checkPinStatus();
      }
    }
  }

  Future<void> _handlePinRemove() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (final context) => AlertDialog(
        title: Text('security.pin.remove_title'.tr()),
        content: Text('security.pin.remove_subtitle'.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('common.cancel'.tr()),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text('common.delete'.tr()),
          ),
        ],
      ),
    );

    if ((confirm ?? false) && mounted) {
      // Verify current PIN before removing
      final verifyResult = await Navigator.of(context).push<bool>(
        MaterialPageRoute(
          builder: (final context) => const PinPage(mode: PinScreenMode.verify),
        ),
      );

      if ((verifyResult ?? false) && mounted) {
        final authService = context.read<AuthenticationService>();
        await authService.removePin();
        await _checkPinStatus();
      }
    }
  }

  Future<void> _showPinOptions() async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (final context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'security.pin.options_title'.tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            if (!_isPinSet) ...[
              ListTile(
                leading: const Icon(Icons.lock),
                title: Text('security.pin.setup_option'.tr()),
                onTap: () async {
                  Navigator.pop(context);
                  await _handlePinSetup();
                },
              ),
            ] else ...[
              ListTile(
                leading: const Icon(Icons.edit),
                title: Text('security.pin.change_option'.tr()),
                onTap: () async {
                  Navigator.pop(context);
                  await _handlePinChange();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.lock_open,
                  color: Theme.of(context).colorScheme.error,
                ),
                title: Text(
                  'security.pin.remove_option'.tr(),
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  await _handlePinRemove();
                },
              ),
            ],
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

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

  Future<void> _showColorPicker() async {
    final themeNotifier = context.read<ThemeNotifier>();
    Color selectedColor = themeNotifier.primaryColor;

    await showDialog<void>(
      context: context,
      builder: (final BuildContext context) => AlertDialog(
        title: Text('settings.primary_color.title'.tr()),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Default color option
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: ThemeColors.toxicGreen,
                  radius: 16,
                ),
                title: Text('settings.primary_color.default'.tr()),
                trailing: themeNotifier.isDefaultColor
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  unawaited(
                    themeNotifier.setPrimaryColor(ThemeColors.toxicGreen),
                  );
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              // Color picker
              ColorPicker(
                pickerColor: selectedColor,
                onColorChanged: (final Color color) {
                  selectedColor = color;
                },
                pickerAreaHeightPercent: 0.8,
                enableAlpha: false,
                displayThumbColor: true,
                paletteType: PaletteType.hslWithHue,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('common.cancel'.tr()),
          ),
          TextButton(
            onPressed: () {
              unawaited(themeNotifier.setPrimaryColor(selectedColor));
              Navigator.pop(context);
            },
            child: Text('common.apply'.tr()),
          ),
        ],
      ),
    );
  }

  String _getPrimaryColorDisplayName(final Color color) {
    if (color == ThemeColors.toxicGreen) {
      return 'settings.primary_color.default'.tr();
    }
    return 'settings.primary_color.custom'.tr();
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
            title: Text('settings.primary_color.title'.tr()),
            subtitle: Text(
              _getPrimaryColorDisplayName(themeNotifier.primaryColor),
            ),
            trailing: CircleAvatar(
              backgroundColor: themeNotifier.primaryColor,
              radius: 16,
            ),
            onTap: _showColorPicker,
          ),
          const Divider(height: 0),
          SwitchListTile(
            title: Text('settings.haptics'.tr()),
            value: themeNotifier.isHapticFeedbackEnabled,
            onChanged: (final bool newValue) =>
                themeNotifier.setHapticFeedback(isEnabled: newValue),
          ),
          const Divider(height: 0),
          ListTile(
            leading: Icon(
              _isPinSet ? Icons.lock : Icons.lock_open,
              color: _isPinSet
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            title: Text('settings.code_password'.tr()),
            subtitle: Text(
              _isPinSet
                  ? 'security.pin.status_enabled'.tr()
                  : 'security.pin.status_disabled'.tr(),
            ),
            trailing: const Icon(Icons.arrow_right),
            onTap: _showPinOptions,
          ),
          if (_isBiometricAvailable) ...[
            const Divider(height: 0),
            SwitchListTile(
              secondary: Icon(
                _availableBiometrics.contains(BiometricType.face)
                    ? Icons.face
                    : Icons.fingerprint,
                color: _isBiometricEnabled
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              title: Text(_getBiometricDisplayName()),
              subtitle: Text(
                _isPinSet
                    ? (_isBiometricEnabled
                          ? 'security.biometric.status_enabled'.tr()
                          : 'security.biometric.status_disabled'.tr())
                    : 'security.biometric.pin_required'.tr(),
              ),
              value: _isBiometricEnabled,
              onChanged: _isPinSet ? _toggleBiometric : null,
            ),
          ],

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
