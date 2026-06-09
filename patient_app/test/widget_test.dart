import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  testWidgets('splash screen shows brand title', (WidgetTester tester) async {
    const appInfo = GpsMedicalAppInfo(
      displayName: 'GPS Médical — Patient',
      clientKind: GpsMedicalClientKind.patient,
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: const SplashScreen(appInfo: appInfo),
      ),
    );
    await tester.pump();

    expect(find.text('GPS MÉDICAL'), findsOneWidget);
    expect(
      find.textContaining('orientation intelligente'),
      findsOneWidget,
    );
  });
}
