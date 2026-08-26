import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/features/appointments/utils/appointment_api_error.dart';
import 'package:specialist_app/features/appointments/utils/appointment_display.dart';

void main() {
  late AppLocalizations l10n;

  setUpAll(() async {
    l10n = await AppLocalizations.delegate.load(const Locale('fr'));
  });

  test('specialistPatientDisplayLabel anonymizes pending', () {
    final pending = Appointment(
      (b) => b
        ..id = '00000000-0000-4000-8000-000000000099'
        ..status = AppointmentStatusEnum.pending
        ..patientId = '00000000-0000-4000-8000-000000000050',
    );
    expect(
      specialistPatientDisplayLabel(l10n, pending),
      l10n.specialistAppointmentPatientAnonymous,
    );

    final confirmed = Appointment(
      (b) => b
        ..id = '00000000-0000-4000-8000-000000000099'
        ..status = AppointmentStatusEnum.confirmed
        ..patientId = '00000000-0000-4000-8000-000000000050',
    );
    expect(
      specialistPatientDisplayLabel(l10n, confirmed),
      contains('0050'),
    );
  });

  test('reasonSnippet truncates long text', () {
    expect(reasonSnippet(null), '');
    expect(reasonSnippet('  '), '');
    expect(reasonSnippet('Court'), 'Court');
    final long = List.filled(100, 'a').join();
    final truncated = reasonSnippet(long, maxLength: 20);
    expect(truncated.length, 20);
    expect(truncated.endsWith('…'), isTrue);
  });

  test('isClinicAssignedSession detects clinic_service origin', () {
    final clinic = Appointment(
      (b) => b..origin = AppointmentOriginEnum.clinicService,
    );
    final direct = Appointment(
      (b) => b..origin = AppointmentOriginEnum.doctorDirect,
    );
    expect(isClinicAssignedSession(clinic), isTrue);
    expect(isClinicAssignedSession(direct), isFalse);
  });

  test('appointmentActionMessage maps schedule conflict code', () {
    expect(
      appointmentActionMessage(
        l10n,
        const AppointmentActionException(
          'server',
          code: 'SPECIALIST_SCHEDULE_CONFLICT',
        ),
      ),
      l10n.specialistScheduleConflictMessage,
    );
    expect(
      appointmentActionMessage(
        l10n,
        const AppointmentActionException('autre erreur'),
      ),
      'autre erreur',
    );
  });
}
