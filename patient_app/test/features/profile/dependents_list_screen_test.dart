import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/profile/screens/dependents_list_screen.dart';
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
          'full_name': 'Amina Benali',
          'relation': 'child',
          'birth_date': '2015-03-10',
          'gender': 'female',
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
        home: const DependentsListScreen(),
      ),
    );
  }

  testWidgets('shows dependent name relation age and gender icon', (tester) async {
    await tester.pumpWidget(wrap());
    await tester.pumpAndSettle();

    expect(find.text('Ayants droit'), findsOneWidget);
    expect(find.text('Amina Benali'), findsOneWidget);
    expect(find.textContaining('Enfant'), findsOneWidget);
    expect(find.textContaining('ans'), findsOneWidget);
    expect(find.byIcon(Icons.female), findsOneWidget);
  });
}
