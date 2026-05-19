import 'package:flutter/foundation.dart';

/// High-level authentication status for routing and UI.
enum AuthStatus { unauthenticated, authenticated }

/// Immutable auth session exposed to the UI and router redirect logic.
@immutable
class AuthSession {
  const AuthSession({required this.status, this.accessToken});

  const AuthSession.unauthenticated()
    : status = AuthStatus.unauthenticated,
      accessToken = null;

  const AuthSession.authenticated({required this.accessToken})
    : status = AuthStatus.authenticated;

  final AuthStatus status;
  final String? accessToken;

  bool get isAuthenticated =>
      status == AuthStatus.authenticated &&
      accessToken != null &&
      accessToken!.isNotEmpty;
}
