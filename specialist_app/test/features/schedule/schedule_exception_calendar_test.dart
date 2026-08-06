import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/features/schedule/widgets/schedule_exception_calendar.dart';

import '../../support/specialist_test_harness.dart';

void main() {
  late SpecialistTestHarness harness;

  setUp(() {
    harness = SpecialistTestHarness()..setUpClient();
  });

  testWidgets('exception calendar renders month and marked days', (tester) async {
    harness.setLargeSurface(tester);
    final now = DateTime.now();
    final exceptions = [
      ScheduleException(
        (b) => b
          ..id = '00000000-0000-4000-8000-000000000201'
          ..kind = ScheduleExceptionKindEnum.vacation
          ..startAt = DateTime(now.year, now.month, 10)
          ..endAt = DateTime(now.year, now.month, 12),
      ),
    ];

    await tester.pumpWidget(
      harness.wrapScreen(
        Scaffold(
          body: ScheduleExceptionCalendar(
            focusedMonth: DateTime(now.year, now.month),
            exceptions: exceptions,
            onPreviousMonth: () {},
            onNextMonth: () {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(ScheduleExceptionCalendar), findsOneWidget);
  });
}
