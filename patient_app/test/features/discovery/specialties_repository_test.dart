import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/discovery/repositories/specialties_repository.dart';
import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late SpecialtiesRepository repository;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;

    final client = GpsMedicalClient(
      tokenStore: InMemoryTokenStore(),
      v1Dio: dio,
    );
    repository = SpecialtiesRepository(client);
  });

  test('fetchAll caches in memory for the session', () async {
    var callCount = 0;
    dioAdapter.onGet('/specialties', (server) {
      callCount++;
      return server.reply(200, [
        {
          'id': 'spec-1',
          'code': 'CAR',
          'name_fr': 'Cardiologie',
          'name_ar': 'طب القلب',
        },
      ]);
    });

    final first = await repository.fetchAll();
    final second = await repository.fetchAll();

    expect(first, hasLength(1));
    expect(second, hasLength(1));
    expect(callCount, 1);
  });

  test('fetchAll forceRefresh bypasses cache', () async {
    var networkCalls = 0;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.path == '/specialties') {
            networkCalls++;
          }
          handler.next(options);
        },
      ),
    );
    dioAdapter.onGet('/specialties', (server) {
      return server.reply(200, [
        {
          'id': 'spec-1',
          'code': 'CAR',
          'name_fr': 'Cardiologie',
        },
      ]);
    });

    await repository.fetchAll();
    await repository.fetchAll(forceRefresh: true);

    expect(networkCalls, 2);
  });

  test('clearCache forces next fetch to hit the network', () async {
    var networkCalls = 0;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.path == '/specialties') {
            networkCalls++;
          }
          handler.next(options);
        },
      ),
    );
    dioAdapter.onGet('/specialties', (server) {
      return server.reply(200, []);
    });

    await repository.fetchAll();
    repository.clearCache();
    await repository.fetchAll();

    expect(networkCalls, 2);
  });
}
