import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/pain_localization/models/pain3d_body.dart';
import 'package:patient_app/features/pain_localization/pain3d_constants.dart';
import 'package:patient_app/features/pain_localization/providers/pain_localization_flag.provider.dart';
import 'package:patient_app/features/pain_localization/screens/pain_body_chooser_screen.dart';
import 'package:patient_app/features/pain_localization/screens/pain_localization_gate.dart';
import 'package:patient_app/features/pain_localization/services/pain3d_analytics.dart';
import 'package:patient_app/features/pain_localization/services/pain3d_body_store.dart';
import 'package:patient_app/features/pain_localization/widgets/pain_localization_home_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('flag defaults off', () {
    expect(painLocalizationEnabledFromEnv(), isFalse);
  });

  test('Pain3dBodyStore remembers an explicit choice, not a profile', () async {
    final prefs = await SharedPreferences.getInstance();
    final store = Pain3dBodyStore(prefs: prefs);
    expect(await store.read(), isNull);
    await store.write(Pain3dBody.female);
    expect(await store.read(), Pain3dBody.female);
  });

  test('Pain3dAnalytics keeps events locally', () {
    final analytics = Pain3dAnalytics();
    analytics.log(Pain3dAnalytics.screenOpen);
    analytics.log(Pain3dAnalytics.bodyChosen, properties: {'model': 'male'});
    expect(analytics.events, hasLength(2));
    expect(analytics.events.first.name, Pain3dAnalytics.screenOpen);
    expect(analytics.events.last.properties['model'], 'male');
  });

  Widget wrap(
    Widget home, {
    List<Override> overrides = const [],
    Locale locale = const Locale('fr'),
  }) {
    return ProviderScope(
      overrides: overrides,
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: locale,
        home: home,
      ),
    );
  }

  testWidgets('chooser copy is exploratory and offers both bodies', (
    tester,
  ) async {
    await tester.pumpWidget(wrap(const PainBodyChooserScreen()));
    expect(
      find.textContaining('n\'est pas envoyée à un médecin'),
      findsOneWidget,
    );
    expect(find.text('Homme'), findsOneWidget);
    expect(find.text('Femme'), findsOneWidget);
  });

  testWidgets('home card uses exploratory subtitle', (tester) async {
    await tester.pumpWidget(
      wrap(const Scaffold(body: PainLocalizationHomeCard())),
    );
    expect(find.text('Où avez-vous mal ?'), findsOneWidget);
    expect(find.textContaining('Outil exploratoire'), findsOneWidget);
  });

  testWidgets('gate with no remembered body shows the chooser', (tester) async {
    final prefs = await SharedPreferences.getInstance();
    await tester.pumpWidget(
      wrap(
        const PainLocalizationGate(),
        overrides: [
          pain3dBodyStoreProvider.overrideWithValue(
            Pain3dBodyStore(prefs: prefs),
          ),
        ],
      ),
    );
    await tester.pump();
    await tester.pump();
    expect(find.text('Quel modèle afficher ?'), findsOneWidget);
  });

  testWidgets('Arabic chrome is RTL on chooser and home card', (tester) async {
    await tester.pumpWidget(
      wrap(const PainBodyChooserScreen(), locale: const Locale('ar')),
    );
    expect(
      Directionality.of(tester.element(find.byType(PainBodyChooserScreen))),
      TextDirection.rtl,
    );
    expect(find.text('رجل'), findsOneWidget);
    expect(find.text('امرأة'), findsOneWidget);

    await tester.pumpWidget(
      wrap(
        const Scaffold(body: PainLocalizationHomeCard()),
        locale: const Locale('ar'),
      ),
    );
    expect(find.text('أين تشعر بالألم؟'), findsOneWidget);
    expect(
      Directionality.of(tester.element(find.byType(PainLocalizationHomeCard))),
      TextDirection.rtl,
    );
  });
}
