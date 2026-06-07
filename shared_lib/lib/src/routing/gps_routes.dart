/// Type-safe route paths for Phase 1 mobile flows.
///
/// Use [GpsRoutes] constants in `go_router` configuration and navigation
/// calls — avoid hard-coded path strings in feature code.
abstract final class GpsRoutes {
  // Pre-auth
  static const splash = '/';
  static const language = '/language';
  static const onboarding = '/onboarding';
  static String onboardingStep(int step) => '$onboarding/$step';

  // Auth entry
  static const authWelcome = '/auth';
  static const login = '/auth/login';

  // Registration
  static const registerNin = '/auth/register/nin';
  static const registerFullName = '/auth/register/name';
  static const registerPhone = '/auth/register/phone';
  static const registerOtp = '/auth/register/otp';
  static const registerPassword = '/auth/register/password';
  static const registerConsent = '/auth/register/consent';

  // Password recovery
  static const forgotPassword = '/auth/forgot-password';
  static const resetPassword = '/auth/reset-password';

  // Post-auth (placeholders until task 1.16+)
  static const profile = '/profile';
  static const profileEdit = '/profile/edit';
  static const profileAccount = '/profile/account';
  static const profileConsents = '/profile/consents';
  static const profileDependents = '/profile/dependents';
  static String profileDependentEdit(String id) => '/profile/dependents/$id/edit';
  static const profileDependentNew = '/profile/dependents/new';
  static const medicalRecords = '/medical-records';
  static const medicalRecordsUpload = '/medical-records/upload';
  static String medicalRecordDetail(String id) => '/medical-records/$id';
  static const consentRevoked = '/auth/consent-revoked';
  static const biometricSetup = '/setup/biometric';
  static const registrationSuccess = '/setup/success';

  // Discovery & Week 6/7 Flows
  static const discover = '/discover';
  static const map = '/map';
  static const search = '/search';
  static const appointments = '/appointments';
  static const booking = '/booking';
  static String doctorDetail(String id) => '/doctors/$id';
  static String doctorBooking(String id) => '/doctors/$id/book';
  static String appointmentDetail(String id) => '/appointments/$id';

  /// Debug-only design system QA (see [createGpsRouter]).
  static const designSystemShowcase = '/dev/design-system';

  /// Routes reachable without an authenticated session.
  static const Set<String> publicPaths = {
    splash,
    language,
    onboarding,
    authWelcome,
    login,
    registerNin,
    registerFullName,
    registerPhone,
    registerOtp,
    registerPassword,
    registerConsent,
    forgotPassword,
    resetPassword,
    consentRevoked,
    designSystemShowcase,
  };

  static bool isPublicPath(String location) {
    if (publicPaths.contains(location)) {
      return true;
    }
    if (location.startsWith('$onboarding/')) {
      return true;
    }
    if (location.startsWith('/auth')) {
      return true;
    }
    return false;
  }

  static bool isAuthEntryPath(String location) {
    return location == authWelcome || location == login;
  }
}
