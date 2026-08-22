import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

import 'auth_session.dart';
import 'auth_user_snapshot.dart';
import 'token_store.dart';

/// Mutable auth session; notifies listeners for [GoRouter] refresh.
class AuthSessionNotifier extends ChangeNotifier {
  AuthSessionNotifier(this._tokenStore) {
    _restoreFromStore();
  }

  final TokenStore _tokenStore;
  AuthSession _session = const AuthSession.unauthenticated();

  AuthSession get session => _session;

  AuthUserSnapshot? get currentUser => _session.user;

  void _restoreFromStore() {
    final access = _tokenStore.accessToken;
    final refresh = _tokenStore.refreshToken;
    final hasAccess = access != null && access.isNotEmpty;
    final hasRefresh = refresh != null && refresh.isNotEmpty;
    if (!hasAccess && !hasRefresh) {
      return;
    }

    final storedUser = _tokenStore.userSnapshot;
    final user =
        storedUser ??
        (hasAccess ? AuthUserSnapshot.fromAccessToken(access) : null);

    _session = AuthSession.authenticated(
      accessToken: hasAccess ? access : null,
      user: user,
    );
  }

  bool get isAuthenticated => _session.isAuthenticated;

  Future<void> signIn(TokenPair tokens, {String? phone}) async {
    final access = tokens.accessToken;
    final refresh = tokens.refreshToken;
    if (access == null || refresh == null) {
      return;
    }
    await _tokenStore.saveTokens(tokens);

    final user =
        AuthUserSnapshot.fromAccessToken(access, phone: phone) ??
        ((phone != null && phone.isNotEmpty)
            ? AuthUserSnapshot(userId: '', role: '', phone: phone)
            : null);
    if (user != null) {
      await _tokenStore.saveUserSnapshot(user);
    }

    _session = AuthSession.authenticated(accessToken: access, user: user);
    notifyListeners();
  }

  /// Updates in-memory session after a successful token refresh.
  /// Tokens are already persisted by the interceptor.
  void applyRefreshedTokens(TokenPair tokens) {
    final access = tokens.accessToken;
    if (access == null || access.isEmpty) {
      return;
    }
    final user =
        AuthUserSnapshot.fromAccessToken(access, phone: _session.user?.phone) ??
        _session.user ??
        _tokenStore.userSnapshot;
    if (user != null && user.userId.isNotEmpty) {
      unawaited(_tokenStore.saveUserSnapshot(user));
    }
    _session = AuthSession.authenticated(accessToken: access, user: user);
    notifyListeners();
  }

  /// Clears tokens and marks the user unauthenticated (logout or refresh failure).
  Future<void> signOut() async {
    await _tokenStore.clearTokens();
    _session = const AuthSession.unauthenticated();
    notifyListeners();
  }

  /// Called when the refresh token is rejected (401/403), not on network loss.
  Future<void> handleSessionExpired() => signOut();
}
