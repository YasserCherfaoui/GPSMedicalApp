import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/discovery/providers/nearby_doctors.provider.dart';
import 'package:patient_app/features/discovery/screens/nearby_doctors_map_screen.dart';

import 'geo_test_fixtures.dart';

class StubNearbyDoctors extends NearbyDoctors {
  StubNearbyDoctors(this.initial);

  final NearbyDoctorsState initial;

  @override
  Future<NearbyDoctorsState> build() async => initial;
}

void main() {
  Widget wrap({
    required NearbyDoctorsState state,
    required Widget child,
    Locale locale = const Locale('fr'),
  }) {
    return ProviderScope(
      overrides: [
        nearbyDoctorsProvider.overrideWith(() => StubNearbyDoctors(state)),
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
      doctors: [],
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
  });

  testWidgets('shows manual wilaya banner with localized commune label', (
    tester,
  ) async {
    final state = NearbyDoctorsState(
      doctors: [],
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
  });

  testWidgets('permission rationale dialog appears before requesting access', (
    tester,
  ) async {
    const state = NearbyDoctorsState(
      doctors: [],
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
  });
}
