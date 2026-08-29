import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../anamnesis/models/anamnesis_models.dart';
import '../../anamnesis/providers/anamnesis_providers.dart';
import '../../anamnesis/repositories/anamnesis_repository.dart';
import '../../anamnesis/screens/anamnesis_extraction_review_screen.dart';

/// OCR status + actions on the medical-record viewer (Dossier médical).
class MedicalRecordOcrSection extends ConsumerStatefulWidget {
  const MedicalRecordOcrSection({required this.documentId, super.key});

  final String documentId;

  @override
  ConsumerState<MedicalRecordOcrSection> createState() =>
      _MedicalRecordOcrSectionState();
}

class _MedicalRecordOcrSectionState
    extends ConsumerState<MedicalRecordOcrSection> {
  AnamnesisDocumentExtraction? _ext;
  var _loading = true;
  var _busy = false;
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
    final status = _ext?.status;
    if (status != 'queued' && status != 'processing') return;
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
      final ext = await ref
          .read(anamnesisRepositoryProvider)
          .fetchDocumentExtraction(widget.documentId);
      if (!mounted) return;
      setState(() {
        _ext = ext;
        _loading = false;
        _error = null;
      });
      _schedulePoll();
    } on AnamnesisApiException catch (e) {
      if (!mounted) return;
      if (e.statusCode == 404) {
        setState(() {
          _ext = null;
          _loading = false;
          _error = null;
        });
        return;
      }
      setState(() {
        _loading = false;
        _error = e.message;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = e.toString();
      });
    }
  }

  Future<void> _enqueue() async {
    setState(() => _busy = true);
    try {
      final ext = await ref
          .read(anamnesisRepositoryProvider)
          .enqueueMedicalDocumentExtraction(widget.documentId);
      if (!mounted) return;
      setState(() {
        _ext = ext;
        _busy = false;
      });
      _schedulePoll();
    } catch (e) {
      if (!mounted) return;
      setState(() => _busy = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  Future<void> _openReview() async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => AnamnesisExtractionReviewScreen(
          documentId: widget.documentId,
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
    final theme = Theme.of(context);

    return GpsCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.medicalRecordsOcrTitle,
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: GpsSpacing.xs),
          Text(
            l10n.medicalRecordsOcrHint,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GpsSpacing.sm),
          if (_loading)
            const LinearProgressIndicator()
          else if (_error != null)
            Text(_error!, style: TextStyle(color: theme.colorScheme.error))
          else if (_ext == null)
            FilledButton.tonalIcon(
              onPressed: _busy ? null : () => unawaited(_enqueue()),
              icon: const Icon(Icons.document_scanner_outlined),
              label: Text(l10n.medicalRecordsOcrStart),
            )
          else ...[
            Text(_statusLabel(l10n, _ext!.status)),
            if (_ext!.status == 'queued' || _ext!.status == 'processing') ...[
              const SizedBox(height: GpsSpacing.sm),
              const LinearProgressIndicator(),
            ],
            if (_ext!.status == 'extracted') ...[
              const SizedBox(height: GpsSpacing.sm),
              FilledButton(
                onPressed: () => unawaited(_openReview()),
                child: Text(l10n.anamnesisDocsReview),
              ),
            ],
            if (_ext!.status == 'failed') ...[
              const SizedBox(height: GpsSpacing.sm),
              if (_ext!.errorMessage != null)
                Text(
                  _ext!.errorMessage!,
                  style: theme.textTheme.bodySmall,
                ),
              FilledButton.tonal(
                onPressed: _busy ? null : () => unawaited(_enqueue()),
                child: Text(l10n.medicalRecordsOcrRetry),
              ),
            ],
          ],
        ],
      ),
    );
  }
}
