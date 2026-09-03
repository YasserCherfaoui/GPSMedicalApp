import 'package:flutter/material.dart';

/// Supported app locales.
enum AppLocale {
  french(Locale('fr'), 'Français', TextDirection.ltr),
  arabic(Locale('ar'), 'العربية', TextDirection.rtl),
  tamazight(Locale('ber'), 'ⵜⴰⵎⴰⵣⵉⵖⵜ', TextDirection.ltr),
  english(Locale('en'), 'English', TextDirection.ltr),
  spanish(Locale('es'), 'Español', TextDirection.ltr),
  italian(Locale('it'), 'Italiano', TextDirection.ltr),
  german(Locale('de'), 'Deutsch', TextDirection.ltr),
  dutch(Locale('nl'), 'Nederlands', TextDirection.ltr),
  russian(Locale('ru'), 'Русский', TextDirection.ltr),
  portuguese(Locale('pt'), 'Português', TextDirection.ltr);

  const AppLocale(this.locale, this.label, this.textDirection);

  final Locale locale;
  final String label;
  final TextDirection textDirection;

  static AppLocale fromLocale(Locale? locale) {
    if (locale == null) {
      return AppLocale.french;
    }
    for (final item in AppLocale.values) {
      if (item.locale.languageCode == locale.languageCode) {
        return item;
      }
    }
    return AppLocale.french;
  }
}
