import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  group('resolveGpsRedirect', () {
    const unauthenticated = AuthSession.unauthenticated();
    const authenticated = AuthSession.authenticated(accessToken: 'token');

    test('sends guests away from protected routes', () {
      expect(
        resolveGpsRedirect(
          session: unauthenticated,
          matchedLocation: GpsRoutes.profile,
        ),
        GpsRoutes.authWelcome,
      );
    });

    test('allows public onboarding paths', () {
      expect(
        resolveGpsRedirect(
          session: unauthenticated,
          matchedLocation: GpsRoutes.onboardingStep(2),
        ),
        isNull,
      );
    });

    test('sends authenticated users away from login', () {
      expect(
        resolveGpsRedirect(
          session: authenticated,
          matchedLocation: GpsRoutes.login,
        ),
        GpsRoutes.discover,
      );
    });

    test('allows authenticated access to profile', () {
      expect(
        resolveGpsRedirect(
          session: authenticated,
          matchedLocation: GpsRoutes.profile,
        ),
        isNull,
      );
    });
  });
}
