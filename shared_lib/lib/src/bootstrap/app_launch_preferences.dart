import 'package:shared_preferences/shared_preferences.dart';

/// Persists first-run onboarding completion for cold-start routing.
abstract class AppLaunchPreferences {
  bool get onboardingCompleted;

  Future<void> setOnboardingCompleted(bool value);
}

class SharedPreferencesAppLaunchPreferences implements AppLaunchPreferences {
  SharedPreferencesAppLaunchPreferences(this._prefs);

  static const _onboardingCompletedKey = 'onboarding_completed_v1';

  final SharedPreferences _prefs;

  @override
  bool get onboardingCompleted =>
      _prefs.getBool(_onboardingCompletedKey) ?? false;

  @override
  Future<void> setOnboardingCompleted(bool value) async {
    await _prefs.setBool(_onboardingCompletedKey, value);
  }
}

/// In-memory implementation for tests and apps without bootstrap overrides.
class InMemoryAppLaunchPreferences implements AppLaunchPreferences {
  bool _onboardingCompleted = false;

  @override
  bool get onboardingCompleted => _onboardingCompleted;

  @override
  Future<void> setOnboardingCompleted(bool value) async {
    _onboardingCompleted = value;
  }
}
