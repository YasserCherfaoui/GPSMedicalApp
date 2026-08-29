import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/anamnesis_providers.dart';

/// Patient correction UX — never overwrites raw OCR / structured fields.
class AnamnesisExtractionReviewScreen extends ConsumerStatefulWidget {
  const AnamnesisExtractionReviewScreen({
    required this.documentId,
    this.title,
    super.key,
  });

  final String documentId;
  final String? title;

  @override
  ConsumerState<AnamnesisExtractionReviewScreen> createState() =>
      _AnamnesisExtractionReviewScreenState();
}

class _AnamnesisExtractionReviewScreenState
    extends ConsumerState<AnamnesisExtractionReviewScreen> {
  final _examType = TextEditingController();
  final _examDate = TextEditingController();
  final _bodyRegion = TextEditingController();
  final _facility = TextEditingController();
  final _findings = TextEditingController();
  final _notes = TextEditingController();

  var _loading = true;
  var _saving = false;
  String? _error;
  String? _rawOcr;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _examType.dispose();
    _examDate.dispose();
    _bodyRegion.dispose();
    _facility.dispose();
    _findings.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final ext = await ref
          .read(anamnesisRepositoryProvider)
          .fetchDocumentExtraction(widget.documentId);
      final corr = ext.corrections;
      final structured = ext.structured;
      _examType.text = (corr?['exam_type'] as String?) ??
          structured?.examType ??
          '';
      _examDate.text = (corr?['exam_date'] as String?) ??
          structured?.examDate ??
          '';
      _bodyRegion.text = (corr?['body_region'] as String?) ??
          structured?.bodyRegion ??
          '';
      _facility.text =
          (corr?['facility'] as String?) ?? structured?.facility ?? '';
      final findings = (corr?['key_findings'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          structured?.keyFindings ??
          const [];
      _findings.text = findings.join('\n');
      _notes.text = corr?['notes'] as String? ?? '';
      _rawOcr = ext.rawOcrText;
      if (!mounted) return;
      setState(() => _loading = false);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _saving = true);
    try {
      final findings = _findings.text
          .split('\n')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
      await ref.read(anamnesisRepositoryProvider).patchDocumentExtraction(
            documentId: widget.documentId,
            corrections: {
              if (_examType.text.trim().isNotEmpty)
                'exam_type': _examType.text.trim(),
              if (_examDate.text.trim().isNotEmpty)
                'exam_date': _examDate.text.trim(),
              if (_bodyRegion.text.trim().isNotEmpty)
                'body_region': _bodyRegion.text.trim(),
              if (_facility.text.trim().isNotEmpty)
                'facility': _facility.text.trim(),
              if (findings.isNotEmpty) 'key_findings': findings,
              if (_notes.text.trim().isNotEmpty) 'notes': _notes.text.trim(),
            },
          );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.anamnesisDocsCorrectionsSaved)),
      );
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title?.isNotEmpty == true
            ? widget.title!
            : l10n.anamnesisDocsReviewTitle),
      ),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(GpsSpacing.md),
                      child: Text(_error!, textAlign: TextAlign.center),
                    ),
                  )
                : ListView(
                    padding: const EdgeInsets.all(GpsSpacing.md),
                    children: [
                      Text(
                        l10n.anamnesisDocsReviewHint,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                      const SizedBox(height: GpsSpacing.md),
                      TextField(
                        controller: _examType,
                        decoration: InputDecoration(
                          labelText: l10n.anamnesisDocsFieldExamType,
                        ),
                      ),
                      const SizedBox(height: GpsSpacing.sm),
                      TextField(
                        controller: _examDate,
                        decoration: InputDecoration(
                          labelText: l10n.anamnesisDocsFieldExamDate,
                          hintText: 'YYYY-MM-DD',
                        ),
                      ),
                      const SizedBox(height: GpsSpacing.sm),
                      TextField(
                        controller: _bodyRegion,
                        decoration: InputDecoration(
                          labelText: l10n.anamnesisDocsFieldBodyRegion,
                        ),
                      ),
                      const SizedBox(height: GpsSpacing.sm),
                      TextField(
                        controller: _facility,
                        decoration: InputDecoration(
                          labelText: l10n.anamnesisDocsFieldFacility,
                        ),
                      ),
                      const SizedBox(height: GpsSpacing.sm),
                      TextField(
                        controller: _findings,
                        minLines: 3,
                        maxLines: 6,
                        decoration: InputDecoration(
                          labelText: l10n.anamnesisDocsFieldFindings,
                          alignLabelWithHint: true,
                        ),
                      ),
                      const SizedBox(height: GpsSpacing.sm),
                      TextField(
                        controller: _notes,
                        minLines: 2,
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: l10n.anamnesisDocsFieldNotes,
                          alignLabelWithHint: true,
                        ),
                      ),
                      if (_rawOcr != null && _rawOcr!.trim().isNotEmpty) ...[
                        const SizedBox(height: GpsSpacing.lg),
                        Text(
                          l10n.anamnesisDocsRawOcr,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: GpsSpacing.xs),
                        Text(
                          _rawOcr!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                      const SizedBox(height: GpsSpacing.lg),
                      FilledButton(
                        onPressed: _saving ? null : _save,
                        child: _saving
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(l10n.anamnesisDocsSaveCorrections),
                      ),
                    ],
                  ),
      ),
    );
  }
}
