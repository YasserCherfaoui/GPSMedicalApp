import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/patient_records.provider.dart';

bool _isPdf(String? mimeType) => mimeType?.toLowerCase() == 'application/pdf';

bool _isImage(String? mimeType) {
  final mime = mimeType?.toLowerCase() ?? '';
  return mime == 'image/jpeg' || mime == 'image/png';
}

class SpecialistMedicalRecordViewerScreen extends ConsumerWidget {
  const SpecialistMedicalRecordViewerScreen({
    required this.documentId,
    this.title,
    super.key,
  });

  final String documentId;
  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final viewerAsync = ref.watch(
      specialistMedicalRecordViewerProvider(documentId),
    );

    return viewerAsync.when(
      loading: () => Scaffold(
        appBar: AppBar(title: Text(title ?? l10n.medicalRecordsTitle)),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => Scaffold(
        appBar: AppBar(title: Text(title ?? l10n.medicalRecordsTitle)),
        body: ErrorState(
          title: l10n.medicalRecordViewerLoadError,
          onRetry: () =>
              ref.invalidate(specialistMedicalRecordViewerProvider(documentId)),
        ),
      ),
      data: (state) {
        final document = state.document;
        final bytes = Uint8List.fromList(state.bytes);
        final screenTitle = title ??
            (document.title?.trim().isNotEmpty == true
                ? document.title!.trim()
                : l10n.medicalRecordsTitle);

        return Scaffold(
          appBar: AppBar(title: Text(screenTitle)),
          body: _RecordBody(document: document, bytes: bytes),
        );
      },
    );
  }
}

class _RecordBody extends StatelessWidget {
  const _RecordBody({required this.document, required this.bytes});

  final MedicalDocument document;
  final Uint8List bytes;

  @override
  Widget build(BuildContext context) {
    final mime = document.mimeType;
    if (_isPdf(mime)) {
      return PDFView(
        pdfData: bytes,
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: true,
        pageFling: true,
      );
    }
    if (_isImage(mime)) {
      return InteractiveViewer(
        child: Center(child: Image.memory(bytes, fit: BoxFit.contain)),
      );
    }
    return Center(
      child: Text(AppLocalizations.of(context)!.medicalRecordViewerPlaceholder),
    );
  }
}
