import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

// tests for HealthCheck
void main() {
  final instance = HealthCheckBuilder();
  // TODO add properties to the builder and call build()

  group(HealthCheck, () {
    // String status
    test('to test the property `status`', () async {
      // TODO
    });

    // `ok` si PostgreSQL répond au ping, sinon `error`
    // String db
    test('to test the property `db`', () async {
      // TODO
    });

    // String redis
    test('to test the property `redis`', () async {
      // TODO
    });

    // `disabled` si le stockage objet n'est pas configuré (`STORAGE_PROVIDER` vide ou `disabled`) ; `ok` si le bucket répond ; `error` en cas d'échec de sonde. 
    // String storage
    test('to test the property `storage`', () async {
      // TODO
    });

  });
}
