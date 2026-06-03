import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

// tests for RegisterRequest
void main() {
  final instance = RegisterRequestBuilder();
  // TODO add properties to the builder and call build()

  group(RegisterRequest, () {
    // Numéro algérien au format E.164
    // String phone
    test('to test the property `phone`', () async {
      // TODO
    });

    // Numéro d'Identification National (NIN) algérien — 18 chiffres, institué par le décret exécutif n° 10-210 (2010) et reconduit par le décret de 2023. La structure officielle des 18 chiffres est :  | Positions | Lg | Signification | |---|---|---| | 1 | 1 | Sexe (`1` = homme, `2` = femme) | | 2 | 1 | Code mention (naissance régulière, transcription, naturalisation, …) | | 3–5 | 3 | Trois derniers chiffres de l'année d'inscription au registre | | 6–9 | 4 | Code commune (ou pays, pour les naissances à l'étranger) | | 10–14 | 5 | Numéro d'acte de naissance | | 15–16 | 2 | Numéro de série du registre pour l'année | | 17–18 | 2 | Clé de contrôle |  Le format est validé côté serveur (longueur, chiffres uniquement, sexe, année d'inscription résolvable en `19xx`/`20xx`, code commune non nul, pas de chiffre répété). La clé de contrôle n'est **pas** vérifiée localement : l'algorithme officiel est de la responsabilité de l'API gouvernementale.  La vérification auprès de l'API gouvernementale est *best-effort* : en cas d'indisponibilité, l'inscription est acceptée et le compte reste avec `nin_verification_status = pending` jusqu'à validation ultérieure (voir ADR 0005). 
    // String nin
    test('to test the property `nin`', () async {
      // TODO
    });

    // String password
    test('to test the property `password`', () async {
      // TODO
    });

    // String role
    test('to test the property `role`', () async {
      // TODO
    });

    // String fullName
    test('to test the property `fullName`', () async {
      // TODO
    });

    // String email
    test('to test the property `email`', () async {
      // TODO
    });

    // Consentement obligatoire au traitement des données personnelles (ANPDP).
    // bool consentDataProcessing
    test('to test the property `consentDataProcessing`', () async {
      // TODO
    });

    // Consentement obligatoire au traitement des données de santé.
    // bool consentHealthData
    test('to test the property `consentHealthData`', () async {
      // TODO
    });

    // Acceptation des conditions légales / politique ANPDP.
    // bool consentAnpdpTerms
    test('to test the property `consentAnpdpTerms`', () async {
      // TODO
    });

    // Optionnel — communications marketing (révocable sans suspension de compte).
    // bool consentMarketing
    test('to test the property `consentMarketing`', () async {
      // TODO
    });

  });
}
