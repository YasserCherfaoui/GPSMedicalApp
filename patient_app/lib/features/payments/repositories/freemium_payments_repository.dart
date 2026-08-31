import 'package:dio/dio.dart';

import '../utils/payments_api_error.dart';
import '../utils/sandbox_gateway_token.dart';
import 'payments_repository.dart';

/// Sandbox unlock for bilan détaillé and coaching premium (W29).
class FreemiumPaymentsRepository {
  FreemiumPaymentsRepository(this._dio);

  final Dio _dio;

  static const bilanDetailedAmountDzd = 500;
  static const coachingPremiumAmountDzd = 500;

  Future<void> unlockFeature({
    required String sessionId,
    required String purpose,
    required int amountDzd,
    bool sandboxSucceed = true,
  }) async {
    try {
      final create = await _dio.post<Map<String, dynamic>>(
        '/payments/intents',
        data: {
          'purpose': purpose,
          'session_id': sessionId,
          'amount_dzd': amountDzd,
          'provider': 'stripe_test',
        },
      );
      final intentId = create.data?['id'] as String?;
      if (intentId == null || intentId.isEmpty) {
        throw StateError('Payment intent missing id');
      }

      await _dio.post<Map<String, dynamic>>(
        '/payments/intents/$intentId/confirm',
        data: {'gateway_token': sandboxGatewayToken(succeed: sandboxSucceed)},
      );

      final deadline = DateTime.now().add(paymentPollTimeout);
      while (DateTime.now().isBefore(deadline)) {
        final poll = await _dio.get<Map<String, dynamic>>(
          '/payments/intents/$intentId',
        );
        final status = poll.data?['status'] as String?;
        if (status != null && _isTerminal(status)) {
          if (status != 'succeeded') {
            throw FreemiumPaymentException('Payment failed');
          }
          return;
        }
        await Future<void>.delayed(paymentPollInterval);
      }
      throw FreemiumPaymentException('Payment timed out');
    } catch (e) {
      if (e is FreemiumPaymentException) rethrow;
      rethrowPaymentsApiError(e);
    }
  }

  bool _isTerminal(String status) =>
      status == 'succeeded' || status == 'failed' || status == 'cancelled';
}

class FreemiumPaymentException implements Exception {
  FreemiumPaymentException(this.message);

  final String message;

  @override
  String toString() => message;
}
