import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';


/// tests for AppointmentsApi
void main() {
  final instance = GpsMedicalApi().getAppointmentsApi();

  group(AppointmentsApi, () {
    // Annulation
    //
    //Future<Appointment> appointmentsAppointmentIdCancelPost(String appointmentId, { AppointmentsAppointmentIdCancelPostRequest appointmentsAppointmentIdCancelPostRequest }) async
    test('test appointmentsAppointmentIdCancelPost', () async {
      // TODO
    });

    // Confirmation par le médecin (si politique manuelle)
    //
    //Future<Appointment> appointmentsAppointmentIdConfirmPost(String appointmentId) async
    test('test appointmentsAppointmentIdConfirmPost', () async {
      // TODO
    });

    // Détail d'un rendez-vous
    //
    //Future<Appointment> appointmentsAppointmentIdGet(String appointmentId) async
    test('test appointmentsAppointmentIdGet', () async {
      // TODO
    });

    // Marquer un patient absent (réservé au médecin)
    //
    //Future<Appointment> appointmentsAppointmentIdNoShowPost(String appointmentId) async
    test('test appointmentsAppointmentIdNoShowPost', () async {
      // TODO
    });

    // Reprogrammation ou modification (motif, notes)
    //
    //Future<Appointment> appointmentsAppointmentIdPatch(String appointmentId, AppointmentUpdate appointmentUpdate) async
    test('test appointmentsAppointmentIdPatch', () async {
      // TODO
    });

    // Liste des rendez-vous de l'utilisateur courant
    //
    //Future<PaginatedAppointments> appointmentsGet({ String status, Date from, Date to, int page, int pageSize }) async
    test('test appointmentsGet', () async {
      // TODO
    });

    // Création d'un rendez-vous
    //
    // Le créneau doit être disponible. Verrou optimiste sur le slot. `origin=doctor_direct` (défaut) : un médecin qui n'est pas `verified=true` n'est pas réservable → `404` ou `422`. `origin=clinic_service` : `clinic_id` + `service_id` + slot token ; `doctor_id` reste null jusqu'à `assign-specialist`. 
    //
    //Future<Appointment> appointmentsPost(AppointmentCreate appointmentCreate) async
    test('test appointmentsPost', () async {
      // TODO
    });

    // Assigner un spécialiste à une session clinique
    //
    // Réservé au staff de la clinique. Le spécialiste doit être `active` au roster. Conflit d'agenda (RDV direct ou autre session) → `409`. 
    //
    //Future<Appointment> assignAppointmentSpecialist(String appointmentId, InviteClinicMembershipRequest inviteClinicMembershipRequest) async
    test('test assignAppointmentSpecialist', () async {
      // TODO
    });

    // Boîte de réception des sessions cliniques
    //
    //Future<PaginatedAppointments> listClinicAppointments({ String status, int page, int pageSize }) async
    test('test listClinicAppointments', () async {
      // TODO
    });

  });
}
