import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../features/booking/screens/appointment_detail_screen.dart';
import '../features/booking/screens/appointments_list_screen.dart';
import '../features/booking/screens/availability_calendar_screen.dart';
import '../features/booking/screens/booking_flow_screen.dart';
import '../features/dashboard/screens/patient_dashboard_screen.dart';
import '../features/profile/screens/patient_profile_screen.dart';
import '../features/profile/screens/patient_profile_edit_screen.dart';
import '../features/profile/screens/consent_management_screen.dart';
import '../features/profile/screens/dependent_form_screen.dart';
import '../features/profile/screens/dependents_list_screen.dart';
import '../features/profile/screens/consent_revoked_screen.dart';
import '../features/profile/screens/profile_account_screen.dart';
import '../features/medical_records/screens/medical_record_viewer_screen.dart';
import '../features/medical_records/screens/medical_records_list_screen.dart';
import '../features/discovery/screens/doctor_detail_screen.dart';
import '../features/discovery/screens/doctor_list_screen.dart';
import '../features/discovery/screens/doctor_search_screen.dart';
import '../features/discovery/screens/nearby_doctors_map_screen.dart';

/// Root navigator for app-wide overlays (e.g. offline draft resume snackbar).
final patientRootNavigatorKey = GlobalKey<NavigatorState>();

/// Configures GoRouter for the Patient Application, embedding Shell and Discovery routes.
GoRouter createPatientRouter({
  required AuthSessionNotifier authListenable,
  required GpsMedicalAppInfo appInfo,
  required AppLaunchPreferences launchPreferences,
}) {
  AuthSession sessionOf() => authListenable.session;

  return GoRouter(
    navigatorKey: patientRootNavigatorKey,
    initialLocation: GpsRoutes.splash,
    refreshListenable: authListenable,
    redirect: (context, state) {
      return resolveGpsRedirect(
        session: sessionOf(),
        matchedLocation: state.matchedLocation,
        onboardingCompleted: launchPreferences.onboardingCompleted,
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

      // Top-level full screen routes
      GoRoute(
        path: GpsRoutes.search,
        builder: (context, state) => const DoctorSearchScreen(),
      ),
      GoRoute(
        path: '/doctors/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          final openBooking = state.uri.queryParameters['book'] == 'true';
          return DoctorDetailScreen(
            doctorId: id,
            openBooking: openBooking,
          );
        },
      ),
      GoRoute(
        path: '/doctors/:id/book',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          final mode = state.uri.queryParameters['mode'] ?? 'both';
          final rescheduleId = state.uri.queryParameters['reschedule'];
          return AvailabilityCalendarScreen(
            doctorId: id,
            modeFilter: mode,
            rescheduleAppointmentId: rescheduleId,
          );
        },
      ),
      GoRoute(
        path: GpsRoutes.booking,
        builder: (context, state) => const BookingFlowScreen(),
      ),
      GoRoute(
        path: GpsRoutes.profileEdit,
        builder: (context, state) => const PatientProfileEditScreen(),
      ),
      GoRoute(
        path: GpsRoutes.profileAccount,
        builder: (context, state) => const ProfileAccountScreen(),
      ),
      GoRoute(
        path: GpsRoutes.profileConsents,
        builder: (context, state) => const ConsentManagementScreen(),
      ),
      GoRoute(
        path: GpsRoutes.consentRevoked,
        builder: (context, state) => const ConsentRevokedScreen(),
      ),
      GoRoute(
        path: GpsRoutes.profileDependents,
        builder: (context, state) => const DependentsListScreen(),
      ),
      GoRoute(
        path: GpsRoutes.profileDependentNew,
        builder: (context, state) => const DependentFormScreen(),
      ),
      GoRoute(
        path: '/profile/dependents/:id/edit',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return DependentFormScreen(dependentId: id);
        },
      ),
      GoRoute(
        path: GpsRoutes.medicalRecords,
        builder: (context, state) => const MedicalRecordsListScreen(),
      ),
      GoRoute(
        path: '/medical-records/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          final title = state.uri.queryParameters['title'];
          return MedicalRecordViewerScreen(
            documentId: id,
            title: title,
          );
        },
      ),
      GoRoute(
        path: '/appointments/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return AppointmentDetailScreen(appointmentId: id);
        },
      ),

      // Dashboard shell route
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return PatientDashboardScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: GpsRoutes.discover,
                builder: (context, state) => const DoctorListScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: GpsRoutes.map,
                builder: (context, state) => const NearbyDoctorsMapScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: GpsRoutes.appointments,
                builder: (context, state) => const AppointmentsListScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: GpsRoutes.profile,
                builder: (context, state) => const PatientProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
