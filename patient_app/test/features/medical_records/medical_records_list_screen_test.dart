import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/medical_records/screens/medical_records_list_screen.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.gpsmedical.dz/v1'));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);

    adapter.onGet('/medical-records', (server) {
      return server.reply(200, {
        'data': [
          {
            'id': 'doc-1',
            'type': 'report',
            'title': 'Compte-rendu consultation',
            'patient_id': 'pat-1',
            'author_id': 'spec-1',
            'author_role': 'specialist',
            'file_size': 1536000,
            'mime_type': 'application/pdf',
            'created_at': '2026-05-15T14:30:00Z',
          },
        ],
        'meta': {'page': 1, 'page_size': 20, 'total': 1, 'total_pages': 1},
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
        home: const MedicalRecordsListScreen(),
      ),
    );
  }

  testWidgets('shows document title type filter chips and metadata', (
    tester,
  ) async {
    await tester.pumpWidget(wrap());
    await tester.pumpAndSettle();

    expect(find.text('Dossier médical'), findsOneWidget);
    expect(find.text('Tous'), findsOneWidget);
    expect(find.text('Ordonnance'), findsOneWidget);
    expect(find.text('Compte-rendu'), findsOneWidget);
    expect(find.text('Compte-rendu consultation'), findsOneWidget);
    expect(find.textContaining('Médecin'), findsOneWidget);
    expect(find.textContaining('1.5 Mo'), findsOneWidget);
    expect(find.byIcon(Icons.article_outlined), findsOneWidget);
  });
}
