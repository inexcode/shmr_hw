import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shmr_hw/config/preferences/preferences_store.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier(this._preferencesStore) {
    unawaited(_loadThemeMode());
  }

  final PreferencesStore _preferencesStore;
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  Future<void> _loadThemeMode() async {
    _themeMode = await _preferencesStore.getThemeMode();
    notifyListeners();
  }

  Future<void> setThemeMode(final ThemeMode themeMode) async {
    if (_themeMode != themeMode) {
      _themeMode = themeMode;
      await _preferencesStore.setThemeMode(themeMode);
      notifyListeners();
    }
  }
}
