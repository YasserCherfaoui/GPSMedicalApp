import 'package:dio/dio.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/deposit_eligibility.dart';
import '../utils/payments_api_error.dart';

const paymentPollInterval = Duration(seconds: 2);
const paymentPollTimeout = Duration(seconds: 60);

class PaymentsRepository {
  PaymentsRepository(this._client);

  final GpsMedicalClient _client;

  Future<PaymentIntent> createDepositIntent({
    required String appointmentId,
    required int amountDzd,
    String? returnUrl,
  }) async {
    try {
      final body = PaymentIntentCreate(
        (b) => b
          ..purpose = PaymentIntentCreatePurposeEnum.appointmentDeposit
          ..appointmentId = appointmentId
          ..amountDzd = amountDzd
          ..provider = PaymentIntentCreateProviderEnum.stripeTest
          ..returnUrl = returnUrl,
      );
      final response = await _client.payments.createPaymentIntent(
        paymentIntentCreate: body,
      );
      final intent = response.data;
      if (intent == null) {
        throw StateError('Empty payment intent create response');
      }
      return intent;
    } catch (e) {
      rethrowPaymentsApiError(e);
    }
  }

  Future<PaymentIntent> getIntent(String intentId) async {
    try {
      final response = await _client.payments.getPaymentIntent(
        intentId: intentId,
      );
      final intent = response.data;
      if (intent == null) {
        throw StateError('Empty payment intent response');
      }
      return intent;
    } on DioException catch (e) {
      rethrowPaymentsApiError(e);
    }
  }

  Future<PaymentIntent> confirm({
    required String intentId,
    required String gatewayToken,
  }) async {
    try {
      final request = ConfirmPaymentIntentRequest(
        (b) => b..gatewayToken = gatewayToken,
      );
      await _client.payments.confirmPaymentIntent(
        intentId: intentId,
        confirmPaymentIntentRequest: request,
      );
      return getIntent(intentId);
    } catch (e) {
      rethrowPaymentsApiError(e);
    }
  }

  Future<PaymentIntent> pollUntilTerminal(
    String intentId, {
    Duration interval = paymentPollInterval,
    Duration timeout = paymentPollTimeout,
  }) async {
    final deadline = DateTime.now().add(timeout);
    PaymentIntent? last;
    while (DateTime.now().isBefore(deadline)) {
      last = await getIntent(intentId);
      if (isPaymentIntentTerminal(last.status)) {
        return last;
      }
      await Future<void>.delayed(interval);
    }
    if (last != null) return last;
    throw StateError('Payment intent poll timed out');
  }
}
