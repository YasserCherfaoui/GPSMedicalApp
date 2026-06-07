import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../profile/providers/patient_profile.provider.dart';
import '../providers/medical_record_viewer.provider.dart';
import '../providers/medical_records_list.provider.dart';
import '../providers/medical_records_repositories.provider.dart';
import '../utils/medical_record_download.dart';

class MedicalRecordViewerScreen extends ConsumerWidget {
  const MedicalRecordViewerScreen({
    super.key,
    required this.documentId,
    this.title,
  });

  final String documentId;
  final String? title;

  Future<void> _saveToDownloads(
    BuildContext context,
    MedicalDocument document,
    Uint8List bytes,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final fileName = medicalRecordDownloadFileName(document);
    Directory? directory = await getDownloadsDirectory();
    directory ??= await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.medicalRecordDownloadSuccess)),
    );
  }

  Future<void> _shareDocument(
    BuildContext context,
    MedicalDocument document,
    Uint8List bytes,
  ) async {
    final fileName = medicalRecordDownloadFileName(document);
    await Share.shareXFiles(
      [
        XFile.fromData(
          bytes,
          name: fileName,
          mimeType: document.mimeType,
        ),
      ],
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.medicalRecordDeleteTitle),
        content: Text(l10n.medicalRecordDeleteMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.mapNearbyPermissionRationaleCancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.medicalRecordDeleteConfirm),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;

    try {
      await ref.read(medicalRecordsRepositoryProvider).delete(documentId);
      ref.read(medicalRecordsListProvider.notifier).removeDocument(documentId);
      if (!context.mounted) return;
      context.pop();
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.medicalRecordDeleteError)),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final viewerAsync = ref.watch(medicalRecordViewerProvider(documentId));
    final profileAsync = ref.watch(patientProfileProvider);

    return viewerAsync.when(
      loading: () => Scaffold(
        appBar: AppBar(title: Text(title ?? l10n.medicalRecordsTitle)),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => Scaffold(
        appBar: AppBar(title: Text(title ?? l10n.medicalRecordsTitle)),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.medicalRecordViewerLoadError),
              const SizedBox(height: GpsSpacing.md),
              FilledButton(
                onPressed: () => ref
                    .read(medicalRecordViewerProvider(documentId).notifier)
                    .refresh(),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
      data: (state) {
        final document = state.document;
        final currentUserId = profileAsync.valueOrNull?.id;
        final canDelete =
            currentUserId != null && document.authorId == currentUserId;
        final screenTitle = title ?? document.title ?? l10n.medicalRecordsTitle;

        return Scaffold(
          appBar: AppBar(
            title: Text(screenTitle),
            actions: [
              IconButton(
                tooltip: l10n.medicalRecordDownload,
                icon: const Icon(Icons.download_outlined),
                onPressed: () => _saveToDownloads(context, document, state.bytes),
              ),
              IconButton(
                tooltip: l10n.medicalRecordShare,
                icon: const Icon(Icons.share_outlined),
                onPressed: () => _shareDocument(context, document, state.bytes),
              ),
              if (canDelete)
                IconButton(
                  tooltip: l10n.medicalRecordDeleteConfirm,
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => _confirmDelete(context, ref, l10n),
                ),
            ],
          ),
          body: _DocumentBody(
            mimeType: document.mimeType,
            bytes: state.bytes,
          ),
        );
      },
    );
  }
}

class _DocumentBody extends StatelessWidget {
  const _DocumentBody({
    required this.mimeType,
    required this.bytes,
  });

  final String? mimeType;
  final Uint8List bytes;

  @override
  Widget build(BuildContext context) {
    if (isMedicalRecordImageMime(mimeType)) {
      return InteractiveViewer(
        minScale: 0.5,
        maxScale: 4,
        child: Center(
          child: Image.memory(bytes, fit: BoxFit.contain),
        ),
      );
    }

    if (isMedicalRecordPdfMime(mimeType)) {
      return PDFView(
        pdfData: bytes,
        enableSwipe: true,
        swipeHorizontal: false,
        fitPolicy: FitPolicy.BOTH,
      );
    }

    return Center(
      child: Text(AppLocalizations.of(context)!.medicalRecordUploadInvalidMime),
    );
  }
}
