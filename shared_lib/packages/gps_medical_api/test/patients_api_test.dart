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
    // Suppression logique (`deleted_at`). Les rendez-vous existants conservent `dependent_id`.
    //
    //Future patientsMeDependentsDependentIdDelete(String dependentId) async
    test('test patientsMeDependentsDependentIdDelete', () async {
      // TODO
    });

    // Modification d'un ayant droit
    //
    // Mise à jour partielle : seuls les champs présents dans le corps sont modifiés. Les champs absents restent inchangés (le schéma `DependentCreate` sert de modèle, pas de remplacement complet). 
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
    // Retourne le profil patient. Pour `data_residency_mode=device_only` (pays `DZ`), les champs restreints (`birth_date`, `gender`, `blood_type`, `address`, `allergies`, `chronic_conditions`, `insurance`) sont renvoyés à `null` même si des valeurs legacy existent en base (pas de purge ; elles ne sont simplement pas exposées — addendum-1.1.0). 
    //
    //Future<Patient> patientsMeGet() async
    test('test patientsMeGet', () async {
      // TODO
    });

    // Mise à jour partielle du profil patient
    //
    // Mise à jour partielle. Le champ `country` n'est **pas** accepté (immuable après OTP). Pour `data_residency_mode=device_only`, toute tentative d'écrire un champ restreint (`birth_date`, `gender`, `blood_type`, `address`, `allergies`, `chronic_conditions`, `insurance`) est rejetée explicitement avec `422` et `errors[].code = field_not_storable_in_country` (pas de strip silencieux). Les champs autorisés (`full_name`, `email`, …) restent acceptés. 
    //
    //Future<Patient> patientsMePatch(PatientUpdate patientUpdate) async
    test('test patientsMePatch', () async {
      // TODO
    });

  });
}
