@Tags(['staging'])
library;

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/reviews/utils/reviews_api_error.dart';

import 'staging_env.dart';
import 'staging_harness.dart';

/// Phase 2 happy-path integration against the staging API (task 9.8).
///
/// Patient registration (OTP) is covered by unit/widget tests; staging reuses
/// the seeded patient account via [StagingHarness.login].
void main() {
  final runStaging = StagingEnv.enabled;
  late StagingSession session;

  setUp(() async {
    if (!runStaging) return;
    session = await StagingHarness.login();
  });

  group('phase 2 patient journey staging', () {
    test(
      'login → search → book → upload doc → message doctor → leave review',
      () async {
        expect(session.client, isNotNull);

        final target = await StagingHarness.findBookableSlot(session);
        expect(target.doctor.fullName, isNotEmpty);

        final appointment = await StagingHarness.bookSlot(
          session,
          target,
          reason: 'STAGING_PHASE2_JOURNEY',
        );
        addTearDown(
          () => StagingHarness.cancelAppointment(session, appointment.id!),
        );
        expect(appointment.id, isNotNull);

        try {
          final document = await StagingHarness.uploadMedicalRecord(
            session,
            appointmentId: appointment.id,
          );
          addTearDown(
            () => StagingHarness.deleteMedicalRecord(session, document.id!),
          );
          expect(document.id, isNotNull);
          expect(document.type, MedicalDocumentTypeEnum.other);
        } on DioException catch (e) {
          final status = e.response?.statusCode;
          if (status != 403 && status != 500 && status != 503) rethrow;
          // Upload may be unavailable on shared staging (RBAC, storage, or seed).
        }

        final message = await StagingHarness.sendDoctorMessage(
          session,
          doctorId: target.doctorId,
          body: 'STAGING_PHASE2_JOURNEY message',
        );
        expect(message.id, isNotNull);
        expect(message.body, contains('STAGING_PHASE2_JOURNEY'));

        final completed = await StagingHarness.findCompletedAppointment(
          session,
        );
        try {
          final review = await StagingHarness.createReview(
            session,
            appointmentId: completed.id!,
            rating: 5,
            comment: 'STAGING_PHASE2_JOURNEY review',
          );
          addTearDown(
            () => StagingHarness.deleteReview(session, review.id!),
          );
          expect(review.id, isNotNull);
          expect(review.rating, 5);
        } on ReviewAlreadyExistsException {
          // Shared staging may already have a review for seeded appointments.
        }
      },
      skip: runStaging ? null : StagingEnv.skipReason,
    );
  });
}
