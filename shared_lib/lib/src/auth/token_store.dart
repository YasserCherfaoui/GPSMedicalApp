import 'package:gps_medical_api/gps_medical_api.dart';

/// Persists OAuth access and refresh tokens for authenticated API calls.
abstract class TokenStore {
  String? get accessToken;

  String? get refreshToken;

  Future<void> saveTokens(TokenPair tokens);

  Future<void> clearTokens();
}

/// In-memory [TokenStore] for tests and early app scaffolding.
class InMemoryTokenStore implements TokenStore {
  String? _accessToken;
  String? _refreshToken;

  @override
  String? get accessToken => _accessToken;

  @override
  String? get refreshToken => _refreshToken;

  @override
  Future<void> clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
  }

  @override
  Future<void> saveTokens(TokenPair tokens) async {
    _accessToken = tokens.accessToken;
    _refreshToken = tokens.refreshToken;
  }
}
