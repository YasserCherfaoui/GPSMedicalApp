import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/medical_records/screens/medical_record_viewer_screen.dart';
import '../../test_api_constants.dart';

final _pngBytes = base64Decode(
  'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==',
);

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
        'id': 'user-1',
        'phone': '+21355001111',
        'role': 'patient',
        'full_name': 'Amina Benali',
        'status': 'active',
        'created_at': '2026-01-01T00:00:00Z',
      });
    });

    adapter.onGet('/medical-records/doc-1', (server) {
      return server.reply(200, {
        'id': 'doc-1',
        'type': 'imaging',
        'title': 'Radio thorax',
        'patient_id': 'pat-1',
        'author_id': 'user-2',
        'author_role': 'specialist',
        'file_size': _pngBytes.length,
        'mime_type': 'image/png',
        'created_at': '2026-06-01T10:00:00Z',
      });
    });

    adapter.onGet('/medical-records/doc-1/download', (server) {
      return server.reply(200, {
        'url': '/v1/medical-records/doc-1/file?exp=1710000000&token=abc',
        'expires_at': '2026-06-01T10:05:00Z',
      });
    });

    adapter.onGet(
      '/medical-records/doc-1/file',
      (server) => server.reply(200, _pngBytes, headers: {
        Headers.contentTypeHeader: ['image/png'],
      }),
    );
  });

  Widget wrap() {
    return ProviderScope(
      overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: const MedicalRecordViewerScreen(documentId: 'doc-1'),
      ),
    );
  }

  testWidgets('renders image viewer with download and share actions', (
    tester,
  ) async {
    await tester.pumpWidget(wrap());
    await tester.pumpAndSettle();

    expect(find.text('Radio thorax'), findsOneWidget);
    expect(find.byType(InteractiveViewer), findsOneWidget);
    expect(find.byIcon(Icons.download_outlined), findsOneWidget);
    expect(find.byIcon(Icons.share_outlined), findsOneWidget);
    expect(find.byIcon(Icons.delete_outline), findsNothing);
  });
}
