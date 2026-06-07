import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Placeholder until task 8.6 (signed URL download + inline viewer).
class MedicalRecordViewerScreen extends StatelessWidget {
  const MedicalRecordViewerScreen({
    super.key,
    required this.documentId,
    this.title,
  });

  final String documentId;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? l10n.medicalRecordsTitle),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(GpsSpacing.lg),
          child: Text(
            l10n.medicalRecordViewerPlaceholder,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
