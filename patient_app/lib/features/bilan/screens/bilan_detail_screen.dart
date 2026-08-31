import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../payments/repositories/freemium_payments_repository.dart';
import '../../payments/widgets/freemium_upgrade_sheet.dart';
import '../models/bilan_models.dart';
import '../providers/bilan_providers.dart';
import '../repositories/bilan_repository.dart';

class BilanDetailScreen extends ConsumerWidget {
  const BilanDetailScreen({required this.bilanId, super.key});

  final String bilanId;

  Future<void> _unlockDetailed(
    BuildContext context,
    WidgetRef ref,
    BilanDetail bilan,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final ok = await showFreemiumUpgradeSheet(
      context: context,
      ref: ref,
      sessionId: bilan.sessionId,
      purpose: 'bilan_detailed',
      amountDzd: FreemiumPaymentsRepository.bilanDetailedAmountDzd,
      title: l10n.freemiumBilanTitle,
      body: bilan.upgradeHint?.message.isNotEmpty == true
          ? bilan.upgradeHint!.message
          : l10n.freemiumBilanBody,
    );
    if (ok) {
      ref.invalidate(bilanDetailProvider(bilanId));
    }
  }

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
              if (bilan.isGated) ...[
                GpsCard(
                  showAccentBorder: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        l10n.freemiumBilanTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: GpsSpacing.xs),
                      Text(
                        bilan.upgradeHint?.message ?? l10n.freemiumBilanBody,
                      ),
                      const SizedBox(height: GpsSpacing.sm),
                      PrimaryButton(
                        label: l10n.freemiumUnlockCta,
                        onPressed: () => _unlockDetailed(context, ref, bilan),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: GpsSpacing.md),
              ],
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
                SecondaryButton(
                  label: l10n.bilanExportPdf,
                  onPressed: () => _openPdf(context, ref, bilan),
                )
              else if (bilan.isGated)
                SecondaryButton(
                  label: l10n.freemiumBilanPdfCta,
                  onPressed: () => _unlockDetailed(context, ref, bilan),
                ),
              const SizedBox(height: GpsSpacing.sm),
              PrimaryButton(
                label: l10n.bilanTransmitCta,
                onPressed: () => context.push(
                  GpsRoutes.referralMatches(
                    bilan.sessionId,
                    bilanId: bilanId,
                  ),
                ),
              ),
              const SizedBox(height: GpsSpacing.sm),
              SecondaryButton(
                label: l10n.bilanCoachingCta,
                onPressed: () => context.push(
                  GpsRoutes.coachingPlanForSession(bilan.sessionId),
                ),
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
    BilanDetail bilan,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      final repo = ref.read(bilanRepositoryProvider);
      final pdf = await repo.getPdfDownload(bilan.id);
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
        if (e.statusCode == 403) {
          await _unlockDetailed(context, ref, bilan);
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    }
  }
}
