import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/discovery/repositories/geo_repository.dart';

import 'geo_test_fixtures.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late GeoRepository repository;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.gpsmedical.dz/v1'));
    dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;

    repository = GeoRepository(
      GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio),
    );
  });

  test('fetchWilayas caches for the session', () async {
    var networkCalls = 0;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.path == '/geo/wilayas') {
            networkCalls++;
          }
          handler.next(options);
        },
      ),
    );
    dioAdapter.onGet('/geo/wilayas', (server) {
      return server.reply(200, [wilayaJson()]);
    });

    await repository.fetchWilayas();
    await repository.fetchWilayas();

    expect(networkCalls, 1);
  });

  test('fetchCommunes caches per wilaya code', () async {
    var networkCalls = 0;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.path.startsWith('/geo/wilayas/')) {
            networkCalls++;
          }
          handler.next(options);
        },
      ),
    );
    dioAdapter.onGet('/geo/wilayas/16/communes', (server) {
      return server.reply(200, [
        communeJson(nameFr: 'Alger Centre', nameAr: 'الجزائر الوسطى'),
      ]);
    });

    await repository.fetchCommunes('16');
    await repository.fetchCommunes('16');

    expect(networkCalls, 1);
  });

  test('clearCommunesCache refetches that wilaya', () async {
    var networkCalls = 0;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.path.startsWith('/geo/wilayas/')) {
            networkCalls++;
          }
          handler.next(options);
        },
      ),
    );
    dioAdapter.onGet('/geo/wilayas/16/communes', (server) {
      return server.reply(200, []);
    });

    await repository.fetchCommunes('16');
    repository.clearCommunesCache('16');
    await repository.fetchCommunes('16');

    expect(networkCalls, 2);
  });

  test('findCommuneById resolves commune using wilaya hint from suggest label', () async {
    const communeId = '5fcffb1c-ad63-4de0-b594-9f3a8c8f1a2b';

    dioAdapter.onGet('/geo/wilayas', (server) {
      return server.reply(200, [wilayaJson()]);
    });
    dioAdapter.onGet('/geo/wilayas/16/communes', (server) {
      return server.reply(200, [
        communeJson(
          id: communeId,
          nameFr: 'Hydra',
          nameAr: 'حيدرة',
        ),
      ]);
    });

    final found = await repository.findCommuneById(
      communeId,
      wilayaNameHint: 'Alger',
    );

    expect(found?.id, communeId);
    expect(found?.wilayaCode, '16');
    expect(found?.nameFr, 'Hydra');
  });
}
