/// Auth API failures surfaced to the UI.
sealed class AuthException implements Exception {
  const AuthException(this.message);

  final String message;

  @override
  String toString() => message;
}

final class AuthValidationException extends AuthException {
  const AuthValidationException(super.message);
}

final class AuthNetworkException extends AuthException {
  const AuthNetworkException(super.message);
}

final class AuthUnauthorizedException extends AuthException {
  const AuthUnauthorizedException(super.message);
}

final class AuthConflictException extends AuthException {
  const AuthConflictException(super.message);
}
