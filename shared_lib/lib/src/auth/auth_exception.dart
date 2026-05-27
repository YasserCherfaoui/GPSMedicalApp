import '../l10n/auth_strings.dart';

/// Machine-readable auth error codes to facilitate dynamic localization in the UI.
enum AuthErrorCode {
  invalidCredentials,
  accessDenied,
  tooManyRequests,
  internalServerError,
  connectionTimeout,
  connectionError,
  unknownNetwork,
  validationError,
  conflictError,
}

/// Auth API failures surfaced to the UI.
sealed class AuthException implements Exception {
  const AuthException(this.message, {this.errorCode});

  final String message;
  final AuthErrorCode? errorCode;

  /// Translates the exception into the active locale using the provided [AuthStrings].
  String getLocalizedMessage(AuthStrings strings) {
    if (errorCode == null) return message;
    switch (errorCode!) {
      case AuthErrorCode.invalidCredentials:
        return strings.errorInvalidCredentials;
      case AuthErrorCode.accessDenied:
        return strings.errorAccessDenied;
      case AuthErrorCode.tooManyRequests:
        return strings.errorTooManyRequests;
      case AuthErrorCode.internalServerError:
        return strings.errorInternalServer;
      case AuthErrorCode.connectionTimeout:
        return strings.errorNetworkTimeout;
      case AuthErrorCode.connectionError:
        return strings.errorNetworkConnection;
      case AuthErrorCode.unknownNetwork:
        return strings.networkError;
      case AuthErrorCode.validationError:
      case AuthErrorCode.conflictError:
        return message;
    }
  }

  @override
  String toString() => message;
}

final class AuthValidationException extends AuthException {
  const AuthValidationException(
    super.message, {
    super.errorCode = AuthErrorCode.validationError,
  });
}

final class AuthNetworkException extends AuthException {
  const AuthNetworkException(
    super.message, {
    super.errorCode = AuthErrorCode.unknownNetwork,
  });
}

final class AuthUnauthorizedException extends AuthException {
  const AuthUnauthorizedException(super.message, {super.errorCode});
}

final class AuthConflictException extends AuthException {
  const AuthConflictException(
    super.message, {
    super.errorCode = AuthErrorCode.conflictError,
  });
}
