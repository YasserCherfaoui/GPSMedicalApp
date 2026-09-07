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

/// API problem details that are not mapped to a more specific exception.
class BookingApiException implements Exception {
  const BookingApiException({
    required this.statusCode,
    this.title,
    this.detail,
    this.code,
  });

  final int statusCode;
  final String? title;
  final String? detail;
  final String? code;

  String get userMessage {
    final parts = <String>[
      if (title != null && title!.trim().isNotEmpty) title!.trim(),
      if (detail != null && detail!.trim().isNotEmpty) detail!.trim(),
    ];
    if (parts.isEmpty) return 'Request failed ($statusCode)';
    return parts.join(' — ');
  }

  @override
  String toString() => 'BookingApiException($statusCode, $userMessage)';
}

Never rethrowBookingApiError(Object error) {
  if (error is SlotTakenException ||
      error is BookingValidationException ||
      error is BookingApiException ||
      error is DiscoveryRateLimitException) {
    throw error;
  }
  if (error is DioException) {
    final status = error.response?.statusCode;
    final data = error.response?.data;
    final map = _asJsonMap(data);
    if (status == 409) {
      final code = map?['code']?.toString();
      // Clinic + doctor booking both use SLOT_TAKEN; treat bare 409 the same.
      if (code == null || code == 'SLOT_TAKEN') {
        throw SlotTakenException(map?['detail']?.toString());
      }
    }
    if (status == 422 && map != null) {
      final errors = map['errors'];
      if (errors is List) {
        final fields = <String, String>{};
        for (final item in errors) {
          final row = _asJsonMap(item);
          if (row == null) continue;
          final field = row['field']?.toString();
          final message = row['message']?.toString();
          if (field != null && message != null) {
            fields[field] = message;
          }
        }
        if (fields.isNotEmpty) {
          throw BookingValidationException(fields);
        }
      }
    }
    if (status == 429) {
      final raw = error.response?.headers.value('retry-after');
      final seconds = int.tryParse(raw ?? '') ?? 60;
      throw DiscoveryRateLimitException(seconds.clamp(1, 3600));
    }
    if (status != null && map != null) {
      throw BookingApiException(
        statusCode: status,
        title: map['title']?.toString(),
        detail: map['detail']?.toString(),
        code: map['code']?.toString(),
      );
    }
  }
  throw error;
}

bool isBookingNetworkError(Object error) {
  if (error is! DioException) return false;
  return switch (error.type) {
    DioExceptionType.connectionError ||
    DioExceptionType.connectionTimeout ||
    DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout => true,
    _ => false,
  };
}

/// User-facing message for booking submit failures (never a silent catch-all).
String bookingSubmitErrorMessage(Object error, String networkFallback) {
  if (error is BookingApiException) return error.userMessage;
  if (error is BookingValidationException) {
    return error.fieldErrors.values.join('\n');
  }
  if (error is DiscoveryRateLimitException) return error.toString();
  if (isBookingNetworkError(error)) return networkFallback;
  if (error is DioException) {
    final status = error.response?.statusCode;
    final map = _asJsonMap(error.response?.data);
    final title = map?['title']?.toString();
    final detail = map?['detail']?.toString();
    if (title != null || detail != null) {
      return [
        if (title != null && title.isNotEmpty) title,
        if (detail != null && detail.isNotEmpty) detail,
      ].join(' — ');
    }
    // Serialization / client errors throw DioException before the request.
    final nested = error.error;
    if (nested != null) {
      final nestedMsg = nested.toString().trim();
      if (nestedMsg.isNotEmpty) return nestedMsg;
    }
    if (status != null) return 'Request failed ($status)';
  }
  final raw = error.toString().trim();
  if (raw.isNotEmpty && raw != 'Exception') return raw;
  return networkFallback;
}

Map<String, dynamic>? _asJsonMap(Object? data) {
  if (data is Map<String, dynamic>) return data;
  if (data is Map) {
    return data.map((k, v) => MapEntry(k.toString(), v));
  }
  return null;
}
