import 'package:dio/dio.dart';

/// Storage provider disabled on the server (HTTP 503).
class MedicalRecordsStorageUnavailableException implements Exception {
  const MedicalRecordsStorageUnavailableException();
}

/// Field-level validation errors from a 422 response on medical record endpoints.
class MedicalRecordsValidationException implements Exception {
  const MedicalRecordsValidationException(this.fieldErrors);

  final Map<String, String> fieldErrors;
}

Never rethrowMedicalRecordsApiError(Object error) {
  if (error is MedicalRecordsStorageUnavailableException ||
      error is MedicalRecordsValidationException) {
    throw error;
  }
  if (error is DioException) {
    final status = error.response?.statusCode;
    final data = error.response?.data;
    final map = _asJsonMap(data);
    if (status == 503) {
      throw const MedicalRecordsStorageUnavailableException();
    }
    if (status == 422 && map != null) {
      final errors = map['errors'];
      if (errors is List) {
        final fieldErrors = <String, String>{};
        for (final item in errors) {
          if (item is Map<String, dynamic>) {
            final field = item['field'] as String?;
            final message = item['message'] as String?;
            if (field != null && message != null) {
              fieldErrors[field] = message;
            }
          }
        }
        if (fieldErrors.isNotEmpty) {
          throw MedicalRecordsValidationException(fieldErrors);
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
