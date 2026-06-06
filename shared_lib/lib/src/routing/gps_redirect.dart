import '../auth/auth_session.dart';
import 'gps_routes.dart';

bool _isFirstRunPath(String location) {
  return location == GpsRoutes.splash ||
      location == GpsRoutes.language ||
      location.startsWith('${GpsRoutes.onboarding}/');
}

/// Resolves auth guard redirects for [GoRouter].
///
/// Returns a path to redirect to, or `null` if navigation may proceed.
String? resolveGpsRedirect({
  required AuthSession session,
  required String matchedLocation,
  bool onboardingCompleted = false,
}) {
  final location = matchedLocation.split('?').first;
  final authed = session.isAuthenticated;

  if (authed) {
    if (_isFirstRunPath(location) ||
        GpsRoutes.isAuthEntryPath(location) ||
        location.startsWith('/auth/register') ||
        location == GpsRoutes.forgotPassword ||
        location == GpsRoutes.resetPassword) {
      return GpsRoutes.discover;
    }
    return null;
  }

  if (location == GpsRoutes.splash) {
    return onboardingCompleted ? GpsRoutes.authWelcome : GpsRoutes.language;
  }

  if (onboardingCompleted && _isFirstRunPath(location)) {
    return GpsRoutes.authWelcome;
  }

  if (!GpsRoutes.isPublicPath(location)) {
    return GpsRoutes.authWelcome;
  }

  return null;
}
