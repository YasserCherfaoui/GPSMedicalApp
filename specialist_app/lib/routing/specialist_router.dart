import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../features/credentials/screens/credentials_submission_screen.dart';
import '../features/profile/screens/specialist_profile_edit_screen.dart';
import '../screens/specialist_shell_screen.dart';
import '../screens/verification_pending_screen.dart';
import 'specialist_redirect.dart';
import 'specialist_routes.dart';
import 'specialist_verification_status.dart';

final specialistRootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createSpecialistRouter({
  required AuthSessionNotifier authListenable,
  required Listenable verificationListenable,
  required GpsMedicalAppInfo appInfo,
  required AppLaunchPreferences launchPreferences,
  required SpecialistVerificationStatus verificationStatus,
}) {
  AuthSession sessionOf() => authListenable.session;

  return GoRouter(
    navigatorKey: specialistRootNavigatorKey,
    initialLocation: GpsRoutes.splash,
    refreshListenable: Listenable.merge([
      authListenable,
      verificationListenable,
    ]),
    redirect: (context, state) {
      return resolveSpecialistRedirect(
        session: sessionOf(),
        matchedLocation: state.matchedLocation,
        onboardingCompleted: launchPreferences.onboardingCompleted,
        verificationStatus: verificationStatus,
      );
    },
    routes: [
      GoRoute(
        path: GpsRoutes.splash,
        builder: (context, state) => SplashScreen(appInfo: appInfo),
      ),
      GoRoute(
        path: GpsRoutes.language,
        builder: (context, state) => const LanguageScreen(),
      ),
      GoRoute(
        path: '${GpsRoutes.onboarding}/:step',
        builder: (context, state) {
          final step = int.tryParse(state.pathParameters['step'] ?? '') ?? 1;
          return OnboardingScreen(step: step.clamp(1, 3));
        },
      ),
      GoRoute(
        path: GpsRoutes.authWelcome,
        builder: (context, state) => const AuthWelcomeScreen(),
      ),
      GoRoute(
        path: GpsRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: GpsRoutes.registerNin,
        builder: (context, state) => const RegisterNinScreen(),
      ),
      GoRoute(
        path: GpsRoutes.registerFullName,
        builder: (context, state) => const RegisterFullNameScreen(),
      ),
      GoRoute(
        path: GpsRoutes.registerPhone,
        builder: (context, state) => const RegisterPhoneScreen(),
      ),
      GoRoute(
        path: GpsRoutes.registerOtp,
        builder: (context, state) => const RegisterOtpScreen(),
      ),
      GoRoute(
        path: GpsRoutes.registerPassword,
        builder: (context, state) => const RegisterPasswordScreen(),
      ),
      GoRoute(
        path: GpsRoutes.registerConsent,
        builder: (context, state) => const RegisterConsentScreen(),
      ),
      GoRoute(
        path: GpsRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: GpsRoutes.resetPassword,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: GpsRoutes.biometricSetup,
        builder: (context, state) => const BiometricSetupScreen(),
      ),
      GoRoute(
        path: GpsRoutes.registrationSuccess,
        builder: (context, state) => const RegistrationSuccessScreen(),
      ),
      GoRoute(
        path: SpecialistRoutes.verificationPending,
        builder: (context, state) => const VerificationPendingScreen(),
      ),
      GoRoute(
        path: SpecialistRoutes.credentials,
        builder: (context, state) => const CredentialsSubmissionScreen(),
      ),
      GoRoute(
        path: SpecialistRoutes.profileEdit,
        builder: (context, state) => const SpecialistProfileEditScreen(),
      ),
      GoRoute(
        path: SpecialistRoutes.shell,
        builder: (context, state) => const SpecialistShellScreen(),
      ),
      if (kDebugMode)
        GoRoute(
          path: GpsRoutes.designSystemShowcase,
          builder: (context, state) => const DesignSystemShowcaseScreen(),
        ),
    ],
  );
}
