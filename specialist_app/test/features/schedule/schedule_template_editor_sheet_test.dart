import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:specialist_app/features/schedule/widgets/schedule_template_editor_sheet.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
  });

  testWidgets('template editor sheet shows time and mode fields', (
    tester,
  ) async {
    harness.setLargeSurface(tester);
    await tester.pumpWidget(
      harness.wrapScreen(
        Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () {
                    showScheduleTemplateEditor(context, weekday: 1);
                  },
                  child: const Text('open-editor'),
                ),
              ),
            );
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('open-editor'));
    await tester.pumpAndSettle();

    expect(find.text('Ajouter une plage'), findsOneWidget);
    expect(find.text('Mode de consultation'), findsOneWidget);
    expect(find.text('Les deux'), findsOneWidget);

    await tester.tap(find.text('Enregistrer la plage'));
    await tester.pumpAndSettle();
    // Sheet pops with a draft when validation passes.
    expect(find.text('open-editor'), findsOneWidget);
  });
}
