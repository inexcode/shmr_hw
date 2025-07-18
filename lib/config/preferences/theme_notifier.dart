import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shmr_hw/config/preferences/preferences_store.dart';
import 'package:shmr_hw/ui/theme.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier(this._preferencesStore) {
    unawaited(_loadThemeSettings());
  }

  final PreferencesStore _preferencesStore;
  ThemeMode _themeMode = ThemeMode.system;
  Color _primaryColor = ThemeColors.toxicGreen;

  ThemeMode get themeMode => _themeMode;
  Color get primaryColor => _primaryColor;

  bool get isDefaultColor => _primaryColor == ThemeColors.toxicGreen;

  ThemeData get lightTheme =>
      isDefaultColor ? themeData : _createCustomTheme(Brightness.light);

  ThemeData get darkTheme =>
      isDefaultColor ? darkThemeData : _createCustomTheme(Brightness.dark);

  Future<void> _loadThemeSettings() async {
    _themeMode = await _preferencesStore.getThemeMode();
    _primaryColor = await _preferencesStore.getPrimaryColor();
    notifyListeners();
  }

  Future<void> setThemeMode(final ThemeMode themeMode) async {
    if (_themeMode != themeMode) {
      _themeMode = themeMode;
      await _preferencesStore.setThemeMode(themeMode);
      notifyListeners();
    }
  }

  Future<void> setPrimaryColor(final Color color) async {
    if (_primaryColor != color) {
      _primaryColor = color;
      await _preferencesStore.setPrimaryColor(color);
      notifyListeners();
    }
  }

  ThemeData _createCustomTheme(final Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: brightness,
    );

    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: brightness == Brightness.light
            ? colorScheme.primaryContainer
            : colorScheme.primary.withAlpha(76),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        centerTitle: true,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: const CircleBorder(),
      ),
    );
  }
}
