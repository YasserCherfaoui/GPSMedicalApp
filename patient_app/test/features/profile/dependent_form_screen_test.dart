import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/profile/screens/dependent_form_screen.dart';
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
      return server.reply(200, <Map<String, dynamic>>[]);
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
        home: const DependentFormScreen(),
      ),
    );
  }

  testWidgets('create dependent happy path submits POST and pops', (
    tester,
  ) async {
    var postCalled = false;

    adapter.onPost('/patients/me/dependents', (server) {
      postCalled = true;
      return server.reply(201, {
        'id': 'dep-new',
        'full_name': 'Yacine Benali',
        'relation': 'child',
        'birth_date': '2015-03-10',
        'gender': 'male',
      });
    });

    adapter.onGet(
      '/patients/me/dependents',
      (server) => server.reply(200, [
        {
          'id': 'dep-new',
          'full_name': 'Yacine Benali',
          'relation': 'child',
          'birth_date': '2015-03-10',
          'gender': 'male',
        },
      ]),
    );

    await tester.pumpWidget(wrap());
    await tester.pumpAndSettle();

    expect(find.text('Ajouter un ayant droit'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Yacine Benali');

    await tester.tap(
      find.byType(DropdownButtonFormField<DependentCreateRelationEnum>),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Enfant').last);
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.calendar_today_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    await tester.tap(
      find.byType(DropdownButtonFormField<DependentCreateGenderEnum>),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Homme').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Enregistrer'));
    await tester.pumpAndSettle();

    expect(postCalled, isTrue);
  });
}
