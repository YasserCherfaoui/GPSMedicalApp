import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:path_provider/path_provider.dart';
import 'package:patient_app/features/booking/widgets/booking_draft_resume_listener.dart';
import 'package:patient_app/features/notifications/widgets/push_notifications_bootstrap.dart';
import 'package:patient_app/firebase/init_firebase.dart';
import 'package:patient_app/routing/patient_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

const _appInfo = GpsMedicalAppInfo(
  displayName: 'Medora — Patient',
  clientKind: GpsMedicalClientKind.patient,
);

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureGpsImageCache();

  const sentryDsn = String.fromEnvironment('SENTRY_DSN');
  final results = await Future.wait([
    initPatientFirebase(),
    bootstrapGpsMedicalApp(),
    _openDeviceVault(),
  ]);
  final bootstrap = results[1] as AppBootstrapData;
  final vault = results[2] as DeviceVault;

  final app = ProviderScope(
    overrides: [
      appInfoProvider.overrideWithValue(_appInfo),
      tokenStoreProvider.overrideWithValue(bootstrap.tokenStore),
      appLaunchPreferencesProvider.overrideWithValue(
        bootstrap.launchPreferences,
      ),
      deviceVaultProvider.overrideWithValue(vault),
      gpsRouterProvider.overrideWith((ref) {
        final auth = ref.read(authSessionProvider);
        final appInfo = ref.watch(appInfoProvider);
        final launchPreferences = ref.read(appLaunchPreferencesProvider);
        return createPatientRouter(
          authListenable: auth,
          appInfo: appInfo,
          launchPreferences: launchPreferences,
        );
      }),
    ],
    child: const PatientApp(),
  );

  if (sentryDsn.isNotEmpty) {
    await SentryFlutter.init((options) {
      options.dsn = sentryDsn;
      options.tracesSampleRate = 1.0;
    }, appRunner: () => runApp(app));
  } else {
    runApp(app);
  }
}

Future<DeviceVault> _openDeviceVault() async {
  final docs = await getApplicationDocumentsDirectory();
  return EncryptedHiveDeviceVault.open(
    root: Directory('${docs.path}/device_vault'),
    keys: SecureStorageVaultKeyStore(),
  );
}

class PatientApp extends ConsumerStatefulWidget {
  const PatientApp({super.key});

  @override
  ConsumerState<PatientApp> createState() => _PatientAppState();
}

class _PatientAppState extends ConsumerState<PatientApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(gpsRouterProvider);

    return PushNotificationsBootstrap(
      child: MessagingRealtimeLifecycle(
        child: BookingDraftResumeListener(
          navigatorKey: patientRootNavigatorKey,
          child: GpsMedicalMaterialApp(
            title: _appInfo.displayName,
            routerConfig: router,
          ),
        ),
      ),
    );
  }
}
