import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/routing/specialist_redirect.dart';
import 'package:specialist_app/routing/specialist_routes.dart';
import 'package:specialist_app/routing/specialist_verification_status.dart';

void main() {
  group('resolveSpecialistRedirect', () {
    const unauthenticated = AuthSession.unauthenticated();
    const authenticated = AuthSession.authenticated(accessToken: 'token');

    test('routes unverified specialist login to verification pending', () {
      expect(
        resolveSpecialistRedirect(
          session: authenticated,
          matchedLocation: GpsRoutes.login,
          onboardingCompleted: true,
          verificationStatus: SpecialistVerificationStatus.pending,
        ),
        SpecialistRoutes.verificationPending,
      );
    });

    test('routes unverified specialist profile to verification pending', () {
      expect(
        resolveSpecialistRedirect(
          session: authenticated,
          matchedLocation: GpsRoutes.profile,
          onboardingCompleted: true,
          verificationStatus: SpecialistVerificationStatus.pending,
        ),
        SpecialistRoutes.verificationPending,
      );
    });

    test('routes verified specialist away from auth entry to shell', () {
      expect(
        resolveSpecialistRedirect(
          session: authenticated,
          matchedLocation: GpsRoutes.login,
          onboardingCompleted: true,
          verificationStatus: SpecialistVerificationStatus.verified,
        ),
        SpecialistRoutes.shell,
      );
    });

    test('allows verified specialist on shell', () {
      expect(
        resolveSpecialistRedirect(
          session: authenticated,
          matchedLocation: SpecialistRoutes.shell,
          onboardingCompleted: true,
          verificationStatus: SpecialistVerificationStatus.verified,
        ),
        isNull,
      );
    });

    test('delegates guests to shared pre-auth redirect', () {
      expect(
        resolveSpecialistRedirect(
          session: unauthenticated,
          matchedLocation: GpsRoutes.splash,
          onboardingCompleted: true,
          verificationStatus: SpecialistVerificationStatus.pending,
        ),
        GpsRoutes.authWelcome,
      );
    });
  });
}
