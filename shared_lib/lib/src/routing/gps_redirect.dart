import '../auth/auth_session.dart';
import 'gps_routes.dart';

/// Resolves auth guard redirects for [GoRouter].
///
/// Returns a path to redirect to, or `null` if navigation may proceed.
String? resolveGpsRedirect({
  required AuthSession session,
  required String matchedLocation,
}) {
  final location = matchedLocation.split('?').first;
  final authed = session.isAuthenticated;

  if (!authed && !GpsRoutes.isPublicPath(location)) {
    return GpsRoutes.authWelcome;
  }

  if (authed) {
    if (GpsRoutes.isAuthEntryPath(location) ||
        location.startsWith('/auth/register') ||
        location == GpsRoutes.forgotPassword ||
        location == GpsRoutes.resetPassword) {
      return GpsRoutes.discover;
    }
  }

  return null;
}
