import 'package:dio/dio.dart';
import '../../discovery/utils/discovery_api_error.dart';

/// Thrown when POST/PATCH returns 409 with `code=SLOT_TAKEN`.
class SlotTakenException implements Exception {
  const SlotTakenException([this.message]);

  final String? message;
}

/// Field-level validation errors from a 422 response.
class BookingValidationException implements Exception {
  const BookingValidationException(this.fieldErrors);

  final Map<String, String> fieldErrors;
}

Never rethrowBookingApiError(Object error) {
  if (error is SlotTakenException || error is BookingValidationException) {
    throw error;
  }
  if (error is DioException) {
    final status = error.response?.statusCode;
    final data = error.response?.data;
    final map = _asJsonMap(data);
    if (status == 409) {
      final code = map?['code'] as String?;
      if (code == 'SLOT_TAKEN') {
        throw SlotTakenException(map?['detail'] as String?);
      }
    }
    if (status == 422 && map != null) {
      final errors = map['errors'];
      if (errors is List) {
        final map = <String, String>{};
        for (final item in errors) {
          if (item is Map<String, dynamic>) {
            final field = item['field'] as String?;
            final message = item['message'] as String?;
            if (field != null && message != null) {
              map[field] = message;
            }
          }
        }
        if (map.isNotEmpty) {
          throw BookingValidationException(map);
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
