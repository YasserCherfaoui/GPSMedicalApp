import 'package:dio/dio.dart';

import '../../client/gps_medical_client.dart';

/// Phase 3.9 engagement overlay (addendum `1.3.0-engagement`) via raw Dio.
class EngagementRepository {
  EngagementRepository(this._client);

  final GpsMedicalClient _client;

  Dio get _dio => _client.v1.dio;

  // ── Message requests ──────────────────────────────────────────────

  Future<MessagingRequestCreated> createMessagingRequest({
    required String doctorId,
    required String body,
  }) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/messaging/requests',
      data: {'doctor_id': doctorId, 'body': body},
      options: Options(contentType: Headers.jsonContentType),
    );
    return MessagingRequestCreated.fromJson(res.data!);
  }

  Future<List<EngagementThread>> listMessagingRequests() async {
    final res = await _dio.get<Map<String, dynamic>>('/messaging/requests');
    final data = res.data?['data'] as List<dynamic>? ?? const [];
    return data
        .whereType<Map<String, dynamic>>()
        .map(EngagementThread.fromJson)
        .toList();
  }

  Future<EngagementThread> acceptMessagingThread(String threadId) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/messaging/threads/$threadId/accept',
    );
    return EngagementThread.fromJson(res.data!);
  }

  Future<EngagementThread> declineMessagingThread(String threadId) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/messaging/threads/$threadId/decline',
    );
    return EngagementThread.fromJson(res.data!);
  }

  // ── Instant consult ───────────────────────────────────────────────

  Future<InstantAvailability> setInstantAvailability({
    required bool active,
    required int priceMinor,
    required String currency,
    DateTime? autoExpiresAt,
  }) async {
    final body = <String, dynamic>{
      'active': active,
      'price_minor': priceMinor,
      'currency': currency,
    };
    if (autoExpiresAt != null) {
      body['auto_expires_at'] = autoExpiresAt.toUtc().toIso8601String();
    }
    final res = await _dio.put<Map<String, dynamic>>(
      '/doctors/me/availability/instant',
      data: body,
      options: Options(contentType: Headers.jsonContentType),
    );
    return InstantAvailability.fromJson(res.data!);
  }

  Future<void> clearInstantAvailability() async {
    await _dio.delete<void>('/doctors/me/availability/instant');
  }

  Future<List<AvailableNowDoctor>> listAvailableNow({
    required String specialtyId,
  }) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/doctors/available-now',
      queryParameters: {'specialty_id': specialtyId},
    );
    final data = res.data?['data'] as List<dynamic>? ?? const [];
    return data
        .whereType<Map<String, dynamic>>()
        .map(AvailableNowDoctor.fromJson)
        .toList();
  }

  Future<InstantTriageResult> createInstantTriage({
    required List<Map<String, String>> answers,
  }) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/instant-consults/triage',
      data: {'answers': answers},
      options: Options(contentType: Headers.jsonContentType),
    );
    return InstantTriageResult.fromJson(res.data!);
  }

  Future<InstantConsultRequest> createInstantConsultRequest({
    required String doctorId,
    required String triageId,
  }) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/instant-consults/requests',
      data: {'doctor_id': doctorId, 'triage_id': triageId},
      options: Options(contentType: Headers.jsonContentType),
    );
    return InstantConsultRequest.fromJson(res.data!);
  }

  Future<Map<String, dynamic>> acceptInstantConsultRequest(
    String requestId,
  ) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/instant-consults/requests/$requestId/accept',
    );
    return res.data ?? {};
  }

  Future<InstantConsultRequest> declineInstantConsultRequest(
    String requestId,
  ) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/instant-consults/requests/$requestId/decline',
    );
    return InstantConsultRequest.fromJson(res.data!);
  }

  // ── Offers ────────────────────────────────────────────────────────

  Future<EngagementOffer> createOffer({
    required String patientId,
    required DateTime startAt,
    required int durationMinutes,
    required String mode,
    required int priceMinor,
    required String currency,
    String? threadId,
    DateTime? expiresAt,
  }) async {
    final body = <String, dynamic>{
      'patient_id': patientId,
      'start_at': startAt.toUtc().toIso8601String(),
      'duration_minutes': durationMinutes,
      'mode': mode,
      'price_minor': priceMinor,
      'currency': currency,
    };
    if (threadId != null) body['thread_id'] = threadId;
    if (expiresAt != null) {
      body['expires_at'] = expiresAt.toUtc().toIso8601String();
    }
    final res = await _dio.post<Map<String, dynamic>>(
      '/offers',
      data: body,
      options: Options(contentType: Headers.jsonContentType),
    );
    return EngagementOffer.fromJson(res.data!);
  }

  Future<List<EngagementOffer>> listOffers({required String roleView}) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/offers',
      queryParameters: {'role_view': roleView},
    );
    final data = res.data?['data'] as List<dynamic>? ?? const [];
    return data
        .whereType<Map<String, dynamic>>()
        .map(EngagementOffer.fromJson)
        .toList();
  }

  Future<Map<String, dynamic>> payOffer(String offerId) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/offers/$offerId/pay',
    );
    return res.data ?? {};
  }

  Future<EngagementOffer> declineOffer(String offerId) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/offers/$offerId/decline',
    );
    return EngagementOffer.fromJson(res.data!);
  }

  // ── Waitlist ──────────────────────────────────────────────────────

  Future<WaitlistEntry> joinWaitlist(String doctorId) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/doctors/$doctorId/waitlist',
    );
    return WaitlistEntry.fromJson(res.data!);
  }

  Future<void> leaveWaitlist(String doctorId) async {
    await _dio.delete<void>('/doctors/$doctorId/waitlist');
  }

  Future<List<WaitlistEntry>> listMyWaitlists() async {
    final res = await _dio.get<List<dynamic>>('/patients/me/waitlists');
    final data = res.data ?? const [];
    return data
        .whereType<Map<String, dynamic>>()
        .map(WaitlistEntry.fromJson)
        .toList();
  }
}

// ── Models ────────────────────────────────────────────────────────────

class MessagingRequestCreated {
  MessagingRequestCreated({required this.threadId, required this.messageId});

  final String threadId;
  final String messageId;

  factory MessagingRequestCreated.fromJson(Map<String, dynamic> json) {
    final thread = json['thread'] as Map<String, dynamic>? ?? {};
    final message = json['message'] as Map<String, dynamic>? ?? {};
    return MessagingRequestCreated(
      threadId: thread['id'] as String? ?? '',
      messageId: message['id'] as String? ?? '',
    );
  }
}

class EngagementThread {
  EngagementThread({
    required this.id,
    this.patientId,
    this.doctorId,
    this.state,
  });

  final String id;
  final String? patientId;
  final String? doctorId;
  final String? state;

  factory EngagementThread.fromJson(Map<String, dynamic> json) {
    return EngagementThread(
      id: json['id'] as String? ?? '',
      patientId: json['patient_id'] as String?,
      doctorId: json['doctor_id'] as String?,
      state: json['state'] as String?,
    );
  }
}

class InstantAvailability {
  InstantAvailability({
    required this.active,
    required this.priceMinor,
    required this.currency,
    this.autoExpiresAt,
    this.suspended = false,
  });

  final bool active;
  final int priceMinor;
  final String currency;
  final DateTime? autoExpiresAt;
  final bool suspended;

  factory InstantAvailability.fromJson(Map<String, dynamic> json) {
    return InstantAvailability(
      active: json['active'] as bool? ?? false,
      priceMinor: json['price_minor'] as int? ?? 0,
      currency: json['currency'] as String? ?? 'DZD',
      autoExpiresAt: DateTime.tryParse(json['auto_expires_at'] as String? ?? ''),
      suspended: json['suspended'] as bool? ?? false,
    );
  }
}

class AvailableNowDoctor {
  AvailableNowDoctor({
    required this.id,
    required this.fullName,
    this.instantPriceMinor,
    this.instantCurrency,
    this.presence,
  });

  final String id;
  final String fullName;
  final int? instantPriceMinor;
  final String? instantCurrency;
  final String? presence;

  factory AvailableNowDoctor.fromJson(Map<String, dynamic> json) {
    return AvailableNowDoctor(
      id: json['id'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      instantPriceMinor: json['instant_price_minor'] as int?,
      instantCurrency: json['instant_currency'] as String?,
      presence: json['presence'] as String?,
    );
  }
}

class InstantTriageResult {
  InstantTriageResult({
    required this.id,
    required this.blocked,
    this.emergencyCopyKey,
  });

  final String id;
  final bool blocked;
  final String? emergencyCopyKey;

  factory InstantTriageResult.fromJson(Map<String, dynamic> json) {
    return InstantTriageResult(
      id: json['id'] as String? ?? '',
      blocked: json['blocked'] as bool? ?? false,
      emergencyCopyKey: json['emergency_copy_key'] as String?,
    );
  }
}

class InstantConsultRequest {
  InstantConsultRequest({
    required this.id,
    required this.status,
    this.expiresAt,
    this.appointmentId,
  });

  final String id;
  final String status;
  final DateTime? expiresAt;
  final String? appointmentId;

  factory InstantConsultRequest.fromJson(Map<String, dynamic> json) {
    return InstantConsultRequest(
      id: json['id'] as String? ?? '',
      status: json['status'] as String? ?? '',
      expiresAt: DateTime.tryParse(json['expires_at'] as String? ?? ''),
      appointmentId: json['appointment_id'] as String?,
    );
  }
}

class EngagementOffer {
  EngagementOffer({
    required this.id,
    required this.status,
    required this.priceMinor,
    required this.currency,
    this.startAt,
    this.paymentAvailability,
    this.appointmentId,
  });

  final String id;
  final String status;
  final int priceMinor;
  final String currency;
  final DateTime? startAt;
  final String? paymentAvailability;
  final String? appointmentId;

  factory EngagementOffer.fromJson(Map<String, dynamic> json) {
    return EngagementOffer(
      id: json['id'] as String? ?? '',
      status: json['status'] as String? ?? '',
      priceMinor: json['price_minor'] as int? ?? 0,
      currency: json['currency'] as String? ?? 'DZD',
      startAt: DateTime.tryParse(json['start_at'] as String? ?? ''),
      paymentAvailability: json['payment_availability'] as String?,
      appointmentId: json['appointment_id'] as String?,
    );
  }
}

class WaitlistEntry {
  WaitlistEntry({
    required this.id,
    required this.doctorId,
    required this.position,
    required this.status,
  });

  final String id;
  final String doctorId;
  final int position;
  final String status;

  factory WaitlistEntry.fromJson(Map<String, dynamic> json) {
    return WaitlistEntry(
      id: json['id'] as String? ?? '',
      doctorId: json['doctor_id'] as String? ?? '',
      position: json['position'] as int? ?? 0,
      status: json['status'] as String? ?? '',
    );
  }
}
