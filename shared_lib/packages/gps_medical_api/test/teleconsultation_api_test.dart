import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

/// tests for TeleconsultationApi
void main() {
  final instance = GpsMedicalApi().getTeleconsultationApi();

  group(TeleconsultationApi, () {
    // Clôture explicite de la session (côté médecin)
    //
    //Future<TeleSession> teleconsultationsAppointmentIdEndPost(String appointmentId, { TeleconsultationsAppointmentIdEndPostRequest teleconsultationsAppointmentIdEndPostRequest }) async
    test('test teleconsultationsAppointmentIdEndPost', () async {
      // TODO
    });

    // Création / récupération de la session WebRTC liée à un RDV
    //
    // Disponible 15 min avant l'heure du RDV jusqu'à `end_at + 30 min`. Renvoie un jeton ICE/TURN à durée limitée.
    //
    //Future<TeleSession> teleconsultationsAppointmentIdSessionPost(String appointmentId) async
    test('test teleconsultationsAppointmentIdSessionPost', () async {
      // TODO
    });

    // Identifiants TURN éphémères
    //
    //Future<TurnCredentials> teleconsultationsTurnCredentialsGet() async
    test('test teleconsultationsTurnCredentialsGet', () async {
      // TODO
    });
  });
}
