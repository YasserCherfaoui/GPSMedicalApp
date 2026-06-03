import 'package:dio/dio.dart';

/// Thrown when the API returns HTTP 429 with an optional [retryAfterSeconds] header.
class DiscoveryRateLimitException implements Exception {
  DiscoveryRateLimitException(this.retryAfterSeconds, [this.message]);

  final int retryAfterSeconds;
  final String? message;

  @override
  String toString() =>
      message ??
      'Trop de requêtes. Réessayez dans $retryAfterSeconds secondes.';
}

/// Maps [DioException] to a user-facing error; rethrows [DiscoveryRateLimitException] for 429.
Never rethrowDiscoveryApiError(Object error) {
  if (error is DiscoveryRateLimitException) {
    throw error;
  }
  if (error is DioException) {
    final status = error.response?.statusCode;
    if (status == 429) {
      final raw = error.response?.headers.value('retry-after');
      final seconds = int.tryParse(raw ?? '') ?? 60;
      throw DiscoveryRateLimitException(seconds.clamp(1, 3600));
    }
  }
  throw error;
}

int? parseRetryAfterSeconds(Object error) {
  if (error is DiscoveryRateLimitException) {
    return error.retryAfterSeconds;
  }
  if (error is DioException && error.response?.statusCode == 429) {
    final raw = error.response?.headers.value('retry-after');
    return int.tryParse(raw ?? '') ?? 60;
  }
  return null;
}
