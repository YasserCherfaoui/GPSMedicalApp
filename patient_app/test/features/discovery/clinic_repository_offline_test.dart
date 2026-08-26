import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/discovery/repositories/clinic_repository.dart';
import 'package:patient_app/features/discovery/services/clinic_offline_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;
  late ClinicOfflineCache offlineCache;
  late ClinicRepository repository;

  const clinicId = 'c1000000-0000-4000-8000-000000000001';

  Map<String, dynamic> clinicJson() => {
        'id': clinicId,
        'name': 'Clinique El Shifa',
        'verified': true,
        'description': 'Hydra',
        'rating_average': 4.5,
        'rating_count': 12,
      };

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(
      dio: dio,
      matcher: const UrlRequestMatcher(matchMethod: true),
    );
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);
    offlineCache = ClinicOfflineCache(
      prefs: await SharedPreferences.getInstance(),
    );
    repository = ClinicRepository(client, offlineCache: offlineCache);
  });

  test('listVerified falls back to disk cache on network error', () async {
    adapter.onGet('/clinics', (server) {
      return server.reply(200, {
        'data': [clinicJson()],
        'meta': {'page': 1, 'page_size': 20, 'total': 1, 'total_pages': 1},
      });
    });

    final first = await repository.listVerified(page: 1, pageSize: 20);
    expect(first.clinics, hasLength(1));
    expect(first.clinics.first.name, 'Clinique El Shifa');

    adapter.onGet('/clinics', (server) {
      return server.throws(
        500,
        DioException(
          requestOptions: RequestOptions(path: '/clinics'),
          type: DioExceptionType.connectionError,
          error: 'offline',
        ),
      );
    });

    final cached = await repository.listVerified(page: 1, pageSize: 20);
    expect(cached.clinics, hasLength(1));
    expect(cached.clinics.first.id, clinicId);
  });

  test('fetchById falls back to memory then disk on network error', () async {
    adapter.onGet('/clinics/$clinicId', (server) {
      return server.reply(200, clinicJson());
    });
    adapter.onGet('/clinics/$clinicId/services', (server) {
      return server.reply(200, <Map<String, dynamic>>[]);
    });
    adapter.onGet('/clinics/$clinicId/specialists', (server) {
      return server.reply(200, <Map<String, dynamic>>[]);
    });

    final clinic = await repository.fetchById(clinicId);
    await repository.persistDetailSnapshot(
      clinic: clinic,
      services: const [],
      specialists: const [],
    );

    adapter.onGet('/clinics/$clinicId', (server) {
      return server.throws(
        500,
        DioException(
          requestOptions: RequestOptions(path: '/clinics/$clinicId'),
          type: DioExceptionType.connectionTimeout,
          error: 'timeout',
        ),
      );
    });

    final offline = await repository.fetchById(clinicId);
    expect(offline.name, 'Clinique El Shifa');
  });
}
