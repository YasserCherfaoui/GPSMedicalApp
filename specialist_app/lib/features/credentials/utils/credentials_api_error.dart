import 'package:dio/dio.dart';

/// Storage provider disabled on the server (HTTP 503).
class CredentialsStorageUnavailableException implements Exception {
  const CredentialsStorageUnavailableException();
}

Never rethrowCredentialsApiError(Object error) {
  if (error is CredentialsStorageUnavailableException) {
    throw error;
  }
  if (error is DioException) {
    if (error.response?.statusCode == 503) {
      throw const CredentialsStorageUnavailableException();
    }
  }
  throw error;
}
