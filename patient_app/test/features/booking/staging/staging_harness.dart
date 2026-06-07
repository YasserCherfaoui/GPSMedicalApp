import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/booking/repositories/appointment_repository.dart';
import 'package:patient_app/features/booking/repositories/availability_repository.dart';
import 'package:patient_app/features/booking/utils/booking_enums.dart';
import 'package:patient_app/features/discovery/providers/doctor_search.provider.dart';
import 'package:patient_app/features/discovery/repositories/doctor_repository.dart';
import 'package:patient_app/features/discovery/repositories/search_repository.dart';

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
      return StagingBookableSlot(doctorId: doctorId, doctor: doctor, slot: slot);
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
}
