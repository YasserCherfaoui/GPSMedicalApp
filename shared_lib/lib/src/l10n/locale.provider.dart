import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_locale.dart' as l10n;

part 'locale.provider.g.dart';

@Riverpod(keepAlive: true)
class AppLocale extends _$AppLocale {
  @override
  l10n.AppLocale build() => l10n.AppLocale.french;

  void setLocale(l10n.AppLocale locale) {
    state = locale;
  }
}
