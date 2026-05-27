import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../auth/auth_session.dart';
import '../auth/auth_session.notifier.dart';
import '../models/app_info.dart';
import '../screens/auth_welcome_screen.dart';
import '../screens/language_screen.dart';
import '../screens/login_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/profile_placeholder_screen.dart';
import '../screens/register_flow_screens.dart';
import '../screens/splash_screen.dart';
import '../widgets/design_system_showcase.dart';
import 'gps_redirect.dart';
import 'gps_routes.dart';

/// Builds the Phase 1 [GoRouter] with auth guards.
GoRouter createGpsRouter({
  required AuthSessionNotifier authListenable,
  required GpsMedicalAppInfo appInfo,
}) {
  AuthSession sessionOf() => authListenable.session;

  return GoRouter(
    initialLocation: GpsRoutes.splash,
    refreshListenable: authListenable,
    redirect: (context, state) {
      return resolveGpsRedirect(
        session: sessionOf(),
        matchedLocation: state.matchedLocation,
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
        path: GpsRoutes.profile,
        builder: (context, state) => ProfilePlaceholderScreen(appInfo: appInfo),
      ),
      if (kDebugMode)
        GoRoute(
          path: GpsRoutes.designSystemShowcase,
          builder: (context, state) => const DesignSystemShowcaseScreen(),
        ),
    ],
  );
}
