import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

Widget _wrap(Widget child) {
  return MaterialApp(
    theme: GpsTheme.light(),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    locale: const Locale('fr'),
    home: Scaffold(backgroundColor: Colors.black, body: child),
  );
}

void main() {
  testWidgets('mic and camera buttons swap icons when toggled', (tester) async {
    var micEnabled = true;
    var cameraEnabled = true;

    await tester.pumpWidget(
      _wrap(
        StatefulBuilder(
          builder: (context, setState) {
            return TeleconsultationCallBar(
              micEnabled: micEnabled,
              cameraEnabled: cameraEnabled,
              onMicPressed: () => setState(() => micEnabled = !micEnabled),
              onCameraPressed: () =>
                  setState(() => cameraEnabled = !cameraEnabled),
              onHangupPressed: () {},
            );
          },
        ),
      ),
    );

    expect(find.byIcon(Icons.mic), findsOneWidget);
    expect(find.byIcon(Icons.videocam), findsOneWidget);
    expect(find.text('Micro allumé'), findsOneWidget);
    expect(find.text('Caméra allumée'), findsOneWidget);

    await tester.tap(find.byKey(TeleconsultationCallBar.micKey));
    await tester.pump();
    expect(find.byIcon(Icons.mic_off), findsOneWidget);
    expect(find.text('Micro coupé'), findsOneWidget);

    await tester.tap(find.byKey(TeleconsultationCallBar.cameraKey));
    await tester.pump();
    expect(find.byIcon(Icons.videocam_off), findsOneWidget);
    expect(find.text('Caméra coupée'), findsOneWidget);
  });

  testWidgets('hangup asks for confirmation before calling back', (
    tester,
  ) async {
    var hangupConfirmed = false;

    await tester.pumpWidget(
      _wrap(
        Builder(
          builder: (context) {
            return TeleconsultationCallBar(
              micEnabled: true,
              cameraEnabled: true,
              onMicPressed: () {},
              onCameraPressed: () {},
              onHangupPressed: () async {
                final confirmed = await TeleconsultationCallBar.confirmHangup(
                  context,
                );
                hangupConfirmed = confirmed;
              },
            );
          },
        ),
      ),
    );

    await tester.tap(find.byKey(TeleconsultationCallBar.hangupKey));
    await tester.pumpAndSettle();

    expect(find.text("Terminer l'appel ?"), findsOneWidget);
    expect(find.text("L'autre participant sera déconnecté."), findsOneWidget);

    await tester.tap(
      find.widgetWithText(OutlinedButton, 'Rester dans l\'appel'),
    );
    await tester.pumpAndSettle();
    expect(hangupConfirmed, isFalse);
    expect(find.text("Terminer l'appel ?"), findsNothing);

    await tester.tap(find.byKey(TeleconsultationCallBar.hangupKey));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Raccrocher'));
    await tester.pumpAndSettle();
    expect(hangupConfirmed, isTrue);
  });
}
