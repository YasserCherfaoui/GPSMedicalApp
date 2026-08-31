import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/anamnesis/anamnesis_constants.dart';
import 'package:patient_app/routing/patient_router.dart';

void main() {
  test('anamnesis flag defaults off', () {
    expect(anamnesisEnabledFromEnv(), isFalse);
  });

  test('flag-off redirects only anamnesis QCM/documents to Discover', () {
    expect(
      anamnesisRouteRedirect(
        matchedLocation: GpsRoutes.anamnesisQcm,
        enabled: false,
      ),
      GpsRoutes.discover,
    );
    expect(
      anamnesisRouteRedirect(
        matchedLocation: '${GpsRoutes.anamnesisDocuments}/session-1',
        enabled: false,
      ),
      GpsRoutes.discover,
    );
  });

  test('flag-off keeps coaching and bilans reachable', () {
    expect(
      anamnesisRouteRedirect(
        matchedLocation: GpsRoutes.coachingPlans,
        enabled: false,
      ),
      isNull,
    );
    expect(
      anamnesisRouteRedirect(
        matchedLocation: GpsRoutes.coachingPlanDetail('plan-1'),
        enabled: false,
      ),
      isNull,
    );
    expect(
      anamnesisRouteRedirect(
        matchedLocation: GpsRoutes.bilans,
        enabled: false,
      ),
      isNull,
    );
  });

  test('flag-on allows all gated routes', () {
    expect(
      anamnesisRouteRedirect(
        matchedLocation: GpsRoutes.anamnesisQcm,
        enabled: true,
      ),
      isNull,
    );
  });
}
