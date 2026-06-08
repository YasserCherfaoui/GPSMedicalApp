import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/discovery/providers/location_filter.provider.dart';

import 'geo_test_fixtures.dart';
import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late ProviderContainer container;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;

    final client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);

    container = ProviderContainer(
      overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
    );
  });

  tearDown(() => container.dispose());

  test('selectWilaya lazy-loads communes once per wilaya', () async {
    var communeCalls = 0;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.path == '/geo/wilayas/16/communes') {
            communeCalls++;
          }
          handler.next(options);
        },
      ),
    );
    dioAdapter.onGet('/geo/wilayas/16/communes', (server) {
      return server.reply(200, [communeJson()]);
    });

    final communesNotifier = container.read(communesFetchProvider.notifier);
    await communesNotifier.fetchForWilaya('16');
    await communesNotifier.fetchForWilaya('16');

    expect(communeCalls, 1);

    container.read(locationFilterProvider.notifier).selectWilaya(sampleWilaya());
    expect(container.read(locationFilterProvider).selectedWilaya?.code, '16');
  });

  test('clear resets location filter state', () {
    final wilaya = sampleWilaya();
    final commune = sampleCommune();

    final notifier = container.read(locationFilterProvider.notifier);
    notifier.selectWilaya(wilaya);
    notifier.selectCommune(commune);
    notifier.clear();

    final filter = container.read(locationFilterProvider);
    expect(filter.selectedWilaya, isNull);
    expect(filter.selectedCommune, isNull);
  });
}
