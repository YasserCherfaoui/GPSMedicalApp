import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/medical_records/repositories/medical_records_repository.dart';
import 'package:patient_app/features/medical_records/utils/medical_records_api_error.dart';
import '../../test_api_constants.dart';

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

  test('upload returns created document', () async {
    adapter.onPost('/medical-records', (server) {
      return server.reply(201, {
        'id': 'doc-new',
        'type': 'report',
        'title': 'Analyse sanguine',
        'patient_id': 'pat-1',
        'author_id': 'user-1',
        'author_role': 'patient',
        'file_size': 4,
        'mime_type': 'application/pdf',
        'created_at': '2026-06-01T10:00:00Z',
      });
    });

    final pdfHeader = Uint8List.fromList([0x25, 0x50, 0x44, 0x46]);
    final document = await repository.upload(
      bytes: pdfHeader,
      fileName: 'resultat.pdf',
      mimeType: 'application/pdf',
      type: MedicalDocumentTypeEnum.report,
      title: 'Analyse sanguine',
    );

    expect(document.id, 'doc-new');
    expect(document.title, 'Analyse sanguine');
  });

  test(
    'upload maps 503 to MedicalRecordsStorageUnavailableException',
    () async {
      adapter.onPost('/medical-records', (server) {
        return server.reply(503, {
          'type': 'about:blank',
          'title': 'Service indisponible',
          'status': 503,
        });
      });

      expect(
        () => repository.upload(
          bytes: Uint8List.fromList([0x25, 0x50, 0x44, 0x46]),
          fileName: 'doc.pdf',
          mimeType: 'application/pdf',
          type: MedicalDocumentTypeEnum.other,
        ),
        throwsA(isA<MedicalRecordsStorageUnavailableException>()),
      );
    },
  );

  test('upload maps 422 to MedicalRecordsValidationException', () async {
    adapter.onPost('/medical-records', (server) {
      return server.reply(422, {
        'type': 'about:blank',
        'title': 'Champs invalides',
        'status': 422,
        'errors': [
          {'field': 'file', 'message': 'Fichier trop volumineux.'},
        ],
      });
    });

    expect(
      () => repository.upload(
        bytes: Uint8List.fromList([0x25, 0x50, 0x44, 0x46]),
        fileName: 'doc.pdf',
        mimeType: 'application/pdf',
        type: MedicalDocumentTypeEnum.other,
      ),
      throwsA(isA<MedicalRecordsValidationException>()),
    );
  });
}
