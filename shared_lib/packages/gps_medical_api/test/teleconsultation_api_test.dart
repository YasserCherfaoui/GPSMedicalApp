import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';


/// tests for TeleconsultationApi
void main() {
  final instance = GpsMedicalApi().getTeleconsultationApi();

  group(TeleconsultationApi, () {
    // Page HTML de l'appel de test (lien à partager)
    //
    //Future<String> getTeleconsultLabPage(String roomId) async
    test('test getTeleconsultLabPage', () async {
      // TODO
    });

    // Rejoint la salle de test et émet les identifiants ICE/TURN
    //
    // Le premier pair est l'offreur WebRTC ; le second répond. Maximum deux participants. Crée une session lab éphémère (mémoire, pas de RDV). 
    //
    //Future<TeleconsultLabJoin> joinTeleconsultLabCall(String roomId, { TeleconsultLabJoinWrite teleconsultLabJoinWrite }) async
    test('test joinTeleconsultLabCall', () async {
      // TODO
    });

    // Signaux WebRTC du pair dans la salle de test
    //
    //Future<TeleconsultLabSignalList> listTeleconsultLabSignals(String roomId, String peerId, { int since, int waitMs }) async
    test('test listTeleconsultLabSignals', () async {
      // TODO
    });

    // Récupère les signaux WebRTC du pair depuis un curseur
    //
    // Retourne uniquement les signaux émis par l'autre participant, avec `seq` strictement supérieur à `since`. Aucun média n'est stocké. `wait_ms` active un long-poll (jusqu'à 10 s) pour éviter un polling HTTP agressif pendant l'appel. 
    //
    //Future<TeleconsultSignalList> listTeleconsultationSignals(String appointmentId, { int since, int waitMs }) async
    test('test listTeleconsultationSignals', () async {
      // TODO
    });

    // Publie un signal WebRTC dans la salle de test
    //
    //Future<TeleconsultSignal> postTeleconsultLabSignal(String roomId, TeleconsultLabSignalWrite teleconsultLabSignalWrite) async
    test('test postTeleconsultLabSignal', () async {
      // TODO
    });

    // Publie un message de signalisation WebRTC (SDP ou ICE)
    //
    // Relais REST pour l'échange d'offre/réponse SDP et de candidats ICE entre le patient et le médecin du rendez-vous. Les messages ne contiennent pas de média (ADR 0012). Un nouvel `offer` remplace l'offre, la réponse et les candidats ICE précédents de la session. 
    //
    //Future<TeleconsultSignal> postTeleconsultationSignal(String appointmentId, TeleconsultSignalWrite teleconsultSignalWrite) async
    test('test postTeleconsultationSignal', () async {
      // TODO
    });

    // Crée une salle de test et redirige vers le lien partageable
    //
    // Page d'essai WebRTC (deux navigateurs, même URL). Activée par défaut en `ENV=development`, sinon uniquement si `TELECONSULT_LAB=true`. Aucun média n'est stocké (ADR 0012). Utilise le même driver TURN que la téléconsultation (`TURN_DRIVER`). 
    //
    //Future startTeleconsultLabCall() async
    test('test startTeleconsultLabCall', () async {
      // TODO
    });

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
