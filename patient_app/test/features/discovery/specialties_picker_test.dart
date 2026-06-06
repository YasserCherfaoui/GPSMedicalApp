import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/discovery/widgets/specialties_picker.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late GpsMedicalClient client;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.gpsmedical.dz/v1'));
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
        home: Scaffold(body: SingleChildScrollView(child: child)),
      ),
    );
  }

  testWidgets('shows shimmer while loading', (tester) async {
    final gate = Completer<void>();
    dioAdapter.onGet('/specialties', (server) async {
      await gate.future;
      return server.reply(200, []);
    });

    await tester.pumpWidget(
      wrap(SpecialtiesPicker(onSpecialtySelected: (_) {})),
    );
    await tester.pump();

    expect(find.byType(LoadingSkeleton), findsWidgets);

    gate.complete();
    await tester.pumpAndSettle();
  });

  testWidgets('renders hierarchy and reports selection', (tester) async {
    Specialty? selected;

    dioAdapter.onGet('/specialties', (server) {
      return server.reply(200, [
        {
          'id': 'root-1',
          'code': 'CHIR',
          'name_fr': 'Chirurgie',
          'name_ar': 'جراحة',
        },
        {
          'id': 'child-1',
          'code': 'ORTHO',
          'name_fr': 'Orthopédie',
          'name_ar': 'جراحة العظام',
          'parent_id': 'root-1',
        },
      ]);
    });

    await tester.pumpWidget(
      wrap(
        SpecialtiesPicker(
          selectedSpecialtyId: 'child-1',
          onSpecialtySelected: (s) => selected = s,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Chirurgie'), findsOneWidget);
    expect(find.text('Orthopédie'), findsOneWidget);

    await tester.tap(find.text('Orthopédie'));
    await tester.pumpAndSettle();

    expect(selected?.id, 'child-1');
  });

  testWidgets('shows localized empty state', (tester) async {
    dioAdapter.onGet('/specialties', (server) => server.reply(200, []));

    await tester.pumpWidget(
      wrap(SpecialtiesPicker(onSpecialtySelected: (_) {})),
    );
    await tester.pumpAndSettle();

    expect(find.text('Aucune spécialité trouvée.'), findsOneWidget);
  });

  testWidgets('shows localized error state with retry action', (tester) async {
    dioAdapter.onGet(
      '/specialties',
      (server) => server.reply(
        500,
        {
          'type': 'about:blank',
          'title': 'Erreur',
          'status': 500,
          'detail': 'fail',
        },
      ),
    );

    await tester.pumpWidget(
      wrap(SpecialtiesPicker(onSpecialtySelected: (_) {})),
    );
    await tester.pumpAndSettle();

    expect(find.text('Erreur'), findsOneWidget);
    expect(find.text('Impossible de charger les spécialités.'), findsOneWidget);
    expect(find.text('Réessayer'), findsOneWidget);
  });
}
