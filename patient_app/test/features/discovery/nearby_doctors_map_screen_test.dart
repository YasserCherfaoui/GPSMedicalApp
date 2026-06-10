import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/discovery/providers/nearby_doctors.provider.dart';
import 'package:patient_app/features/discovery/screens/nearby_doctors_map_screen.dart';
import 'package:patient_app/features/notifications/providers/notifications_unread_count.provider.dart';

import '../../support/fake_google_maps_flutter_platform.dart';
import '../../test_api_constants.dart';
import 'geo_test_fixtures.dart';

void _installFakeGoogleMaps() {
  GoogleMapsFlutterPlatform.instance = FakeGoogleMapsFlutterPlatform();
}

class StubNearbyDoctors extends NearbyDoctors {
  StubNearbyDoctors(this.initial);

  final NearbyDoctorsState initial;

  @override
  Future<NearbyDoctorsState> build() async => initial;
}

class _StubUnreadCount extends NotificationsUnreadCount {
  @override
  Future<int> build() async => 0;
}

void main() {
  setUpAll(_installFakeGoogleMaps);

  Widget wrap({
    required NearbyDoctorsState state,
    required Widget child,
    Locale locale = const Locale('fr'),
  }) {
    final dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    final adapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = adapter;
    adapter.onGet('/notifications', (server) {
      return server.reply(200, {
        'data': <Map<String, dynamic>>[],
        'meta': {'page': 1, 'page_size': 1, 'total': 0, 'total_pages': 0},
      });
    });
    final client = GpsMedicalClient(
      tokenStore: InMemoryTokenStore(),
      v1Dio: dio,
    );

    return ProviderScope(
      overrides: [
        nearbyDoctorsProvider.overrideWith(() => StubNearbyDoctors(state)),
        gpsMedicalClientProvider.overrideWithValue(client),
        notificationsUnreadCountProvider.overrideWith(_StubUnreadCount.new),
      ],
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: locale,
        home: child,
      ),
    );
  }

  testWidgets('shows permission banner and localized title when GPS denied', (
    tester,
  ) async {
    const state = NearbyDoctorsState(
      doctors: <DoctorWithDistance>[],
      lat: 36.7538,
      lng: 3.0588,
      radiusKm: 5,
      permissionGranted: false,
    );

    await tester.pumpWidget(
      wrap(state: state, child: const NearbyDoctorsMapScreen()),
    );
    await tester.pump();

    expect(find.text('Médecins à proximité'), findsOneWidget);
    expect(
      find.text(
        'Autoriser la localisation pour voir les médecins autour de vous.',
      ),
      findsOneWidget,
    );
    expect(find.text('Rayon :'), findsOneWidget);
    expect(find.text('5 km'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpAndSettle();
  });

  testWidgets('shows manual wilaya banner with localized commune label', (
    tester,
  ) async {
    final state = NearbyDoctorsState(
      doctors: <DoctorWithDistance>[],
      lat: 36.7449,
      lng: 3.0238,
      radiusKm: 5,
      permissionGranted: true,
      manualWilaya: sampleWilaya(),
      manualCommune: sampleCommune(),
    );

    await tester.pumpWidget(
      wrap(state: state, child: const NearbyDoctorsMapScreen()),
    );
    await tester.pump();

    expect(find.text('Hydra, Alger'), findsOneWidget);
    expect(find.text('Ma position'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpAndSettle();
  });

  testWidgets('permission rationale dialog appears before requesting access', (
    tester,
  ) async {
    const state = NearbyDoctorsState(
      doctors: <DoctorWithDistance>[],
      lat: 36.7538,
      lng: 3.0588,
      radiusKm: 5,
      permissionGranted: false,
    );

    await tester.pumpWidget(
      wrap(state: state, child: const NearbyDoctorsMapScreen()),
    );
    await tester.pump();

    await tester.tap(find.text('Autoriser'));
    await tester.pumpAndSettle();

    expect(find.text('Accès à la localisation'), findsOneWidget);
    expect(
      find.textContaining('MedNavigator utilise votre position'),
      findsOneWidget,
    );

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpAndSettle();
  });
}
