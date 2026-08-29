import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/bilan_providers.dart';
import '../repositories/bilan_repository.dart';

class BilanDetailScreen extends ConsumerWidget {
  const BilanDetailScreen({required this.bilanId, super.key});

  final String bilanId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final detailAsync = ref.watch(bilanDetailProvider(bilanId));

    return Scaffold(
      appBar: AppBar(title: Text(l10n.bilanDetailTitle)),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text(l10n.bilanLoadError)),
        data: (bilan) {
          return ListView(
            padding: const EdgeInsets.all(GpsSpacing.lg),
            children: [
              Text(
                l10n.bilanScoreLabel(bilan.finalScore.round()),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: GpsSpacing.md),
              Text(
                l10n.bilanSummarySection,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: GpsSpacing.sm),
              Text(bilan.summaryFr),
              const SizedBox(height: GpsSpacing.lg),
              Text(
                l10n.bilanOrientationSection,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: GpsSpacing.sm),
              Text(bilan.orientationFr),
              const SizedBox(height: GpsSpacing.lg),
              Text(
                bilan.disclaimerFr,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
              ),
              const SizedBox(height: GpsSpacing.xl),
              if (bilan.pdfDocumentId != null)
                FilledButton.tonal(
                  onPressed: () => _openPdf(context, ref, bilanId),
                  child: Text(l10n.bilanExportPdf),
                ),
              const SizedBox(height: GpsSpacing.sm),
              FilledButton(
                onPressed: () =>
                    context.push(GpsRoutes.bilanTransmit(bilanId)),
                child: Text(l10n.bilanTransmitCta),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _openPdf(
    BuildContext context,
    WidgetRef ref,
    String id,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      final repo = ref.read(bilanRepositoryProvider);
      final pdf = await repo.getPdfDownload(id);
      final uri = Uri.parse(pdf.downloadUrl);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.bilanPdfOpenError)),
          );
        }
      }
    } on BilanApiException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    }
  }
}
