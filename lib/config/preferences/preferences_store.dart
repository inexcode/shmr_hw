import 'package:flutter/material.dart';

abstract interface class PreferencesStore {
  Future<void> setThemeMode(final ThemeMode themeMode);

  Future<ThemeMode> getThemeMode();

  Future<void> setPrimaryColor(final Color primaryColor);

  Future<Color> getPrimaryColor();

  Future<void> setHapticFeedback({required final bool hapticFeedbackEnabled});

  Future<bool> isHapticFeedbackEnabled();

  Future<void> setActiveLocale(final Locale locale);

  Future<Locale> getActiveLocale();

  Future<void> resetLocale();
}
