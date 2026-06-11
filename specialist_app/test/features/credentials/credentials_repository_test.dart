import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:specialist_app/features/credentials/repositories/credentials_repository.dart';
import 'package:specialist_app/features/credentials/utils/credentials_api_error.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late CredentialsRepository repo;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080/v1'));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    final client = GpsMedicalClient(
      tokenStore: InMemoryTokenStore(),
      v1Dio: dio,
      apiRootUrl: 'http://localhost:8080',
    );
    client.applyBearerToken('test-token');
    repo = CredentialsRepository(client);
  });

  test('upload maps 503 to CredentialsStorageUnavailableException', () async {
    adapter.onPost('/doctors/me/credentials', (server) {
      return server.reply(503, {
        'title': 'Service indisponible',
        'status': 503,
      });
    });

    expect(
      () => repo.upload(
        bytes: Uint8List.fromList([0x25, 0x50, 0x44, 0x46]),
        fileName: 'doc.pdf',
        mimeType: 'application/pdf',
        type: CredentialTypeEnum.diploma,
      ),
      throwsA(isA<CredentialsStorageUnavailableException>()),
    );
  });

  test('fetchDoctorProfile returns credentials from GET /doctors/me', () async {
    adapter.onGet(
      '/doctors/me',
      (server) => server.reply(200, {
        'id': '00000000-0000-4000-8000-000000000010',
        'full_name': 'Dr. Test',
        'verification_status': 'pending',
        'credentials': [
          {
            'id': '00000000-0000-4000-8000-000000000099',
            'type': 'diploma',
            'status': 'pending',
            'file_url':
                '/v1/doctors/me/credentials/00000000-0000-4000-8000-000000000099/file?exp=1&token=t',
          },
        ],
      }),
    );

    final profile = await repo.fetchDoctorProfile();
    expect(profile.credentials?.length, 1);
    expect(profile.credentials?.first.type, CredentialTypeEnum.diploma);
  });
}
