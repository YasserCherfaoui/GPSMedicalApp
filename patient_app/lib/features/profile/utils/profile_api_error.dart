import 'package:dio/dio.dart';

import '../../discovery/utils/discovery_api_error.dart';

/// Field-level validation errors from a 422 response on profile endpoints.
class ProfileValidationException implements Exception {
  const ProfileValidationException(this.fieldErrors);

  final Map<String, String> fieldErrors;
}

Never rethrowProfileApiError(Object error) {
  if (error is ProfileValidationException) {
    throw error;
  }
  if (error is DioException) {
    final status = error.response?.statusCode;
    final data = error.response?.data;
    final map = _asJsonMap(data);
    if (status == 422 && map != null) {
      final errors = map['errors'];
      if (errors is List) {
        final fieldErrors = <String, String>{};
        for (final item in errors) {
          final entry = _asJsonMap(item);
          if (entry == null) continue;
          final field = entry['field'] as String?;
          final message = entry['message'] as String?;
          if (field != null && message != null) {
            fieldErrors[field] = message;
          }
        }
        if (fieldErrors.isNotEmpty) {
          throw ProfileValidationException(fieldErrors);
        }
      }
    }
    if (status == 429) {
      final raw = error.response?.headers.value('retry-after');
      final seconds = int.tryParse(raw ?? '') ?? 60;
      throw DiscoveryRateLimitException(seconds.clamp(1, 3600));
    }
  }
  throw error;
}

Map<String, dynamic>? _asJsonMap(Object? data) {
  if (data is Map<String, dynamic>) return data;
  if (data is Map) {
    return data.map((k, v) => MapEntry(k.toString(), v));
  }
  return null;
}
