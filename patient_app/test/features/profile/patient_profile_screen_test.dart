import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/profile/screens/patient_profile_screen.dart';
import 'package:patient_app/features/profile/screens/profile_account_screen.dart';
import '../../test_api_constants.dart';

Map<String, dynamic> _patientJson({
  String? residency,
  bool includeRestricted = true,
}) {
  return {
    'id': 'pat-1',
    'phone': '+21355001111',
    'email': 'amina@example.dz',
    'role': 'patient',
    'full_name': 'Amina Benali',
    'status': 'active',
    'created_at': '2026-01-01T00:00:00Z',
    if (residency != null) 'data_residency_mode': residency,
    if (residency != null) 'country': residency == 'device_only' ? 'DZ' : 'TN',
    if (includeRestricted) ...{
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
    },
  };
}

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);
    adapter.onGet(
      '/patients/me',
      (server) => server.reply(200, _patientJson()),
    );
  });

  Widget wrap({DeviceVault? vault, Widget? home}) {
    return ProviderScope(
      overrides: [
        gpsMedicalClientProvider.overrideWithValue(client),
        if (vault != null) deviceVaultProvider.overrideWithValue(vault),
      ],
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: home ?? const PatientProfileScreen(),
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
    expect(find.byIcon(Icons.logout_outlined), findsOneWidget);
    expect(find.text('Données uniquement sur cet appareil'), findsNothing);

    await tester.drag(find.byType(ListView), const Offset(0, -800));
    await tester.pumpAndSettle();

    expect(find.text('Dossier médical'), findsOneWidget);
    expect(find.text('Compte'), findsOneWidget);
  });

  testWidgets('device_only shows data-loss banner; server does not', (
    tester,
  ) async {
    adapter.onGet(
      '/patients/me',
      (server) => server.reply(
        200,
        _patientJson(residency: 'device_only', includeRestricted: false),
      ),
    );

    await tester.pumpWidget(wrap());
    await tester.pumpAndSettle();

    expect(find.text('Données uniquement sur cet appareil'), findsOneWidget);
    expect(find.textContaining('Désinstaller'), findsOneWidget);

    await tester.tap(find.text('J\'ai compris'));
    await tester.pumpAndSettle();
    expect(find.text('Données uniquement sur cet appareil'), findsNothing);

    adapter.onGet(
      '/patients/me',
      (server) => server.reply(
        200,
        _patientJson(residency: 'server', includeRestricted: true),
      ),
    );
    await tester.pumpWidget(wrap());
    await tester.pumpAndSettle();
    expect(find.text('Données uniquement sur cet appareil'), findsNothing);
  });

  testWidgets('vault restricted fields survive widget tree restart', (
    tester,
  ) async {
    final vault = MemoryDeviceVault();
    await vault.saveRestrictedProfile(
      'pat-1',
      RestrictedProfileFields(
        birthDate: Date(1990, 5, 12),
        bloodType: PatientBloodTypeEnum.oPlus,
      ),
    );
    adapter.onGet(
      '/patients/me',
      (server) => server.reply(
        200,
        _patientJson(residency: 'device_only', includeRestricted: false),
      ),
    );

    await tester.pumpWidget(wrap(vault: vault));
    await tester.pumpAndSettle();
    expect(find.textContaining('1990'), findsOneWidget);
    expect(find.text('O+'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpWidget(wrap(vault: vault));
    await tester.pumpAndSettle();
    expect(find.textContaining('1990'), findsOneWidget);
    expect(find.text('O+'), findsOneWidget);
  });

  testWidgets('account screen shows persistent vault notice for device_only', (
    tester,
  ) async {
    adapter.onGet(
      '/patients/me',
      (server) => server.reply(
        200,
        _patientJson(residency: 'device_only', includeRestricted: false),
      ),
    );

    await tester.pumpWidget(wrap(home: const ProfileAccountScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Coffre sur l\'appareil'), findsOneWidget);
    expect(find.textContaining('Aucune sauvegarde'), findsOneWidget);
    expect(find.text('J\'ai compris'), findsNothing);
  });
}
