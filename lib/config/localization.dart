import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Localization extends StatelessWidget {
  const Localization({
    required this.child,
    super.key,
  });

  static const Locale systemLocale = Locale('system');

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('ru'),
  ];

  // https://en.wikipedia.org/wiki/IETF_language_tag#List_of_common_primary_language_subtags
  static final Map<Locale, String> _languageNames = {
    systemLocale: 'System default',
    const Locale('en'): 'English',
    const Locale('ru'): 'русский',
  };

  static String getLanguageName(final Locale locale) =>
      _languageNames[locale] ?? locale.languageCode;

  final Widget child;

  @override
  Widget build(final BuildContext context) => EasyLocalization(
        supportedLocales: supportedLocales,
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        useFallbackTranslations: true,
        saveLocale: false,
        useOnlyLangCode: false,
        child: child,
      );
}
