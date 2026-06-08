import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/profile/repositories/consent_repository.dart';
import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late ConsentRepository repo;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    final client = GpsMedicalClient(
      tokenStore: InMemoryTokenStore(),
      v1Dio: dio,
    );
    repo = ConsentRepository(client);
  });

  test('listConsents returns history newest-first', () async {
    adapter.onGet('/me/consents', (server) {
      return server.reply(200, [
        {
          'id': 'c-2',
          'user_id': 'u-1',
          'consent_type': 'marketing',
          'version': '2026-05-01',
          'granted_at': '2026-06-02T10:00:00Z',
        },
        {
          'id': 'c-1',
          'user_id': 'u-1',
          'consent_type': 'data_processing',
          'version': '2026-05-01',
          'granted_at': '2026-06-01T10:00:00Z',
          'revoked_at': '2026-06-03T10:00:00Z',
        },
      ]);
    });

    final list = await repo.listConsents();
    expect(list, hasLength(2));
    expect(list.first.consentType, ConsentGrantConsentTypeEnum.marketing);
    expect(list.last.revokedAt, isNotNull);
  });

  test('revokeConsent posts consent_type', () async {
    adapter.onPost('/me/consents/revoke', (server) {
      return server.reply(204, null);
    });

    await expectLater(
      repo.revokeConsent(RevokeConsentRequestConsentTypeEnum.marketing),
      completes,
    );
  });
}
