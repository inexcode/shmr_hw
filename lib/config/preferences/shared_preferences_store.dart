import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shmr_hw/config/localization.dart';
import 'package:shmr_hw/config/preferences/preferences_store.dart';
import 'package:shmr_hw/ui/theme.dart';

class SharedPreferencesStore implements PreferencesStore {
  static const String _themeModeKey = 'theme_mode';
  static const String _primaryColorKey = 'primary_color';
  static const String _hapticFeedbackKey = 'haptic_feedback';
  static const String _languageCodeKey = 'language_code';

  @override
  Future<void> setThemeMode(final ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey, themeMode.name);
  }

  @override
  Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeString = prefs.getString(_themeModeKey);

    if (themeModeString == null) {
      return ThemeMode.system;
    }

    return ThemeMode.values.firstWhere(
      (final mode) => mode.name == themeModeString,
      orElse: () => ThemeMode.system,
    );
  }

  @override
  Future<void> setPrimaryColor(final Color primaryColor) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_primaryColorKey, primaryColor.toARGB32());
  }

  @override
  Future<Color> getPrimaryColor() async {
    final prefs = await SharedPreferences.getInstance();
    final colorValue = prefs.getInt(_primaryColorKey);

    if (colorValue == null) {
      return ThemeColors.toxicGreen;
    }

    return Color(colorValue);
  }

  @override
  Future<void> setHapticFeedback({
    required final bool hapticFeedbackEnabled,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hapticFeedbackKey, hapticFeedbackEnabled);
  }

  @override
  Future<bool> isHapticFeedbackEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hapticFeedbackKey) ?? true;
  }

  @override
  Future<void> setActiveLocale(final Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageCodeKey, locale.toString());
  }

  @override
  Future<Locale> getActiveLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedLocaleCode = prefs.getString(_languageCodeKey);
    if (storedLocaleCode != null) {
      return Locale(storedLocaleCode);
    }
    return Localization.systemLocale;
  }

  @override
  Future<void> resetLocale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_languageCodeKey);
  }
}
