import 'package:shared_preferences/shared_preferences.dart';

import '../auth/preferences_token_store.dart';
import '../auth/token_store.dart';
import 'app_launch_preferences.dart';

/// Data loaded before [runApp] so auth and first-run state survive restarts.
class AppBootstrapData {
  const AppBootstrapData({
    required this.tokenStore,
    required this.launchPreferences,
  });

  final TokenStore tokenStore;
  final AppLaunchPreferences launchPreferences;
}

/// Loads tokens and shared preferences before the widget tree starts.
Future<AppBootstrapData> bootstrapGpsMedicalApp() async {
  final prefs = await SharedPreferences.getInstance();
  final tokenStore = SharedPreferencesTokenStore(prefs);
  await tokenStore.load();

  return AppBootstrapData(
    tokenStore: tokenStore,
    launchPreferences: SharedPreferencesAppLaunchPreferences(prefs),
  );
}
