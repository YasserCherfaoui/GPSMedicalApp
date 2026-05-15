import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

/// tests for PaymentsApi
void main() {
  final instance = GpsMedicalApi().getPaymentsApi();

  group(PaymentsApi, () {
    // Confirmation côté client (token gateway)
    //
    //Future<PaymentIntent> paymentsIntentsIntentIdConfirmPost(String intentId, PaymentsIntentsIntentIdConfirmPostRequest paymentsIntentsIntentIdConfirmPostRequest) async
    test('test paymentsIntentsIntentIdConfirmPost', () async {
      // TODO
    });

    // État d'une intention
    //
    //Future<PaymentIntent> paymentsIntentsIntentIdGet(String intentId) async
    test('test paymentsIntentsIntentIdGet', () async {
      // TODO
    });

    // Création d'une intention de paiement (acompte ou téléconsultation)
    //
    //Future<PaymentIntent> paymentsIntentsPost(PaymentIntentCreate paymentIntentCreate) async
    test('test paymentsIntentsPost', () async {
      // TODO
    });

    // Demande de remboursement
    //
    //Future<Refund> paymentsRefundsPost(RefundRequest refundRequest) async
    test('test paymentsRefundsPost', () async {
      // TODO
    });

    // Webhook entrant des prestataires de paiement
    //
    // Validation HMAC du payload selon `provider`.
    //
    //Future paymentsWebhooksProviderPost(String provider, BuiltMap<String, JsonObject> requestBody) async
    test('test paymentsWebhooksProviderPost', () async {
      // TODO
    });
  });
}
