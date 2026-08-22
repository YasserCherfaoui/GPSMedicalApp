import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

import 'auth_user_snapshot.dart';
import 'token_store.dart';

const _accessTokenKey = 'gps_access_token';
const _refreshTokenKey = 'gps_refresh_token';
const _userSnapshotKey = 'gps_auth_user';

/// Persists OAuth tokens in platform secure storage.
class SecureTokenStore implements TokenStore {
  SecureTokenStore({FlutterSecureStorage? storage})
    : _storage =
          storage ??
          const FlutterSecureStorage(
            aOptions: AndroidOptions(encryptedSharedPreferences: true),
          );

  final FlutterSecureStorage _storage;
  String? _accessToken;
  String? _refreshToken;
  AuthUserSnapshot? _userSnapshot;

  /// Loads cached tokens from secure storage into memory.
  Future<void> load() async {
    _accessToken = await _storage.read(key: _accessTokenKey);
    _refreshToken = await _storage.read(key: _refreshTokenKey);
    _userSnapshot = _decodeSnapshot(await _storage.read(key: _userSnapshotKey));
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
    await _storage.write(key: _accessTokenKey, value: _accessToken);
    await _storage.write(key: _refreshTokenKey, value: _refreshToken);
  }

  @override
  Future<void> saveUserSnapshot(AuthUserSnapshot snapshot) async {
    _userSnapshot = snapshot;
    await _storage.write(
      key: _userSnapshotKey,
      value: jsonEncode(snapshot.toJson()),
    );
  }

  @override
  Future<void> clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
    _userSnapshot = null;
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
    await _storage.delete(key: _userSnapshotKey);
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
