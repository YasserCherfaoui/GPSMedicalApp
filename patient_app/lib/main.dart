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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0A2540)),
        useMaterial3: true,
      ),
      home: const _BootstrapScreen(appInfo: _appInfo),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Patient app — Phase 1 scaffolding',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'API client: ${client.v1BaseUrl}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Shared model: HealthCheck.status = ${healthStatus.name}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
