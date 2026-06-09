import 'dart:typed_data';

import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/booking/repositories/appointment_repository.dart';
import 'package:patient_app/features/booking/repositories/availability_repository.dart';
import 'package:patient_app/features/booking/utils/booking_enums.dart';
import 'package:patient_app/features/discovery/providers/doctor_search.provider.dart';
import 'package:patient_app/features/discovery/repositories/doctor_repository.dart';
import 'package:patient_app/features/discovery/repositories/search_repository.dart';
import 'package:patient_app/features/medical_records/repositories/medical_records_repository.dart';
import 'package:patient_app/features/messaging/repositories/messaging_repository.dart';
import 'package:patient_app/features/reviews/repositories/reviews_repository.dart';
import 'staging_env.dart';

class StagingSession {
  StagingSession({
    required this.client,
    required this.tokenStore,
  });

  final GpsMedicalClient client;
  final InMemoryTokenStore tokenStore;

  AppointmentRepository get appointments => AppointmentRepository(client);

  AvailabilityRepository get availability => AvailabilityRepository(client);

  DoctorRepository get doctors => DoctorRepository(client);

  SearchRepository get search => SearchRepository(client);

  MedicalRecordsRepository get medicalRecords =>
      MedicalRecordsRepository(client);

  MessagingRepository get messaging => MessagingRepository(client);

  ReviewsRepository get reviews => ReviewsRepository(client);
}

class StagingBookableSlot {
  const StagingBookableSlot({
    required this.doctorId,
    required this.doctor,
    required this.slot,
  });

  final String doctorId;
  final Doctor doctor;
  final AvailabilitySlot slot;
}

/// Minimal 1×1 PNG (magic bytes valid for staging upload MIME checks).
final Uint8List kStagingMinimalPng = Uint8List.fromList([
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
  0x42,
  0x60,
  0x82,
]);

class StagingHarness {
  static Future<StagingSession> login() async {
    final tokenStore = InMemoryTokenStore();
    final client = GpsMedicalClient(
      tokenStore: tokenStore,
      apiRootUrl: StagingEnv.apiRoot,
    );
    final loginResponse = await client.phase1.login(
      loginRequest: LoginRequest(
        (b) => b
          ..phone = StagingEnv.patientPhone
          ..password = StagingEnv.patientPassword,
      ),
    );
    final tokens = loginResponse.data;
    if (tokens == null) {
      throw StateError('Staging login failed (${loginResponse.statusCode})');
    }
    final accessToken = tokens.accessToken;
    if (accessToken == null || accessToken.isEmpty) {
      throw StateError('Staging login returned empty access token');
    }
    await tokenStore.saveTokens(tokens);
    client.applyBearerToken(accessToken);
    return StagingSession(client: client, tokenStore: tokenStore);
  }

  static Future<StagingBookableSlot> findBookableSlot(
    StagingSession session, {
    Duration minLeadTime = const Duration(hours: 25),
  }) async {
    final doctorId = StagingEnv.doctorId;
    if (doctorId != null) {
      final doctor = await session.doctors.fetchById(doctorId);
      final slot = await _firstSlotForDoctor(
        session,
        doctorId: doctorId,
        minLeadTime: minLeadTime,
      );
      return StagingBookableSlot(
        doctorId: doctorId,
        doctor: doctor,
        slot: slot,
      );
    }

    final searchResult = await session.search.searchDoctors(
      filters: const SearchFilters(wilayaCode: StagingEnv.defaultWilayaCode),
      page: 1,
      pageSize: 20,
    );
    for (final candidate in searchResult.doctors) {
      final id = candidate.id;
      if (id == null || id.isEmpty) continue;
      try {
        final doctor = await session.doctors.fetchById(id);
        final slot = await _firstSlotForDoctor(
          session,
          doctorId: id,
          minLeadTime: minLeadTime,
        );
        return StagingBookableSlot(doctorId: id, doctor: doctor, slot: slot);
      } catch (_) {
        continue;
      }
    }
    throw StateError('No bookable staging slot found in wilaya 16');
  }

  static Future<AvailabilitySlot> _firstSlotForDoctor(
    StagingSession session, {
    required String doctorId,
    required Duration minLeadTime,
  }) async {
    final from = DateTime.now().toUtc().toDate();
    final to = DateTime.now().add(const Duration(days: 14)).toUtc().toDate();
    final slots = await session.availability.fetchSlots(
      doctorId: doctorId,
      from: from,
      to: to,
      mode: 'in_person',
    );
    final cutoff = DateTime.now().toUtc().add(minLeadTime);
    for (final slot in slots) {
      final start = slot.startAt;
      final token = slot.slotLockToken;
      if (start == null || token == null || token.isEmpty) continue;
      if (start.isAfter(cutoff)) return slot;
    }
    throw StateError('No in-person slot ≥ ${minLeadTime.inHours}h ahead');
  }

  static Future<Appointment> bookSlot(
    StagingSession session,
    StagingBookableSlot target, {
    String? dependentId,
    String reason = 'STAGING_E2E_BOOKING',
  }) {
    final slot = target.slot;
    final start = slot.startAt;
    final mode = slot.mode;
    final token = slot.slotLockToken;
    if (start == null || mode == null || token == null) {
      throw StateError('Invalid availability slot');
    }
    final body = AppointmentCreate(
      (b) => b
        ..doctorId = target.doctorId
        ..startAt = start.toUtc()
        ..mode = toCreateMode(mode)
        ..slotLockToken = token
        ..reason = reason
        ..dependentId = dependentId,
    );
    return session.appointments.create(body);
  }

  static Future<void> cancelAppointment(
    StagingSession session,
    String appointmentId, {
    String reason = 'STAGING_E2E_CLEANUP',
  }) async {
    try {
      await session.appointments.cancel(
        appointmentId: appointmentId,
        reason: reason,
      );
    } catch (_) {
      // Best-effort cleanup for shared staging.
    }
  }

  static Future<Dependent> ensureDependent(StagingSession session) async {
    final existing = await session.client.patients.patientsMeDependentsGet();
    final dependents = existing.data?.toList() ?? [];
    if (dependents.isNotEmpty && dependents.first.id != null) {
      return dependents.first;
    }

    final stamp = DateTime.now().millisecondsSinceEpoch;
    final response = await session.client.patients.patientsMeDependentsPost(
      dependentCreate: DependentCreate(
        (b) => b
          ..fullName = 'Staging Child $stamp'
          ..relation = DependentCreateRelationEnum.child
          ..birthDate = Date(2015, 6, 1)
          ..gender = DependentCreateGenderEnum.male,
      ),
    );
    final created = response.data;
    if (created == null) {
      throw StateError('Failed to create staging dependent');
    }
    return created;
  }

  static Future<MedicalDocument> uploadMedicalRecord(
    StagingSession session, {
    String? appointmentId,
  }) async {
    final stamp = DateTime.now().millisecondsSinceEpoch;
    return session.medicalRecords.upload(
      bytes: Uint8List.fromList(kStagingMinimalPng),
      fileName: 'staging-e2e-$stamp.png',
      mimeType: 'image/png',
      type: MedicalDocumentTypeEnum.other,
      appointmentId: appointmentId,
      title: 'Staging E2E upload',
      notes: 'Created by phase 2 integration test',
    );
  }

  static Future<void> deleteMedicalRecord(
    StagingSession session,
    String documentId,
  ) async {
    try {
      await session.client.medicalRecords.medicalRecordsDocumentIdDelete(
        documentId: documentId,
      );
    } catch (_) {
      // Best-effort cleanup for shared staging.
    }
  }

  static Future<Message> sendDoctorMessage(
    StagingSession session, {
    required String doctorId,
    required String body,
  }) async {
    return session.messaging.sendMessage(
      doctorId,
      body: body,
    );
  }

  /// Returns a completed appointment from the staging patient's history.
  static Future<Appointment> findCompletedAppointment(
    StagingSession session,
  ) async {
    final result = await session.appointments.list(
      status: 'completed',
      page: 1,
      pageSize: 50,
    );
    for (final appointment in result.appointments) {
      final id = appointment.id;
      if (id != null && id.isNotEmpty) {
        return appointment;
      }
    }
    throw StateError('No completed staging appointment found');
  }

  static Future<Review> createReview(
    StagingSession session, {
    required String appointmentId,
    int rating = 5,
    String? comment,
  }) {
    return session.reviews.create(
      appointmentId: appointmentId,
      rating: rating,
      comment: comment,
    );
  }

  static Future<void> deleteReview(
    StagingSession session,
    String reviewId,
  ) async {
    try {
      await session.reviews.delete(reviewId);
    } catch (_) {
      // Best-effort cleanup for shared staging.
    }
  }
}
