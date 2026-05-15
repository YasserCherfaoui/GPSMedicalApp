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
    // Le créneau doit être disponible. Verrou optimiste sur le slot.
    //
    //Future<Appointment> appointmentsPost(AppointmentCreate appointmentCreate) async
    test('test appointmentsPost', () async {
      // TODO
    });
  });
}
