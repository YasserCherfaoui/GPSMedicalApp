import 'package:flutter/material.dart';

/// Supported app locales for Phase 1 auth (task 1.16 / 1.17).
enum AppLocale {
  french(Locale('fr'), 'Français', TextDirection.ltr),
  arabic(Locale('ar'), 'العربية', TextDirection.rtl),
  tamazight(Locale('ber'), 'ⵜⴰⵎⴰⵣⵉⵖⵜ', TextDirection.ltr);

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
