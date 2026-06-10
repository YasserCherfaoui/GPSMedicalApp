import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/payments/repositories/payments_repository.dart';
import 'package:patient_app/features/payments/utils/payments_api_error.dart';

import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late PaymentsRepository repo;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(
      dio: dio,
      matcher: const UrlRequestMatcher(matchMethod: true),
    );
    dio.httpClientAdapter = adapter;
    final client = GpsMedicalClient(
      tokenStore: InMemoryTokenStore(),
      v1Dio: dio,
    );
    repo = PaymentsRepository(client);
  });

  test('createDepositIntent posts stripe_test intent', () async {
    adapter.onPost('/payments/intents', (server) {
      return server.reply(201, {
        'id': 'pi-1',
        'purpose': 'appointment_deposit',
        'appointment_id': 'appt-1',
        'amount_dzd': 1500,
        'provider': 'stripe_test',
        'status': 'requires_action',
        'created_at': '2026-06-01T10:00:00Z',
      });
    });

    final intent = await repo.createDepositIntent(
      appointmentId: 'appt-1',
      amountDzd: 1500,
    );
    expect(intent.id, 'pi-1');
    expect(intent.status, PaymentIntentStatusEnum.requiresAction);
  });

  test('confirm maps 402 to PaymentFailedException', () async {
    adapter.onPost('/payments/intents/pi-1/confirm', (server) {
      return server.reply(402, {
        'title': 'Paiement refusé',
        'detail': 'Le prestataire a refusé le paiement.',
        'code': 'PAYMENT_FAILED',
      });
    });

    expect(
      () => repo.confirm(intentId: 'pi-1', gatewayToken: 'ZmFpbA=='),
      throwsA(isA<PaymentFailedException>()),
    );
  });

  test('pollUntilTerminal returns on succeeded status', () async {
    adapter.onGet('/payments/intents/pi-1', (server) {
      return server.reply(200, {
        'id': 'pi-1',
        'status': 'succeeded',
        'amount_dzd': 1500,
        'created_at': '2026-06-01T10:00:00Z',
      });
    });

    final intent = await repo.pollUntilTerminal(
      'pi-1',
      interval: Duration.zero,
      timeout: const Duration(seconds: 1),
    );
    expect(intent.status, PaymentIntentStatusEnum.succeeded);
  });
}
