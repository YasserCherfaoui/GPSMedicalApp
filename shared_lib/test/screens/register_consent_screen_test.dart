import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  testWidgets('consent screen requires CGU checkbox before submit', (
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
          useMockAuthProvider.overrideWith((ref) => true),
          appInfoProvider.overrideWithValue(
            const GpsMedicalAppInfo(
              displayName: 'Test',
              clientKind: GpsMedicalClientKind.patient,
            ),
          ),
        ],
        child: const MaterialApp(
          localizationsDelegates: [AuthStrings.delegate],
          home: RegisterConsentScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Créer mon compte'), findsOneWidget);

    await tester.tap(find.byType(CheckboxListTile));
    await tester.pump();

    final termsSwitch = find.byType(Switch).at(2);
    await tester.tap(termsSwitch);
    await tester.pump();

    await tester.tap(find.text('Créer mon compte'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
  });
}
