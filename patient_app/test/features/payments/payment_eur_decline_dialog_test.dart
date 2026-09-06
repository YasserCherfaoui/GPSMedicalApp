import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/payments/widgets/payment_eur_decline_dialog.dart';

void main() {
  testWidgets('decline dialog shows localized international card copy', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: TextButton(
                onPressed: () => showPaymentEurDeclineDialog(context),
                child: const Text('open'),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(find.text('Carte non acceptée'), findsOneWidget);
    expect(find.textContaining('cartes internationales'), findsOneWidget);
    expect(find.text('Compris'), findsOneWidget);
  });
}
