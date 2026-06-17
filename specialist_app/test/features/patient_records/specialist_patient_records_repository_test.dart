import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:specialist_app/features/patient_records/repositories/specialist_patient_records_repository.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late SpecialistPatientRecordsRepository repository;

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
    repository = SpecialistPatientRecordsRepository(client);
  });

  test('listForPatient returns documents for patient', () async {
    adapter.onGet('/medical-records', (server) {
      server.reply(200, {
        'data': [
          {
            'id': '00000000-0000-4000-8000-000000000010',
            'type': 'report',
            'title': 'Bilan',
          },
        ],
        'meta': {'page': 1, 'page_size': 20, 'total': 1, 'total_pages': 1},
      });
    }, queryParameters: {
      'patient_id': '00000000-0000-4000-8000-000000000099',
      'page': '1',
      'page_size': '20',
    });

    final result = await repository.listForPatient(
      patientId: '00000000-0000-4000-8000-000000000099',
      page: 1,
    );

    expect(result.documents.single.title, 'Bilan');
    expect(result.hasMore, isFalse);
  });

  test('listForPatient maps 403 to SpecialistPatientRecordsForbidden', () async {
    adapter.onGet('/medical-records', (server) {
      server.reply(403, {'title': 'Forbidden'});
    }, queryParameters: {
      'patient_id': '00000000-0000-4000-8000-000000000099',
      'page': '1',
      'page_size': '20',
    });

    expect(
      () => repository.listForPatient(
        patientId: '00000000-0000-4000-8000-000000000099',
        page: 1,
      ),
      throwsA(isA<SpecialistPatientRecordsForbidden>()),
    );
  });
}
