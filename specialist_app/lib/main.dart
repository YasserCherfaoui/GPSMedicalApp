import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

const _appInfo = GpsMedicalAppInfo(
  displayName: 'GPS Médical — Spécialiste',
  clientKind: GpsMedicalClientKind.specialist,
);

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  const sentryDsn = String.fromEnvironment('SENTRY_DSN');

  final app = ProviderScope(
    overrides: [appInfoProvider.overrideWithValue(_appInfo)],
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

class SpecialistApp extends ConsumerWidget {
  const SpecialistApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(gpsRouterProvider);

    return GpsMedicalMaterialApp(
      title: _appInfo.displayName,
      routerConfig: router,
    );
  }
}
