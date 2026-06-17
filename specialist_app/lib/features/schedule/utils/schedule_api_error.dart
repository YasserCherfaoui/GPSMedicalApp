import 'package:dio/dio.dart';

class ScheduleValidationException implements Exception {
  const ScheduleValidationException(this.fieldErrors);

  final Map<String, String> fieldErrors;
}

Never rethrowScheduleApiError(Object error) {
  if (error is ScheduleValidationException) {
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
          final code = entry['code'] as String? ?? entry['message'] as String?;
          if (field != null && code != null) {
            fieldErrors[field] = code;
          }
        }
        if (fieldErrors.isNotEmpty) {
          throw ScheduleValidationException(fieldErrors);
        }
      }
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
