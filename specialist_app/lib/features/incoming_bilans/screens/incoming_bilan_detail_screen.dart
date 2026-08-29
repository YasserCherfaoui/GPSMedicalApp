import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/incoming_bilan_providers.dart';

class IncomingBilanDetailScreen extends ConsumerStatefulWidget {
  const IncomingBilanDetailScreen({required this.transmissionId, super.key});

  final String transmissionId;

  @override
  ConsumerState<IncomingBilanDetailScreen> createState() =>
      _IncomingBilanDetailScreenState();
}

class _IncomingBilanDetailScreenState
    extends ConsumerState<IncomingBilanDetailScreen> {
  var _reviewing = false;

  Future<void> _markReviewed() async {
    setState(() => _reviewing = true);
    try {
      final repo = ref.read(incomingBilanRepositoryProvider);
      await repo.markReviewed(widget.transmissionId);
      ref.invalidate(incomingBilansProvider);
      ref.invalidate(incomingBilanDetailProvider(widget.transmissionId));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.specialistIncomingBilanReviewed),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _reviewing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final detailAsync =
        ref.watch(incomingBilanDetailProvider(widget.transmissionId));

    return Scaffold(
      appBar: AppBar(title: Text(l10n.specialistIncomingBilanDetailTitle)),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text(l10n.specialistIncomingBilansError)),
        data: (detail) {
          final score = (detail.bilan['sections']?['score']?['final_score']
                  as num?)
              ?.toDouble();
          return ListView(
            padding: const EdgeInsets.all(GpsSpacing.lg),
            children: [
              if (score != null)
                Text(
                  l10n.bilanScoreLabel(score.round()),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              const SizedBox(height: GpsSpacing.md),
              Text(
                l10n.bilanSummarySection,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: GpsSpacing.sm),
              Text(detail.summaryFr),
              const SizedBox(height: GpsSpacing.xl),
              if (detail.transmission.isOpen)
                FilledButton(
                  onPressed: _reviewing ? null : _markReviewed,
                  child: _reviewing
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(l10n.specialistIncomingBilanMarkReviewed),
                ),
              const SizedBox(height: GpsSpacing.sm),
              OutlinedButton(
                onPressed: () => context.go('/specialist/shell'),
                child: Text(l10n.specialistIncomingBilanOpenAgenda),
              ),
            ],
          );
        },
      ),
    );
  }
}
