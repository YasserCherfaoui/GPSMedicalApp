import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_locale.dart';

class LocaleNotifier extends Notifier<AppLocale> {
  @override
  AppLocale build() => AppLocale.french;

  void setLocale(AppLocale locale) {
    state = locale;
  }
}

final appLocaleProvider = NotifierProvider<LocaleNotifier, AppLocale>(
  LocaleNotifier.new,
);
