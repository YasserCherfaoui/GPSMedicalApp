import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:specialist_app/features/patient_records/screens/specialist_medical_record_viewer_screen.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;
  const documentId = '00000000-0000-4000-8000-000000000070';

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
    harness.adapter.onGet('/medical-records/$documentId', (server) {
      return server.reply(500, {
        'title': 'Error',
        'status': 500,
      });
    });
  });

  testWidgets('medical record viewer shows error state', (tester) async {
    await tester.pumpWidget(
      harness.wrapScreen(
        const SpecialistMedicalRecordViewerScreen(documentId: documentId),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(SpecialistMedicalRecordViewerScreen), findsOneWidget);
  });
}
