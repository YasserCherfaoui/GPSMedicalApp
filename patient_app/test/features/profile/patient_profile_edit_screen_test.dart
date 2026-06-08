import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/profile/screens/patient_profile_edit_screen.dart';
import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;

  void mockProfileGet() {
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
      });
    });
  }

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(
      dio: dio,
      matcher: const UrlRequestMatcher(matchMethod: true),
    );
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);
    mockProfileGet();
  });

  Widget wrap() {
    return ProviderScope(
      overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: const PatientProfileEditScreen(),
      ),
    );
  }

  testWidgets('shows client email validation error on save', (tester) async {
    await tester.pumpWidget(wrap());
    await tester.pumpAndSettle();

    final fields = find.byType(TextField);
    await tester.enterText(fields.at(1), 'not-an-email');
    await tester.tap(find.text('Enregistrer'));
    await tester.pumpAndSettle();

    expect(find.text('Adresse e-mail invalide'), findsOneWidget);
  });

  Future<void> tapSaveAndWait(WidgetTester tester) async {
    await tester.tap(find.text('Enregistrer'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pump();
  }

  testWidgets('shows server blood_type validation error on save', (tester) async {
    var patchCalled = false;
    adapter.onPatch('/patients/me', (server) {
      patchCalled = true;
      return server.reply(422, {
        'type': 'about:blank',
        'title': 'Champs invalides',
        'status': 422,
        'errors': [
          {
            'field': 'blood_type',
            'message': 'Groupe sanguin invalide.',
            'code': 'INVALID_BLOOD_TYPE',
          },
        ],
      });
    });

    await tester.pumpWidget(wrap());
    await tester.pumpAndSettle();

    await tapSaveAndWait(tester);

    expect(patchCalled, isTrue);
    expect(find.text('Enregistrement impossible'), findsNothing);
    expect(find.text('Groupe sanguin invalide.'), findsOneWidget);
  });

  testWidgets('shows server address.line1 validation error on save', (tester) async {
    var patchCalled = false;
    adapter.onPatch('/patients/me', (server) {
      patchCalled = true;
      return server.reply(422, {
        'type': 'about:blank',
        'title': 'Champs invalides',
        'status': 422,
        'errors': [
          {
            'field': 'address.line1',
            'message': 'La rue est obligatoire.',
            'code': 'REQUIRED',
          },
        ],
      });
    });

    await tester.pumpWidget(wrap());
    await tester.pumpAndSettle();

    await tapSaveAndWait(tester);

    expect(patchCalled, isTrue);
    await tester.scrollUntilVisible(
      find.text('La rue est obligatoire.'),
      120,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('La rue est obligatoire.'), findsOneWidget);
  });
}
