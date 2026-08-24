import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';


/// tests for AvailabilityApi
void main() {
  final instance = GpsMedicalApi().getAvailabilityApi();

  group(AvailabilityApi, () {
    // Créer un template de capacité
    //
    //Future<ClinicScheduleTemplate> createClinicScheduleTemplate(ClinicScheduleTemplateCreate clinicScheduleTemplateCreate) async
    test('test createClinicScheduleTemplate', () async {
      // TODO
    });

    // Supprimer un template de capacité
    //
    //Future deleteClinicScheduleTemplate(String templateId) async
    test('test deleteClinicScheduleTemplate', () async {
      // TODO
    });

    // Créneaux disponibles d'un médecin
    //
    //Future<BuiltList<AvailabilitySlot>> doctorsDoctorIdAvailabilityGet(String doctorId, Date from, Date to, { String mode }) async
    test('test doctorsDoctorIdAvailabilityGet', () async {
      // TODO
    });

    // Congés et exceptions ponctuelles
    //
    //Future<BuiltList<ScheduleException>> doctorsMeScheduleExceptionsGet() async
    test('test doctorsMeScheduleExceptionsGet', () async {
      // TODO
    });

    // Ajout d'un congé / blocage de créneau
    //
    //Future<ScheduleException> doctorsMeScheduleExceptionsPost(ScheduleExceptionCreate scheduleExceptionCreate) async
    test('test doctorsMeScheduleExceptionsPost', () async {
      // TODO
    });

    // Modèles d'agenda hebdomadaires (récurrents)
    //
    //Future<BuiltList<ScheduleTemplate>> doctorsMeScheduleTemplatesGet() async
    test('test doctorsMeScheduleTemplatesGet', () async {
      // TODO
    });

    // Création d'un modèle hebdomadaire
    //
    //Future<ScheduleTemplate> doctorsMeScheduleTemplatesPost(ScheduleTemplateCreate scheduleTemplateCreate) async
    test('test doctorsMeScheduleTemplatesPost', () async {
      // TODO
    });

    // Suppression d'un modèle
    //
    //Future doctorsMeScheduleTemplatesTemplateIdDelete(String templateId) async
    test('test doctorsMeScheduleTemplatesTemplateIdDelete', () async {
      // TODO
    });

    // Remplacement d'un modèle
    //
    //Future<ScheduleTemplate> doctorsMeScheduleTemplatesTemplateIdPut(String templateId, ScheduleTemplateCreate scheduleTemplateCreate) async
    test('test doctorsMeScheduleTemplatesTemplateIdPut', () async {
      // TODO
    });

    // Créneaux de capacité clinique
    //
    // Même jeton de verrouillage (TTL 5 min) que les médecins. Le token encode `clinic_id` + `service_id` (origin `clinic_service`). 
    //
    //Future<BuiltList<ClinicAvailabilitySlot>> getClinicServiceAvailability(String clinicId, String serviceId, Date from, Date to, { String mode }) async
    test('test getClinicServiceAvailability', () async {
      // TODO
    });

    // Templates de capacité clinique
    //
    //Future<BuiltList<ClinicScheduleTemplate>> listClinicScheduleTemplates() async
    test('test listClinicScheduleTemplates', () async {
      // TODO
    });

    // Modifier un template de capacité
    //
    //Future<ClinicScheduleTemplate> patchClinicScheduleTemplate(String templateId, ClinicScheduleTemplateCreate clinicScheduleTemplateCreate) async
    test('test patchClinicScheduleTemplate', () async {
      // TODO
    });

  });
}
