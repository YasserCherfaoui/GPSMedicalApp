import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/main.dart';
import 'package:specialist_app/routing/specialist_router.provider.dart';

void main() {
  testWidgets('SpecialistApp boots with overridden router', (tester) async {
    final launchPrefs = InMemoryAppLaunchPreferences();
    await launchPrefs.setOnboardingCompleted(true);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appInfoProvider.overrideWithValue(
            const GpsMedicalAppInfo(
              displayName: 'GPS Médical — Spécialiste',
              clientKind: GpsMedicalClientKind.specialist,
            ),
          ),
          tokenStoreProvider.overrideWithValue(InMemoryTokenStore()),
          appLaunchPreferencesProvider.overrideWithValue(launchPrefs),
          specialistRouterProvider.overrideWith((ref) {
            return GoRouter(
              routes: [
                GoRoute(
                  path: '/',
                  builder: (context, state) =>
                      const Scaffold(body: Text('boot-ok')),
                ),
              ],
            );
          }),
        ],
        child: const SpecialistApp(),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('boot-ok'), findsOneWidget);
  });
}
