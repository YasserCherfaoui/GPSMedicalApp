import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'features/verification/specialist_verification_lifecycle.dart';
import 'routing/specialist_router.provider.dart';

const _appInfo = GpsMedicalAppInfo(
  displayName: 'GPS Médical — Spécialiste',
  clientKind: GpsMedicalClientKind.specialist,
);

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  const sentryDsn = String.fromEnvironment('SENTRY_DSN');
  final bootstrap = await bootstrapGpsMedicalApp();

  final app = ProviderScope(
    overrides: [
      appInfoProvider.overrideWithValue(_appInfo),
      tokenStoreProvider.overrideWithValue(bootstrap.tokenStore),
      appLaunchPreferencesProvider.overrideWithValue(
        bootstrap.launchPreferences,
      ),
    ],
    child: const SpecialistApp(),
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

class SpecialistApp extends ConsumerStatefulWidget {
  const SpecialistApp({super.key});

  @override
  ConsumerState<SpecialistApp> createState() => _SpecialistAppState();
}

class _SpecialistAppState extends ConsumerState<SpecialistApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(specialistRouterProvider);

    return SpecialistVerificationLifecycle(
      child: GpsMedicalMaterialApp(
        title: _appInfo.displayName,
        routerConfig: router,
      ),
    );
  }
}
