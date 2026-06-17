import 'package:dio/dio.dart';

class AppointmentActionException implements Exception {
  const AppointmentActionException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;
}

Never rethrowAppointmentApiError(Object error) {
  if (error is AppointmentActionException) {
    throw error;
  }
  if (error is DioException) {
    final status = error.response?.statusCode;
    final data = error.response?.data;
    final map = _asJsonMap(data);
    final detail = map?['detail'] as String? ?? map?['title'] as String?;
    if (status == 409 || status == 422 || status == 400) {
      throw AppointmentActionException(
        detail ?? 'Operation impossible',
        statusCode: status,
      );
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
