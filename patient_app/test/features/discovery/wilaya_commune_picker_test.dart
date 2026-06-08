import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/discovery/widgets/wilaya_commune_picker.dart';

import 'geo_test_fixtures.dart';
import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late GpsMedicalClient client;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;

    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);
  });

  Widget wrap(Widget child) {
    return ProviderScope(
      overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: Scaffold(
          body: SizedBox(
            height: 500,
            child: child,
          ),
        ),
      ),
    );
  }

  testWidgets('shows shimmer while wilayas load', (tester) async {
    final gate = Completer<void>();
    dioAdapter.onGet('/geo/wilayas', (server) async {
      await gate.future;
      return server.reply(200, []);
    });

    await tester.pumpWidget(
      wrap(WilayaCommunePicker(onLocationChanged: (_, __) {})),
    );
    await tester.pump();

    expect(find.byType(LoadingSkeleton), findsWidgets);

    gate.complete();
    await tester.pumpAndSettle();
  });

  testWidgets('filters wilayas by search prefix', (tester) async {
    dioAdapter.onGet('/geo/wilayas', (server) {
      return server.reply(200, [
        wilayaJson(),
        wilayaJson(code: '31', nameFr: 'Oran', nameAr: 'وهران'),
      ]);
    });

    await tester.pumpWidget(
      wrap(WilayaCommunePicker(onLocationChanged: (_, __) {})),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Al');
    await tester.pump();

    expect(find.textContaining('16 - Alger'), findsOneWidget);
    expect(find.textContaining('Oran'), findsNothing);
  });

  testWidgets('selecting wilaya opens commune list', (tester) async {
    dioAdapter.onGet('/geo/wilayas', (server) {
      return server.reply(200, [wilayaJson()]);
    });
    dioAdapter.onGet('/geo/wilayas/16/communes', (server) {
      return server.reply(200, [communeJson()]);
    });

    await tester.pumpWidget(
      wrap(WilayaCommunePicker(onLocationChanged: (_, __) {})),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.textContaining('16 - Alger'));
    await tester.pumpAndSettle();

    expect(find.text('Sélectionner la commune'), findsOneWidget);
    expect(find.text('Hydra'), findsOneWidget);
  });
}
