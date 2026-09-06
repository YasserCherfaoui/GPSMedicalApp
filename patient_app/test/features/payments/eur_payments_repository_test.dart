import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/payments/repositories/payments_repository.dart';

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

  test('createEurIntent posts stripe EUR intent', () async {
    adapter.onPost('/payments/intents', (server) {
      return server.reply(201, {
        'id': 'pi-eur-1',
        'purpose': 'full_consultation',
        'appointment_id': 'appt-1',
        'amount_minor': 8000,
        'currency': 'EUR',
        'provider': 'stripe',
        'status': 'requires_action',
        'client_secret': 'pi_secret_test',
        'created_at': '2026-06-01T10:00:00Z',
      });
    });

    final intent = await repo.createEurIntent(
      appointmentId: 'appt-1',
      amountMinor: 8000,
      purpose: 'full_consultation',
    );
    expect(intent.id, 'pi-eur-1');
    expect(intent.clientSecret, 'pi_secret_test');
    expect(intent.status, 'requires_action');
  });
}
