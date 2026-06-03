import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';


/// tests for PatientsApi
void main() {
  final instance = GpsMedicalApi().getPatientsApi();

  group(PatientsApi, () {
    // Suppression du compte patient (RGPD — droit à l'effacement)
    //
    //Future patientsMeDelete() async
    test('test patientsMeDelete', () async {
      // TODO
    });

    // Suppression d'un ayant droit
    //
    //Future patientsMeDependentsDependentIdDelete(String dependentId) async
    test('test patientsMeDependentsDependentIdDelete', () async {
      // TODO
    });

    // Modification d'un ayant droit
    //
    //Future<Dependent> patientsMeDependentsDependentIdPatch(String dependentId, DependentCreate dependentCreate) async
    test('test patientsMeDependentsDependentIdPatch', () async {
      // TODO
    });

    // Liste des ayants droit (enfants, conjoint…)
    //
    //Future<BuiltList<Dependent>> patientsMeDependentsGet() async
    test('test patientsMeDependentsGet', () async {
      // TODO
    });

    // Ajout d'un ayant droit
    //
    //Future<Dependent> patientsMeDependentsPost(DependentCreate dependentCreate) async
    test('test patientsMeDependentsPost', () async {
      // TODO
    });

    // Profil du patient connecté
    //
    //Future<Patient> patientsMeGet() async
    test('test patientsMeGet', () async {
      // TODO
    });

    // Mise à jour partielle du profil patient
    //
    //Future<Patient> patientsMePatch(PatientUpdate patientUpdate) async
    test('test patientsMePatch', () async {
      // TODO
    });

  });
}
