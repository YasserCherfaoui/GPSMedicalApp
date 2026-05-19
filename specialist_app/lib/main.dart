import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

const _appInfo = GpsMedicalAppInfo(
  displayName: 'GPS Médical — Spécialiste',
  clientKind: GpsMedicalClientKind.specialist,
);

void main() {
  runApp(
    ProviderScope(
      overrides: [appInfoProvider.overrideWithValue(_appInfo)],
      child: const SpecialistApp(),
    ),
  );
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
