import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/medical_records/repositories/medical_records_repository.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late MedicalRecordsRepository repository;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.gpsmedical.dz/v1'));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    final client = GpsMedicalClient(
      tokenStore: InMemoryTokenStore(),
      v1Dio: dio,
    );
    repository = MedicalRecordsRepository(client);
  });

  test('list returns documents and hasMore from pagination meta', () async {
    adapter.onGet('/medical-records', (server) {
      return server.reply(200, {
        'data': [
          {
            'id': 'doc-1',
            'type': 'prescription',
            'title': 'Ordonnance mai 2026',
            'patient_id': 'pat-1',
            'author_id': 'spec-1',
            'author_role': 'specialist',
            'file_size': 2048,
            'mime_type': 'application/pdf',
            'created_at': '2026-05-01T10:00:00Z',
          },
        ],
        'meta': {'page': 1, 'page_size': 20, 'total': 25, 'total_pages': 2},
      });
    });

    final result = await repository.list(page: 1);

    expect(result.documents, hasLength(1));
    expect(result.documents.first.title, 'Ordonnance mai 2026');
    expect(result.hasMore, isTrue);
  });

  test('list passes type filter to API', () async {
    adapter.onGet(
      '/medical-records',
      (server) => server.reply(200, (RequestOptions options) {
        expect(options.queryParameters['type'], 'lab_result');
        return {
          'data': [],
          'meta': {'page': 1, 'page_size': 20, 'total': 0, 'total_pages': 0},
        };
      }),
    );

    await repository.list(
      type: MedicalDocumentTypeEnum.labResult,
      page: 1,
    );
  });
}
