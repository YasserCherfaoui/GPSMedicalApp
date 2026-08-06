import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:specialist_app/features/discovery/widgets/wilaya_commune_picker.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
    harness.mockWilayasAndCommunes();
  });

  testWidgets('wilaya picker filters and opens communes', (tester) async {
    harness.setLargeSurface(tester);
    await tester.pumpWidget(
      harness.wrapScreen(
        Scaffold(
          body: SizedBox(
            height: 500,
            child: WilayaCommunePicker(onLocationChanged: (_, __) {}),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('16 - Alger'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Or');
    await tester.pump();
    expect(find.textContaining('Oran'), findsOneWidget);
    expect(find.textContaining('Alger'), findsNothing);

    await tester.tap(find.textContaining('Oran'));
    await tester.pumpAndSettle();
  });
}
