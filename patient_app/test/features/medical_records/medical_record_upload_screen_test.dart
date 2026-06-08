import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/medical_records/screens/medical_record_upload_screen.dart';
import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);

    adapter.onGet('/patients/me/dependents', (server) {
      return server.reply(200, [
        {
          'id': 'dep-1',
          'full_name': 'Yacine Benali',
          'relation': 'child',
          'birth_date': '2015-03-10',
          'gender': 'male',
        },
      ]);
    });
  });

  Widget wrap() {
    return ProviderScope(
      overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: const MedicalRecordUploadScreen(),
      ),
    );
  }

  testWidgets('shows upload form fields and patient selector', (tester) async {
    await tester.pumpWidget(wrap());
    await tester.pumpAndSettle();

    expect(find.text('Ajouter un document'), findsOneWidget);
    expect(find.text('Type de document'), findsOneWidget);
    expect(find.text('Patient concerné'), findsOneWidget);
    expect(find.text('Pour moi'), findsOneWidget);
    expect(find.text('Yacine Benali'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -400));
    await tester.pumpAndSettle();

    expect(find.text('Appareil photo'), findsOneWidget);
    expect(find.text('Galerie'), findsOneWidget);
    expect(find.text('Fichiers PDF'), findsOneWidget);
    expect(find.text('Téléverser'), findsOneWidget);
  });
}
