import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

/// A-A2.1: no NIN field for DZ / TN / FR × patient / specialist.
void main() {
  for (final kind in GpsMedicalClientKind.values) {
    for (final country in [
      RegistrationCountry.dz,
      RegistrationCountry.tn,
      RegistrationCountry.fr,
    ]) {
      testWidgets(
        'no NIN UI for ${kind.name} / ${country.iso}',
        (tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          final container = ProviderContainer(
            overrides: [
              appInfoProvider.overrideWithValue(
                GpsMedicalAppInfo(displayName: 'Test', clientKind: kind),
              ),
            ],
          );
          addTearDown(container.dispose);
          container
              .read(registrationDraftProvider.notifier)
              .updateCountry(country);

          await tester.pumpWidget(
            UncontrolledProviderScope(
              container: container,
              child: const MaterialApp(
                localizationsDelegates: [
                  AuthStrings.delegate,
                  ...AppLocalizations.localizationsDelegates,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                locale: Locale('fr'),
                home: RegisterFullNameScreen(),
              ),
            ),
          );
          await tester.pumpAndSettle();

          expect(find.textContaining('NIN'), findsNothing);
          expect(find.textContaining('nin'), findsNothing);
          expect(find.byType(RegisterFullNameScreen), findsOneWidget);
        },
      );
    }
  }

  testWidgets('FR consent shows GDPR copy', (tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final container = ProviderContainer(
      overrides: [
        appInfoProvider.overrideWithValue(
          const GpsMedicalAppInfo(
            displayName: 'Test',
            clientKind: GpsMedicalClientKind.patient,
          ),
        ),
      ],
    );
    addTearDown(container.dispose);
    container.read(registrationDraftProvider.notifier)
      ..updateCountry(RegistrationCountry.fr)
      ..updateFullName('Jean')
      ..updatePhone('+33612345678')
      ..updatePassword('SecurePass123!');

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          localizationsDelegates: [
            AuthStrings.delegate,
            ...AppLocalizations.localizationsDelegates,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale('fr'),
          home: RegisterConsentScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('RGPD'), findsWidgets);
    expect(find.textContaining('NIN'), findsNothing);
  });
}
