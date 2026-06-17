import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  testWidgets('ScheduleWeekdayGrid selects weekday and shows indicator', (
    tester,
  ) async {
    var selected = 1;
    final configured = Set<int>.from({1, 3});

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: Scaffold(
          body: ScheduleWeekdayGrid(
            selectedWeekday: selected,
            weekdaysWithTemplates: configured,
            onWeekdaySelected: (day) => selected = day,
          ),
        ),
      ),
    );

    expect(find.byType(ChoiceChip), findsNWidgets(7));
    await tester.tap(find.byType(ChoiceChip).at(3));
    await tester.pumpAndSettle();
    expect(selected, 3);
  });

  testWidgets('VerificationStatusBanner renders comment box', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VerificationStatusBanner(
            title: 'Pending',
            body: 'Please wait',
            icon: Icons.hourglass_top,
            comment: 'Admin note',
          ),
        ),
      ),
    );

    expect(find.text('Pending'), findsOneWidget);
    expect(find.text('Admin note'), findsOneWidget);
  });
}
