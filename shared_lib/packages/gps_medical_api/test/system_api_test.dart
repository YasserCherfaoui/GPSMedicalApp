import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

/// tests for SystemApi
void main() {
  final instance = GpsMedicalApi().getSystemApi();

  group(SystemApi, () {
    // Santé de l''API — PostgreSQL et Redis
    //
    // Vérifie la disponibilité de PostgreSQL (`db`), de Redis (`redis`) et, si configuré, du stockage objet (`storage`). `storage=disabled` lorsque `STORAGE_PROVIDER` est vide (uploads désactivés) ; cela ne dégrade pas le statut global. Une réponse `200` indique une plateforme prête (`status=ok`). Une réponse `503` indique une perte ou refus (`status=degraded`). Une corrélation requête/réponse est toujours possible via **X-Request-ID** renvoyé dans l''en-tête de réponse.
    //
    //Future<HealthCheck> getHealth() async
    test('test getHealth', () async {
      // TODO
    });
  });
}
