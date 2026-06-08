import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/medical_records/repositories/medical_records_repository.dart';
import '../../test_api_constants.dart';

final _pngBytes = base64Decode(
  'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==',
);

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late MedicalRecordsRepository repository;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    final client = GpsMedicalClient(
      tokenStore: InMemoryTokenStore(),
      v1Dio: dio,
    );
    repository = MedicalRecordsRepository(client);
  });

  test('fetchDocumentBytes follows download link then fetches file bytes', () async {
    adapter.onGet('/medical-records/doc-1/download', (server) {
      return server.reply(200, {
        'url': '/v1/medical-records/doc-1/file?exp=1710000000&token=abc',
        'expires_at': '2026-06-01T10:05:00Z',
      });
    });

    adapter.onGet('/medical-records/doc-1/file', (server) {
      return server.reply(200, _pngBytes, headers: {
        Headers.contentTypeHeader: ['image/png'],
      });
    });

    final bytes = await repository.fetchDocumentBytes('doc-1');

    expect(bytes, _pngBytes);
  });

  test('delete calls DELETE endpoint', () async {
    adapter.onDelete('/medical-records/doc-1', (server) {
      return server.reply(204, null);
    });

    await repository.delete('doc-1');
  });
}
