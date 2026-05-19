import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

const _appInfo = GpsMedicalAppInfo(
  displayName: 'GPS Médical — Patient',
  clientKind: GpsMedicalClientKind.patient,
);

void main() {
  runApp(
    ProviderScope(
      overrides: [appInfoProvider.overrideWithValue(_appInfo)],
      child: const PatientApp(),
    ),
  );
}

class PatientApp extends ConsumerWidget {
  const PatientApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(gpsRouterProvider);

    return GpsMedicalMaterialApp(
      title: _appInfo.displayName,
      routerConfig: router,
    );
  }
}
