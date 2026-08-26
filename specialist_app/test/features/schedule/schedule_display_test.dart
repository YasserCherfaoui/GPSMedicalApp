import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/features/schedule/utils/schedule_display.dart';

void main() {
  late AppLocalizations l10n;

  setUpAll(() async {
    l10n = await AppLocalizations.delegate.load(const Locale('fr'));
  });

  test('scheduleModeLabel covers modes', () {
    expect(scheduleModeLabel(l10n, 'in_person'), 'Présentiel');
    expect(scheduleModeLabel(l10n, 'telehealth'), 'Téléconsultation');
    expect(scheduleModeLabel(l10n, 'both'), 'Les deux');
    expect(scheduleModeLabel(l10n, 'unknown'), 'Les deux');
  });

  test('scheduleLocationLabel covers cabinet and clinic names', () {
    expect(
      scheduleLocationLabel(l10n, clinicId: null),
      'Personnel (mon cabinet)',
    );
    expect(
      scheduleLocationLabel(l10n, clinicId: ''),
      'Personnel (mon cabinet)',
    );
    expect(
      scheduleLocationLabel(l10n, clinicId: '00000000-0000-4000-8000-000000000001'),
      'Donné à Clinique',
    );
    final membership = ClinicMembership(
      (b) => b
        ..clinicId = '00000000-0000-4000-8000-000000000001'
        ..clinicName = 'Clinique El Amel'
        ..status = ClinicMembershipStatus.active,
    );
    expect(
      scheduleLocationLabel(
        l10n,
        clinicId: '00000000-0000-4000-8000-000000000001',
        memberships: [membership],
      ),
      'Donné à Clinique El Amel',
    );
  });

  test('scheduleExceptionKindLabel covers kinds', () {
    expect(
      scheduleExceptionKindLabel(l10n, ScheduleExceptionKindEnum.vacation),
      isNotEmpty,
    );
    expect(
      scheduleExceptionKindLabel(l10n, ScheduleExceptionKindEnum.sick),
      isNotEmpty,
    );
    expect(
      scheduleExceptionKindLabel(l10n, ScheduleExceptionKindEnum.blocked),
      isNotEmpty,
    );
    expect(
      scheduleExceptionKindLabel(l10n, ScheduleExceptionKindEnum.extra),
      isNotEmpty,
    );
    expect(scheduleExceptionKindLabel(l10n, null), isNotEmpty);
  });

  test('validationErrorMessage covers codes', () {
    const codes = [
      'INVALID_WEEKDAY',
      'INVALID_SLOT_DURATION',
      'INVALID_SLOT_INTERVAL',
      'INVALID_MODE',
      'START_TIME_REQUIRED',
      'INVALID_START_TIME',
      'END_TIME_REQUIRED',
      'INVALID_END_TIME',
      'END_TIME_MUST_EXCEED_START',
      'START_AT_REQUIRED',
      'INVALID_START_AT',
      'END_AT_REQUIRED',
      'INVALID_END_AT',
      'END_AT_MUST_EXCEED_START',
      'INVALID_KIND',
      'NOTE_TOO_LONG',
      'UNKNOWN',
    ];
    for (final code in codes) {
      expect(validationErrorMessage(l10n, code), isNotEmpty, reason: code);
    }
  });

  testWidgets('exceptionKindColor returns scheme colors', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: GpsTheme.light(),
        home: Builder(
          builder: (context) {
            expect(
              exceptionKindColor(context, ScheduleExceptionKindEnum.vacation),
              isA<Color>(),
            );
            expect(
              exceptionKindColor(context, ScheduleExceptionKindEnum.sick),
              isA<Color>(),
            );
            expect(
              exceptionKindColor(context, ScheduleExceptionKindEnum.extra),
              isA<Color>(),
            );
            expect(exceptionKindColor(context, null), isA<Color>());
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  });
}
