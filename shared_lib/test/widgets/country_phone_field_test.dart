import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

Widget _wrap(Widget child) {
  return MaterialApp(
    theme: GpsTheme.light(),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    locale: const Locale('fr'),
    home: Scaffold(body: child),
  );
}

void main() {
  testWidgets('locked prefix does not open a country sheet', (tester) async {
    await tester.pumpWidget(
      _wrap(
        CountryPhoneField(country: RegistrationCountry.dz, onChanged: (_) {}),
      ),
    );

    expect(find.text('+213'), findsOneWidget);
    expect(find.byKey(const Key('country-dial-code-picker')), findsNothing);

    await tester.tap(find.text('+213'));
    await tester.pumpAndSettle();

    expect(find.text('Votre pays'), findsNothing);
    expect(find.text('Tunisie'), findsNothing);
  });

  testWidgets('tapping prefix opens sheet and switching to TN shows +216', (
    tester,
  ) async {
    var country = RegistrationCountry.dz;
    String? e164 = 'stale';

    await tester.pumpWidget(
      _wrap(
        StatefulBuilder(
          builder: (context, setState) {
            return CountryPhoneField(
              country: country,
              onChanged: (value) => setState(() => e164 = value),
              onCountryChanged: (next) => setState(() {
                country = next;
                e164 = null;
              }),
            );
          },
        ),
      ),
    );

    expect(find.text('+213'), findsOneWidget);
    expect(find.text('5XX XX XX XX'), findsOneWidget);

    await tester.tap(find.byKey(const Key('country-dial-code-picker')));
    await tester.pumpAndSettle();

    expect(find.text('Votre pays'), findsOneWidget);
    expect(find.text('Algérie'), findsOneWidget);
    expect(find.text('Tunisie'), findsOneWidget);
    expect(find.text('+216'), findsOneWidget);

    await tester.tap(find.text('Tunisie'));
    await tester.pumpAndSettle();

    expect(find.text('Votre pays'), findsNothing);
    expect(find.text('+213'), findsNothing);
    expect(find.text('+216'), findsOneWidget);
    expect(find.text('2X XXX XXX'), findsOneWidget);
    expect(e164, isNull);
  });
}
