import 'package:dio/dio.dart';

class ReviewAlreadyExistsException implements Exception {
  const ReviewAlreadyExistsException();
}

class ReviewNotEligibleException implements Exception {
  const ReviewNotEligibleException();
}

class ReviewValidationException implements Exception {
  const ReviewValidationException(this.fieldErrors);

  final Map<String, String> fieldErrors;
}

Never rethrowReviewsApiError(Object error) {
  if (error is ReviewAlreadyExistsException ||
      error is ReviewNotEligibleException ||
      error is ReviewValidationException) {
    throw error;
  }
  if (error is DioException) {
    final status = error.response?.statusCode;
    final map = _asJsonMap(error.response?.data);
    if (status == 403) {
      final code = map?['code'] as String?;
      if (code == 'REVIEW_ALREADY_EXISTS') {
        throw const ReviewAlreadyExistsException();
      }
      if (code == 'APPOINTMENT_NOT_ELIGIBLE') {
        throw const ReviewNotEligibleException();
      }
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
          throw ReviewValidationException(fieldErrors);
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
