import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

const _testAppInfo = GpsMedicalAppInfo(
  displayName: 'GPS Médical — Test',
  clientKind: GpsMedicalClientKind.patient,
);

void main() {
  testWidgets('redirects to auth when session expires on profile', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final container = ProviderContainer(
      overrides: [appInfoProvider.overrideWithValue(_testAppInfo)],
    );
    addTearDown(container.dispose);

    final router = container.read(gpsRouterProvider);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(
          theme: GpsTheme.light(),
          routerConfig: router,
        ),
      ),
    );
    await tester.pumpAndSettle();

    await container
        .read(authSessionProvider)
        .signIn(
          TokenPair(
            (b) => b
              ..accessToken = 'access'
              ..refreshToken = 'refresh'
              ..expiresIn = 3600,
          ),
        );
    router.go(GpsRoutes.profile);
    await tester.pumpAndSettle();

    expect(find.text('Profil — placeholder'), findsOneWidget);

    await container.read(authSessionProvider).handleSessionExpired();
    await tester.pumpAndSettle();

    expect(find.text('Bienvenue'), findsOneWidget);
    expect(find.text('Profil — placeholder'), findsNothing);
  });

  testWidgets('redirects unauthenticated profile access to auth welcome', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final container = ProviderContainer(
      overrides: [appInfoProvider.overrideWithValue(_testAppInfo)],
    );
    addTearDown(container.dispose);

    final router = container.read(gpsRouterProvider);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(
          theme: GpsTheme.light(),
          routerConfig: router,
        ),
      ),
    );

    router.go(GpsRoutes.profile);
    await tester.pumpAndSettle();

    expect(find.text('Bienvenue'), findsOneWidget);
  });
}
