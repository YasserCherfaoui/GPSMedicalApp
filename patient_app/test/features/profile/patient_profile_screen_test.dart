import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/profile/screens/patient_profile_screen.dart';
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

    adapter.onGet('/patients/me', (server) {
      return server.reply(200, {
        'id': 'pat-1',
        'phone': '+21355001111',
        'email': 'amina@example.dz',
        'role': 'patient',
        'full_name': 'Amina Benali',
        'status': 'active',
        'created_at': '2026-01-01T00:00:00Z',
        'birth_date': '1990-05-12',
        'gender': 'female',
        'blood_type': 'O+',
        'allergies': ['Pollen'],
        'insurance': {'provider': 'cnas', 'number': 'CNAS-99'},
        'address': {
          'line1': '12 Rue Didouche',
          'wilaya_code': '16',
          'wilaya_name': 'Alger',
          'commune_name': 'Hydra',
        },
      });
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
        home: const PatientProfileScreen(),
      ),
    );
  }

  testWidgets('shows profile fields and account entry', (tester) async {
    await tester.pumpWidget(wrap());
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Mon profil'), findsOneWidget);
    expect(find.text('Amina Benali'), findsOneWidget);
    expect(find.text('+21355001111'), findsOneWidget);
    expect(find.byIcon(Icons.edit_outlined), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -800));
    await tester.pumpAndSettle();

    expect(find.text('Dossier médical'), findsOneWidget);
    expect(find.text('Compte'), findsOneWidget);
  });
}
