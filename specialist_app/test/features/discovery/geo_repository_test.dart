import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:specialist_app/features/discovery/repositories/geo_repository.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GeoRepository repository;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080/v1'));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    final client = GpsMedicalClient(
      tokenStore: InMemoryTokenStore(),
      v1Dio: dio,
      apiRootUrl: 'http://localhost:8080',
    );
    repository = GeoRepository(client);
  });

  test('fetchWilayas caches results', () async {
    adapter.onGet('/geo/wilayas', (server) {
      return server.reply(200, [
        {
          'code': '16',
          'name_fr': 'Alger',
          'name_ar': 'الجزائر',
          'latitude': 36.75,
          'longitude': 3.05,
        },
      ]);
    });

    final first = await repository.fetchWilayas();
    final second = await repository.fetchWilayas();
    expect(first, same(second));
    expect(first.single.code, '16');

    repository.clearWilayasCache();
    adapter.onGet('/geo/wilayas', (server) {
      return server.reply(200, [
        {
          'code': '31',
          'name_fr': 'Oran',
          'name_ar': 'وهران',
          'latitude': 35.7,
          'longitude': -0.6,
        },
      ]);
    });
    final third = await repository.fetchWilayas(forceRefresh: true);
    expect(third.single.code, '31');
  });

  test('fetchCommunes caches by wilaya', () async {
    adapter.onGet('/geo/wilayas/16/communes', (server) {
      return server.reply(200, [
        {
          'id': '00000000-0000-4000-8000-000000000016',
          'wilaya_code': '16',
          'name_fr': 'Hydra',
          'name_ar': 'حيدرة',
          'latitude': 36.74,
          'longitude': 3.02,
        },
      ]);
    });

    final first = await repository.fetchCommunes('16');
    final second = await repository.fetchCommunes('16');
    expect(first, same(second));
    expect(first.single.nameFr, 'Hydra');

    expect(
      repository.findCommuneInCache('00000000-0000-4000-8000-000000000016')?.nameFr,
      'Hydra',
    );
    repository.clearCommunesCache('16');
    expect(
      repository.findCommuneInCache('00000000-0000-4000-8000-000000000016'),
      isNull,
    );
  });

  test('findCommuneById uses wilaya hint', () async {
    adapter.onGet('/geo/wilayas', (server) {
      return server.reply(200, [
        {
          'code': '16',
          'name_fr': 'Alger',
          'name_ar': 'الجزائر',
          'latitude': 36.75,
          'longitude': 3.05,
        },
      ]);
    });
    adapter.onGet('/geo/wilayas/16/communes', (server) {
      return server.reply(200, [
        {
          'id': '00000000-0000-4000-8000-000000000016',
          'wilaya_code': '16',
          'name_fr': 'Hydra',
          'name_ar': 'حيدرة',
          'latitude': 36.74,
          'longitude': 3.02,
        },
      ]);
    });

    final found = await repository.findCommuneById(
      '00000000-0000-4000-8000-000000000016',
      wilayaNameHint: 'Alger',
    );
    expect(found?.nameFr, 'Hydra');
  });

  test('fetchNearby returns doctors', () async {
    adapter.onGet('/geo/doctors/nearby', (server) {
      return server.reply(200, {
        'data': [
          {
            'id': '00000000-0000-4000-8000-000000000010',
            'full_name': 'Dr Nearby',
            'distance_km': 1.2,
            'verified': true,
            'offers_telehealth': true,
            'consultation_fee_dzd': 2500,
            'specialties': <Map<String, dynamic>>[],
          },
        ],
      });
    });

    final nearby = await repository.fetchNearby(
      lat: 36.75,
      lng: 3.05,
      radiusKm: 5,
    );
    expect(nearby, isNotEmpty);
  });
}
