import 'package:flutter/foundation.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

import 'auth_session.dart';
import 'token_store.dart';

/// Mutable auth session; notifies listeners for [GoRouter] refresh.
class AuthSessionNotifier extends ChangeNotifier {
  AuthSessionNotifier(this._tokenStore) {
    _restoreFromStore();
  }

  final TokenStore _tokenStore;
  AuthSession _session = const AuthSession.unauthenticated();

  AuthSession get session => _session;

  void _restoreFromStore() {
    final access = _tokenStore.accessToken;
    final refresh = _tokenStore.refreshToken;
    if (access != null &&
        access.isNotEmpty &&
        refresh != null &&
        refresh.isNotEmpty) {
      _session = AuthSession.authenticated(accessToken: access);
    }
  }

  bool get isAuthenticated => _session.isAuthenticated;

  Future<void> signIn(TokenPair tokens) async {
    final access = tokens.accessToken;
    final refresh = tokens.refreshToken;
    if (access == null || refresh == null) {
      return;
    }
    await _tokenStore.saveTokens(tokens);
    _session = AuthSession.authenticated(accessToken: access);
    notifyListeners();
  }

  /// Clears tokens and marks the user unauthenticated (logout or refresh failure).
  Future<void> signOut() async {
    await _tokenStore.clearTokens();
    _session = const AuthSession.unauthenticated();
    notifyListeners();
  }

  /// Called when refresh fails or the API returns 401 without recovery.
  Future<void> handleSessionExpired() => signOut();
}
