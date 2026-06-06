import 'package:gps_medical_api/gps_medical_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'token_store.dart';

const accessTokenPrefsKey = 'gps_access_token';
const refreshTokenPrefsKey = 'gps_refresh_token';

/// Persists OAuth tokens in [SharedPreferences].
///
/// Used for app bootstrap because the plugin is already registered in both
/// mobile apps. [SecureTokenStore] can be layered on later when needed.
class SharedPreferencesTokenStore implements TokenStore {
  SharedPreferencesTokenStore(this._prefs);

  final SharedPreferences _prefs;
  String? _accessToken;
  String? _refreshToken;

  Future<void> load() async {
    _accessToken = _prefs.getString(accessTokenPrefsKey);
    _refreshToken = _prefs.getString(refreshTokenPrefsKey);
  }

  @override
  String? get accessToken => _accessToken;

  @override
  String? get refreshToken => _refreshToken;

  @override
  Future<void> saveTokens(TokenPair tokens) async {
    _accessToken = tokens.accessToken;
    _refreshToken = tokens.refreshToken;

    if (_accessToken != null && _accessToken!.isNotEmpty) {
      await _prefs.setString(accessTokenPrefsKey, _accessToken!);
    } else {
      await _prefs.remove(accessTokenPrefsKey);
    }

    if (_refreshToken != null && _refreshToken!.isNotEmpty) {
      await _prefs.setString(refreshTokenPrefsKey, _refreshToken!);
    } else {
      await _prefs.remove(refreshTokenPrefsKey);
    }
  }

  @override
  Future<void> clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
    await _prefs.remove(accessTokenPrefsKey);
    await _prefs.remove(refreshTokenPrefsKey);
  }
}
