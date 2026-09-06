import 'package:dio/dio.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/deposit_eligibility.dart';
import '../utils/payments_api_error.dart';

const paymentPollInterval = Duration(seconds: 2);
const paymentPollTimeout = Duration(seconds: 60);

/// Raw JSON result from EUR `POST /payments/intents` (addendum fields not yet
/// on the generated [PaymentIntent] model).
class EurPaymentIntentCreateResult {
  const EurPaymentIntentCreateResult({
    required this.id,
    required this.status,
    this.clientSecret,
  });

  final String id;
  final String status;
  final String? clientSecret;
}

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

  /// EUR rail create — raw Dio until OpenAPI client includes `amount_minor`.
  ///
  /// Purpose must be `full_consultation` or `teleconsultation` (K-6).
  Future<EurPaymentIntentCreateResult> createEurIntent({
    required String appointmentId,
    required int amountMinor,
    required String purpose,
  }) async {
    try {
      final response = await _client.v1.dio.post<Map<String, dynamic>>(
        '/payments/intents',
        data: {
          'purpose': purpose,
          'appointment_id': appointmentId,
          'amount_minor': amountMinor,
          'currency': 'EUR',
          'provider': 'stripe',
        },
      );
      final data = response.data;
      final id = data?['id'] as String?;
      if (id == null || id.isEmpty) {
        throw StateError('Empty payment intent create response');
      }
      return EurPaymentIntentCreateResult(
        id: id,
        status: data?['status'] as String? ?? 'requires_action',
        clientSecret: data?['client_secret'] as String?,
      );
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
