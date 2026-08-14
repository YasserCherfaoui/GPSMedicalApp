import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/medical_records/repositories/device_only_medical_records_repository.dart';
import 'package:patient_app/features/medical_records/repositories/medical_records_repository.dart';
import 'package:patient_app/features/medical_records/repositories/residency_aware_medical_records_repository.dart';
import 'package:patient_app/features/profile/repositories/patient_repository.dart';
import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late MemoryDeviceVault vault;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(
      dio: dio,
      matcher: const UrlRequestMatcher(matchMethod: true),
    );
    dio.httpClientAdapter = adapter;
    vault = MemoryDeviceVault();
  });

  test('device-only store never calls /medical-records*', () async {
    var medicalRecordsHit = false;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.path.contains('medical-records')) {
            medicalRecordsHit = true;
          }
          handler.next(options);
        },
      ),
    );

    final repo = DeviceOnlyMedicalRecordsRepository(
      vault: vault,
      userId: 'pat-1',
    );
    final uploaded = await repo.upload(
      bytes: Uint8List.fromList([1, 2, 3]),
      fileName: 'radio.jpg',
      mimeType: 'image/jpeg',
      type: MedicalDocumentTypeEnum.imaging,
      title: 'Radio thorax',
    );
    final listed = await repo.list(page: 1);
    final bytes = await repo.fetchDocumentBytes(uploaded.id!);

    expect(medicalRecordsHit, isFalse);
    expect(listed.documents, hasLength(1));
    expect(listed.documents.first.title, 'Radio thorax');
    expect(bytes, [1, 2, 3]);
    expect(listed.hasMore, isFalse);
  });

  test('residency-aware uses vault when profile is device_only', () async {
    adapter.onGet('/patients/me', (server) {
      return server.reply(200, {
        'id': 'pat-1',
        'phone': '+21355001111',
        'role': 'patient',
        'full_name': 'Amina Benali',
        'status': 'active',
        'created_at': '2026-01-01T00:00:00Z',
        'country': 'DZ',
        'data_residency_mode': 'device_only',
      });
    });
    var medicalRecordsHit = false;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.path.contains('medical-records')) {
            medicalRecordsHit = true;
          }
          handler.next(options);
        },
      ),
    );

    final client = GpsMedicalClient(
      tokenStore: InMemoryTokenStore(),
      v1Dio: dio,
    );
    final repo = ResidencyAwareMedicalRecordsRepository(
      server: MedicalRecordsRepository(client),
      vault: vault,
      profiles: PatientRepository(client),
    );

    await repo.upload(
      bytes: Uint8List.fromList([4, 5]),
      fileName: 'ordo.pdf',
      mimeType: 'application/pdf',
      type: MedicalDocumentTypeEnum.prescription,
      title: 'Ordonnance',
    );
    final listed = await repo.list(page: 1);

    expect(medicalRecordsHit, isFalse);
    expect(listed.documents.single.title, 'Ordonnance');
  });
}
