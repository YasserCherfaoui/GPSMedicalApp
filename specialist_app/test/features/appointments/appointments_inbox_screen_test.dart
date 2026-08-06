import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:specialist_app/features/appointments/screens/appointments_inbox_screen.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
    harness.mockEmptyAppointments();
  });

  testWidgets('inbox shows empty tabs for requests confirmed and history', (
    tester,
  ) async {
    await tester.pumpWidget(
      harness.wrapScreen(
        const Scaffold(body: AppointmentsInboxScreen()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Aucune demande en attente'), findsOneWidget);

    await tester.tap(find.text('Confirmés'));
    await tester.pumpAndSettle();
    expect(find.text('Aucun rendez-vous confirmé'), findsOneWidget);

    await tester.tap(find.text('Historique'));
    await tester.pumpAndSettle();
    expect(find.text('Aucun rendez-vous passé'), findsOneWidget);
  });

  testWidgets('inbox Arabic RTL sets Directionality to rtl', (tester) async {
    await tester.pumpWidget(
      harness.wrapScreen(
        const Scaffold(body: AppointmentsInboxScreen()),
        locale: const Locale('ar'),
      ),
    );
    await tester.pumpAndSettle();

    final directionality = tester.widget<Directionality>(
      find.byType(Directionality).first,
    );
    expect(directionality.textDirection, TextDirection.rtl);
    expect(find.text('لا توجد طلبات قيد الانتظار'), findsOneWidget);
  });
}
