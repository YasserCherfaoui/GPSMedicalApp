import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_locale.dart' as l10n;

part 'locale.provider.g.dart';

const _kLocaleKey = 'app_locale';

@Riverpod(keepAlive: true)
class AppLocale extends _$AppLocale {
  @override
  l10n.AppLocale build() {
    // Synchronous initial value; persistence is loaded via [loadSavedLocale].
    return l10n.AppLocale.french;
  }

  /// Call once at app start (after [ProviderScope] is mounted) to restore
  /// the locale that the user previously selected.
  Future<void> loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_kLocaleKey);
    if (saved == null) return;
    final match = l10n.AppLocale.values.where(
      (e) => e.locale.languageCode == saved,
    );
    if (match.isNotEmpty) {
      state = match.first;
    }
  }

  Future<void> setLocale(l10n.AppLocale locale) async {
    state = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kLocaleKey, locale.locale.languageCode);
  }
}
