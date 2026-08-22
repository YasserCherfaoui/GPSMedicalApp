import 'package:gps_medical_api/gps_medical_api.dart';

import 'auth_user_snapshot.dart';

/// Persists OAuth access/refresh tokens and a small user snapshot.
abstract class TokenStore {
  String? get accessToken;

  String? get refreshToken;

  AuthUserSnapshot? get userSnapshot;

  Future<void> saveTokens(TokenPair tokens);

  Future<void> saveUserSnapshot(AuthUserSnapshot snapshot);

  Future<void> clearTokens();
}

/// In-memory [TokenStore] for tests and early app scaffolding.
class InMemoryTokenStore implements TokenStore {
  String? _accessToken;
  String? _refreshToken;
  AuthUserSnapshot? _userSnapshot;

  @override
  String? get accessToken => _accessToken;

  @override
  String? get refreshToken => _refreshToken;

  @override
  AuthUserSnapshot? get userSnapshot => _userSnapshot;

  @override
  Future<void> clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
    _userSnapshot = null;
  }

  @override
  Future<void> saveTokens(TokenPair tokens) async {
    _accessToken = tokens.accessToken;
    _refreshToken = tokens.refreshToken;
  }

  @override
  Future<void> saveUserSnapshot(AuthUserSnapshot snapshot) async {
    _userSnapshot = snapshot;
  }
}
