import 'package:flutter/foundation.dart';

import 'auth_user_snapshot.dart';

/// High-level authentication status for routing and UI.
enum AuthStatus { unauthenticated, authenticated }

/// Immutable auth session exposed to the UI and router redirect logic.
@immutable
class AuthSession {
  const AuthSession({required this.status, this.accessToken, this.user});

  const AuthSession.unauthenticated()
    : status = AuthStatus.unauthenticated,
      accessToken = null,
      user = null;

  const AuthSession.authenticated({this.accessToken, this.user})
    : status = AuthStatus.authenticated;

  final AuthStatus status;
  final String? accessToken;
  final AuthUserSnapshot? user;

  /// True once a session has been restored or signed in. Does not require a
  /// live network call — expired access tokens still count until refresh
  /// is definitively rejected.
  bool get isAuthenticated => status == AuthStatus.authenticated;
}
