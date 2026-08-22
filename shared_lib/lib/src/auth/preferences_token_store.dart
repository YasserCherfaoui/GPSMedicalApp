import 'dart:convert';

import 'package:gps_medical_api/gps_medical_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_user_snapshot.dart';
import 'token_store.dart';

const accessTokenPrefsKey = 'gps_access_token';
const refreshTokenPrefsKey = 'gps_refresh_token';
const userSnapshotPrefsKey = 'gps_auth_user';

/// Persists OAuth tokens and a user snapshot in [SharedPreferences].
///
/// Used for app bootstrap because the plugin is already registered in both
/// mobile apps. [SecureTokenStore] can be layered on later when needed.
class SharedPreferencesTokenStore implements TokenStore {
  SharedPreferencesTokenStore(this._prefs);

  final SharedPreferences _prefs;
  String? _accessToken;
  String? _refreshToken;
  AuthUserSnapshot? _userSnapshot;

  Future<void> load() async {
    _accessToken = _prefs.getString(accessTokenPrefsKey);
    _refreshToken = _prefs.getString(refreshTokenPrefsKey);
    _userSnapshot = _decodeSnapshot(_prefs.getString(userSnapshotPrefsKey));
  }

  @override
  String? get accessToken => _accessToken;

  @override
  String? get refreshToken => _refreshToken;

  @override
  AuthUserSnapshot? get userSnapshot => _userSnapshot;

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
  Future<void> saveUserSnapshot(AuthUserSnapshot snapshot) async {
    _userSnapshot = snapshot;
    await _prefs.setString(userSnapshotPrefsKey, jsonEncode(snapshot.toJson()));
  }

  @override
  Future<void> clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
    _userSnapshot = null;
    await _prefs.remove(accessTokenPrefsKey);
    await _prefs.remove(refreshTokenPrefsKey);
    await _prefs.remove(userSnapshotPrefsKey);
  }

  AuthUserSnapshot? _decodeSnapshot(String? raw) {
    if (raw == null || raw.isEmpty) {
      return null;
    }
    try {
      final json = jsonDecode(raw);
      if (json is! Map) {
        return null;
      }
      final snapshot = AuthUserSnapshot.fromJson(
        Map<String, dynamic>.from(json),
      );
      if (snapshot.userId.isEmpty) {
        return null;
      }
      return snapshot;
    } on Object {
      return null;
    }
  }
}
