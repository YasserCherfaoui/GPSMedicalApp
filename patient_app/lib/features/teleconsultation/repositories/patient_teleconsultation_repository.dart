import 'package:dio/dio.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class TeleconsultationSessionException implements Exception {
  const TeleconsultationSessionException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;
}

class PatientTeleconsultationRepository {
  PatientTeleconsultationRepository(this._client);

  final GpsMedicalClient _client;

  TeleconsultationSignallingClient signallingClient() {
    return TeleconsultationSignallingClient(_client.v1.dio);
  }

  Future<TeleSession> startSession(String appointmentId) async {
    try {
      final response = await _client.teleconsultation
          .teleconsultationsAppointmentIdSessionPost(
            appointmentId: appointmentId,
          );
      final session = response.data;
      if (session == null) {
        throw StateError('Empty teleconsultation session response');
      }
      return session;
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  Future<TurnCredentials?> fetchTurnCredentials() async {
    try {
      final response = await _client.teleconsultation
          .teleconsultationsTurnCredentialsGet();
      return response.data;
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  Future<TeleSession> endSession({
    required String appointmentId,
    required int durationSeconds,
    int? qualityScore,
  }) async {
    try {
      final request = TeleconsultationsAppointmentIdEndPostRequest((b) {
        b
          ..durationSeconds = durationSeconds
          ..qualityScore = qualityScore;
      });
      final response = await _client.teleconsultation
          .teleconsultationsAppointmentIdEndPost(
            appointmentId: appointmentId,
            teleconsultationsAppointmentIdEndPostRequest: request,
          );
      final session = response.data;
      if (session == null) {
        throw StateError('Empty teleconsultation end response');
      }
      return session;
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  TeleconsultationSessionException _mapDioError(DioException e) {
    final status = e.response?.statusCode;
    final data = e.response?.data;
    final map = data is Map
        ? data.map((k, v) => MapEntry(k.toString(), v))
        : null;
    final detail = map?['detail'] as String? ?? map?['title'] as String?;
    return TeleconsultationSessionException(
      detail ?? 'Teleconsultation unavailable',
      statusCode: status,
    );
  }
}
