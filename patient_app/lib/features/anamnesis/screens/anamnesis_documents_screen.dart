import 'dart:async';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:image_picker/image_picker.dart';

import '../../medical_records/providers/medical_records_repositories.provider.dart';
import '../../medical_records/utils/medical_record_validation.dart';
import '../../medical_records/utils/medical_records_api_error.dart';
import '../models/anamnesis_models.dart';
import '../providers/anamnesis_providers.dart';
import 'anamnesis_extraction_review_screen.dart';

/// A-24.1 — attach IRM/Radio/bio to the anamnesis session and poll OCR.
class AnamnesisDocumentsScreen extends ConsumerStatefulWidget {
  const AnamnesisDocumentsScreen({required this.sessionId, super.key});

  final String sessionId;

  @override
  ConsumerState<AnamnesisDocumentsScreen> createState() =>
      _AnamnesisDocumentsScreenState();
}

class _AnamnesisDocumentsScreenState
    extends ConsumerState<AnamnesisDocumentsScreen> {
  final _imagePicker = ImagePicker();
  List<AnamnesisSessionDocument> _docs = const [];
  var _loading = true;
  var _uploading = false;
  String? _error;
  Timer? _poll;

  @override
  void initState() {
    super.initState();
    unawaited(_refresh());
  }

  @override
  void dispose() {
    _poll?.cancel();
    super.dispose();
  }

  void _schedulePoll() {
    _poll?.cancel();
    final pending = _docs.any((d) => !d.isTerminal);
    if (!pending) return;
    _poll = Timer(const Duration(seconds: 2), () {
      if (mounted) unawaited(_refresh(silent: true));
    });
  }

  Future<void> _refresh({bool silent = false}) async {
    if (!silent) {
      setState(() {
        _loading = true;
        _error = null;
      });
    }
    try {
      final docs = await ref
          .read(anamnesisRepositoryProvider)
          .listSessionDocuments(widget.sessionId);
      if (!mounted) return;
      setState(() {
        _docs = docs;
        _loading = false;
      });
      _schedulePoll();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  Future<void> _pickAndUpload({
    required bool fromCamera,
    bool fromGallery = false,
  }) async {
    final l10n = AppLocalizations.of(context)!;
    Uint8List? bytes;
    var fileName = 'document.jpg';

    if (fromCamera) {
      final shot = await _imagePicker.pickImage(source: ImageSource.camera);
      if (shot == null) return;
      bytes = await shot.readAsBytes();
      fileName = shot.name;
    } else if (fromGallery) {
      final shot = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (shot == null) return;
      bytes = await shot.readAsBytes();
      fileName = shot.name;
    } else {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: const ['pdf', 'jpg', 'jpeg', 'png'],
        withData: true,
      );
      if (result == null || result.files.isEmpty) return;
      final file = result.files.first;
      bytes = file.bytes;
      fileName = file.name;
    }
    if (bytes == null) return;

    final validationError = validateMedicalRecordFileBytes(
      bytes: bytes,
      l10n: l10n,
    );
    if (validationError != null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(validationError)),
      );
      return;
    }
    final mime = detectMedicalRecordMimeType(bytes)!;

    setState(() => _uploading = true);
    try {
      final uploaded = await ref.read(medicalRecordsRepositoryProvider).upload(
            bytes: bytes,
            fileName: fileName,
            mimeType: mime,
            type: MedicalDocumentTypeEnum.imaging,
            title: fileName,
          );
      final documentId = uploaded.id;
      if (documentId == null || documentId.isEmpty) {
        throw StateError('Upload returned empty document id');
      }
      await ref.read(anamnesisRepositoryProvider).attachSessionDocument(
            sessionId: widget.sessionId,
            documentId: documentId,
          );
      if (!mounted) return;
      await _refresh();
    } on MedicalRecordsStorageUnavailableException {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.medicalRecordUploadStorageUnavailable)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      if (mounted) setState(() => _uploading = false);
    }
  }

  Future<void> _openReview(AnamnesisSessionDocument doc) async {
    if (doc.extractionStatus != 'extracted') return;
    await Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => AnamnesisExtractionReviewScreen(
          documentId: doc.documentId,
          title: doc.title,
        ),
      ),
    );
    if (mounted) unawaited(_refresh(silent: true));
  }

  String _statusLabel(AppLocalizations l10n, String status) {
    return switch (status) {
      'queued' => l10n.anamnesisDocsStatusQueued,
      'processing' => l10n.anamnesisDocsStatusProcessing,
      'extracted' => l10n.anamnesisDocsStatusExtracted,
      'failed' => l10n.anamnesisDocsStatusFailed,
      _ => status,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.anamnesisDocsTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(GpsSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.anamnesisDocsHint,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: GpsSpacing.md),
              Wrap(
                spacing: GpsSpacing.sm,
                runSpacing: GpsSpacing.sm,
                children: [
                  OutlinedButton.icon(
                    onPressed: _uploading
                        ? null
                        : () => unawaited(_pickAndUpload(fromCamera: true)),
                    icon: const Icon(Icons.photo_camera_outlined),
                    label: Text(l10n.anamnesisDocsCamera),
                  ),
                  OutlinedButton.icon(
                    onPressed: _uploading
                        ? null
                        : () => unawaited(
                              _pickAndUpload(
                                fromCamera: false,
                                fromGallery: true,
                              ),
                            ),
                    icon: const Icon(Icons.photo_library_outlined),
                    label: Text(l10n.anamnesisDocsGallery),
                  ),
                  OutlinedButton.icon(
                    onPressed: _uploading
                        ? null
                        : () => unawaited(_pickAndUpload(fromCamera: false)),
                    icon: const Icon(Icons.upload_file_outlined),
                    label: Text(l10n.anamnesisDocsPickFile),
                  ),
                ],
              ),
              if (_uploading) ...[
                const SizedBox(height: GpsSpacing.md),
                const LinearProgressIndicator(),
              ],
              const SizedBox(height: GpsSpacing.lg),
              Expanded(child: _buildList(l10n)),
              PrimaryButton(
                label: l10n.anamnesisDone,
                onPressed: () => context.go(GpsRoutes.discover),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildList(AppLocalizations l10n) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: GpsSpacing.md),
            SecondaryButton(
              label: l10n.anamnesisRetry,
              onPressed: () => unawaited(_refresh()),
            ),
          ],
        ),
      );
    }
    if (_docs.isEmpty) {
      return Center(
        child: Text(
          l10n.anamnesisDocsEmpty,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }
    return ListView.separated(
      itemCount: _docs.length,
      separatorBuilder: (_, __) => const SizedBox(height: GpsSpacing.sm),
      itemBuilder: (context, index) {
        final doc = _docs[index];
        final canReview = doc.extractionStatus == 'extracted';
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(doc.title?.isNotEmpty == true
              ? doc.title!
              : l10n.anamnesisDocsUntitled),
          subtitle: Text(_statusLabel(l10n, doc.extractionStatus)),
          trailing: canReview
              ? TextButton(
                  onPressed: () => unawaited(_openReview(doc)),
                  child: Text(l10n.anamnesisDocsReview),
                )
              : (!doc.isTerminal
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : null),
          onTap: canReview ? () => unawaited(_openReview(doc)) : null,
        );
      },
    );
  }
}
