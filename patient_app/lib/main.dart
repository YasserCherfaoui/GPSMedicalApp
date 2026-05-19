import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

const _appInfo = GpsMedicalAppInfo(
  displayName: 'GPS Médical — Patient',
  clientKind: GpsMedicalClientKind.patient,
);

void main() {
  runApp(const PatientApp());
}

class PatientApp extends StatelessWidget {
  const PatientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appInfo.displayName,
      theme: GpsTheme.light(),
      darkTheme: GpsTheme.dark(),
      themeMode: ThemeMode.system,
      home: const DesignSystemShowcaseLauncher(
        child: _BootstrapScreen(appInfo: _appInfo),
      ),
    );
  }
}

class _BootstrapScreen extends StatelessWidget {
  const _BootstrapScreen({required this.appInfo});

  final GpsMedicalAppInfo appInfo;

  @override
  Widget build(BuildContext context) {
    final client = GpsMedicalClient(tokenStore: InMemoryTokenStore());
    const healthStatus = HealthCheckStatusEnum.ok;

    return Scaffold(
      appBar: AppBar(title: Text(appInfo.displayName)),
      body: Padding(
        padding: const EdgeInsets.all(GpsSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GpsCard(
              showAccentBorder: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Patient app — Phase 1 scaffolding',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: GpsSpacing.sm),
                  Text(
                    'API: ${client.v1BaseUrl}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'HealthCheck.status = ${healthStatus.name}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GpsSpacing.lg),
            PrimaryButton(label: 'Se connecter', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
