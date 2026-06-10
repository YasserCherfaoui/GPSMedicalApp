import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';


/// tests for PaymentsApi
void main() {
  final instance = GpsMedicalApi().getPaymentsApi();

  group(PaymentsApi, () {
    // Confirmation côté client (token gateway)
    //
    //Future confirmPaymentIntent(String intentId, ConfirmPaymentIntentRequest confirmPaymentIntentRequest) async
    test('test confirmPaymentIntent', () async {
      // TODO
    });

    // Création d'une intention de paiement (acompte ou téléconsultation)
    //
    //Future<PaymentIntent> createPaymentIntent(PaymentIntentCreate paymentIntentCreate) async
    test('test createPaymentIntent', () async {
      // TODO
    });

    // Demande de remboursement
    //
    //Future<Refund> createRefund(RefundRequest refundRequest) async
    test('test createRefund', () async {
      // TODO
    });

    // État d'une intention
    //
    //Future<PaymentIntent> getPaymentIntent(String intentId) async
    test('test getPaymentIntent', () async {
      // TODO
    });

    // Webhook entrant des prestataires de paiement
    //
    // Validation HMAC du payload selon `provider` (en-tête `X-GPS-Signature`, préfixe `sha256=`).
    //
    //Future paymentWebhook(String provider, BuiltMap<String, JsonObject> requestBody) async
    test('test paymentWebhook', () async {
      // TODO
    });

  });
}
