import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  testWidgets('country step lists DZ and TN with immutable notice', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appInfoProvider.overrideWithValue(
            const GpsMedicalAppInfo(
              displayName: 'Test',
              clientKind: GpsMedicalClientKind.patient,
            ),
          ),
        ],
        child: const MaterialApp(
          localizationsDelegates: [
            AuthStrings.delegate,
            ...AppLocalizations.localizationsDelegates,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale('fr'),
          home: RegisterCountryScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Algérie'), findsOneWidget);
    expect(find.text('Tunisie'), findsOneWidget);
    expect(
      find.text(
        'Le pays choisi est définitif. Il ne pourra pas être modifié après la création du compte.',
      ),
      findsOneWidget,
    );
  });

  testWidgets('specialist cannot continue with Tunisia', (tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appInfoProvider.overrideWithValue(
            const GpsMedicalAppInfo(
              displayName: 'Test Specialist',
              clientKind: GpsMedicalClientKind.specialist,
            ),
          ),
        ],
        child: const MaterialApp(
          localizationsDelegates: [
            AuthStrings.delegate,
            ...AppLocalizations.localizationsDelegates,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale('fr'),
          home: RegisterCountryScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Tunisie'));
    await tester.pump();
    await tester.tap(find.text('Continuer'));
    await tester.pump();

    expect(
      find.text(
        "L'inscription des spécialistes n'est pas encore disponible en Tunisie.",
      ),
      findsOneWidget,
    );
    expect(find.byType(RegisterCountryScreen), findsOneWidget);
  });
}
