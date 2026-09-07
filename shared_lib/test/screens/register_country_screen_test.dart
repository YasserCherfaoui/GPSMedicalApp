import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  Future<void> pumpCountry(
    WidgetTester tester, {
    GpsMedicalClientKind kind = GpsMedicalClientKind.patient,
  }) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appInfoProvider.overrideWithValue(
            GpsMedicalAppInfo(displayName: 'Test', clientKind: kind),
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
  }

  testWidgets('country step lists DZ, TN, FR and search', (tester) async {
    await pumpCountry(tester);

    expect(find.text('Algérie'), findsOneWidget);
    expect(find.text('Tunisie'), findsOneWidget);
    expect(find.text('France'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(
      find.text(
        'Le pays choisi est définitif. Il ne pourra pas être modifié après la création du compte.',
      ),
      findsOneWidget,
    );
  });

  testWidgets('search filters to France', (tester) async {
    await pumpCountry(tester);
    await tester.enterText(find.byType(TextField), 'fran');
    await tester.pumpAndSettle();

    expect(find.text('France'), findsOneWidget);
    expect(find.text('Algérie'), findsNothing);
  });

  testWidgets('specialist can select Tunisia (quarantine, not blocked)', (
    tester,
  ) async {
    await pumpCountry(tester, kind: GpsMedicalClientKind.specialist);

    await tester.tap(find.text('Tunisie'));
    await tester.pump();
    expect(find.text('Continuer'), findsOneWidget);
    expect(
      find.text(
        "L'inscription des spécialistes n'est pas encore disponible en Tunisie.",
      ),
      findsNothing,
    );
  });
}
