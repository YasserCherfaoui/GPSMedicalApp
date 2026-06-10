import 'package:gps_medical_shared/gps_medical_shared.dart';

import 'specialist_routes.dart';
import 'specialist_verification_status.dart';

/// Auth guard for the specialist app — routes verified specialists to the shell.
String? resolveSpecialistRedirect({
  required AuthSession session,
  required String matchedLocation,
  required bool onboardingCompleted,
  required SpecialistVerificationStatus verificationStatus,
}) {
  final location = matchedLocation.split('?').first;
  final authed = session.isAuthenticated;

  if (authed) {
    final isVerified =
        verificationStatus == SpecialistVerificationStatus.verified;
    final onVerification = location == SpecialistRoutes.verificationPending;
    final onShell = location == SpecialistRoutes.shell;

    if (!isVerified) {
      if (onVerification) return null;
      if (location == GpsRoutes.profile ||
          location.startsWith('/auth/register') ||
          GpsRoutes.isAuthEntryPath(location) ||
          location == GpsRoutes.registrationSuccess) {
        return SpecialistRoutes.verificationPending;
      }
      if (!GpsRoutes.isPublicPath(location) && !onShell) {
        return SpecialistRoutes.verificationPending;
      }
      return null;
    }

    if (onVerification ||
        GpsRoutes.isAuthEntryPath(location) ||
        location.startsWith('/auth/register') ||
        location == GpsRoutes.registrationSuccess ||
        location == GpsRoutes.profile) {
      return SpecialistRoutes.shell;
    }
    return null;
  }

  return resolveGpsRedirect(
    session: session,
    matchedLocation: matchedLocation,
    onboardingCompleted: onboardingCompleted,
  );
}
