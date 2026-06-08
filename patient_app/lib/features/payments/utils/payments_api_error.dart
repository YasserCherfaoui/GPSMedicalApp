import 'package:dio/dio.dart';

class PaymentFailedException implements Exception {
  const PaymentFailedException(this.message);

  final String? message;
}

class PaymentNotPayableException implements Exception {
  const PaymentNotPayableException();
}

Never rethrowPaymentsApiError(Object error) {
  if (error is PaymentFailedException || error is PaymentNotPayableException) {
    throw error;
  }
  if (error is DioException) {
    final status = error.response?.statusCode;
    final map = _asJsonMap(error.response?.data);
    if (status == 402 || (status == 403 && map?['code'] == 'PAYMENT_FAILED')) {
      throw PaymentFailedException(map?['detail'] as String?);
    }
    if (status == 403 && map?['code'] == 'APPOINTMENT_NOT_PAYABLE') {
      throw const PaymentNotPayableException();
    }
    if (status == 402) {
      throw PaymentFailedException(map?['detail'] as String?);
    }
  }
  throw error;
}

String paymentErrorMessage(Object error, String fallback) {
  if (error is PaymentFailedException) {
    return error.message ?? fallback;
  }
  if (error is PaymentNotPayableException) {
    return fallback;
  }
  if (error is DioException) {
    final map = _asJsonMap(error.response?.data);
    final detail = map?['detail'];
    if (detail is String && detail.isNotEmpty) return detail;
  }
  return fallback;
}

Map<String, dynamic>? _asJsonMap(Object? data) {
  if (data is Map<String, dynamic>) return data;
  if (data is Map) {
    return data.map((k, v) => MapEntry(k.toString(), v));
  }
  return null;
}
