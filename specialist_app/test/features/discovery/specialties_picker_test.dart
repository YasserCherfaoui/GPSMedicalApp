import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:specialist_app/features/discovery/widgets/specialties_picker.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
    harness.mockSpecialties();
  });

  testWidgets('specialties picker lists specialties', (tester) async {
    String? selectedId;
    await tester.pumpWidget(
      harness.wrapScreen(
        Scaffold(
          body: SpecialtiesPicker(
            onSpecialtySelected: (s) => selectedId = s.id,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Cardiologie'), findsOneWidget);
    await tester.tap(find.text('Cardiologie'));
    await tester.pump();
    expect(selectedId, '00000000-0000-4000-8000-000000000001');
  });
}
