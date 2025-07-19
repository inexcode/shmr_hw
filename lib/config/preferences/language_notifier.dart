import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shmr_hw/config/localization.dart';
import 'package:shmr_hw/config/preferences/preferences_store.dart';

class LanguageNotifier extends ChangeNotifier {
  LanguageNotifier({
    required this.preferencesStore,
    required this.getSupportedLocales,
    required this.getDelegateLocale,
    required this.setDelegateLocale,
    required this.resetDelegateLocale,
  }) {
    unawaited(_loadLanguageSettings());
  }

  bool _loaded = false;
  bool get loaded => _loaded;

  final void Function(Locale) setDelegateLocale;
  final void Function() resetDelegateLocale;
  final List<Locale> Function() getSupportedLocales;
  final Locale Function() getDelegateLocale;

  final PreferencesStore preferencesStore;
  late Locale _locale;
  Locale get locale => getDelegateLocale();
  late List<Locale> _supportedLocales;
  List<Locale> get supportedLocales => _supportedLocales;

  Future<void> _loadLanguageSettings() async {
    _supportedLocales = [
      Localization.systemLocale,
      ...Localization.supportedLocales,
    ];

    _locale = await preferencesStore.getActiveLocale();

    if (_locale != Localization.systemLocale) {
      setDelegateLocale(_locale);
    } else {
      resetDelegateLocale();
    }

    _loaded = true;

    notifyListeners();
  }

  Future<void> setLocale(
    final Locale newLocale,
    final BuildContext context,
  ) async {
    if (newLocale == _locale) {
      return;
    }

    // Store the new Locale in memory
    _locale = newLocale;

    if (newLocale == Localization.systemLocale) {
      return resetLocale();
    }

    // Persist the change
    await preferencesStore.setActiveLocale(newLocale);

    setDelegateLocale(newLocale);

    notifyListeners();
  }

  Future<void> resetLocale() async {
    resetDelegateLocale();
    await preferencesStore.resetLocale();
  }

  String getLanguageDisplayName(final Locale locale) =>
      Localization.getLanguageName(locale);

  List<String> get availableLanguageCodes => [
    'system',
    ...Localization.supportedLocales.map((final locale) => locale.languageCode),
  ];
}
