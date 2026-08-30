import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../bilan/providers/bilan_providers.dart';
import '../../bilan/repositories/bilan_repository.dart';
import '../models/referral_models.dart';
import '../providers/referral_providers.dart';
import '../repositories/referral_repository.dart';

class ReferralMatchesScreen extends ConsumerWidget {
  const ReferralMatchesScreen({
    required this.sessionId,
    this.bilanId,
    super.key,
  });

  final String sessionId;
  final String? bilanId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final args = (sessionId: sessionId, bilanId: bilanId);
    final matchesAsync = ref.watch(referralMatchesProvider(args));

    return Scaffold(
      appBar: AppBar(title: Text(l10n.referralMatchesTitle)),
      body: matchesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.referralLoadError),
              const SizedBox(height: GpsSpacing.md),
              FilledButton(
                onPressed: () =>
                    ref.read(referralMatchesProvider(args).notifier).refresh(),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
        data: (matches) {
          if (matches.isEmpty) {
            return Center(child: Text(l10n.referralMatchesEmpty));
          }
          return RefreshIndicator(
            onRefresh: () =>
                ref.read(referralMatchesProvider(args).notifier).refresh(),
            child: ListView.separated(
              padding: const EdgeInsets.all(GpsSpacing.md),
              itemCount: matches.length,
              separatorBuilder: (_, __) => const SizedBox(height: GpsSpacing.sm),
              itemBuilder: (context, index) {
                final match = matches[index];
                final spec = match.specialist;
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Theme.of(context).dividerColor),
                  ),
                  title: Text(
                    spec?.fullName.isNotEmpty == true
                        ? spec!.fullName
                        : l10n.referralMatchSpecialistFallback,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (spec != null && spec.specialtyCode.isNotEmpty)
                        Text(spec.specialtyCode),
                      Text(
                        l10n.referralMatchScore(match.matchScore.round()),
                      ),
                      if (match.rationaleFr.isNotEmpty)
                        Text(
                          match.rationaleFr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _selectMatch(context, ref, match),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> _selectMatch(
    BuildContext context,
    WidgetRef ref,
    ReferralMatch match,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      final referralRepo = ref.read(referralRepositoryProvider);
      await referralRepo.selectMatch(match.id);
      if (bilanId != null) {
        final bilanRepo = ref.read(bilanRepositoryProvider);
        await bilanRepo.transmit(
          bilanId: bilanId!,
          specialistId: match.specialistId,
        );
      }
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.referralSelectSuccess)),
      );
      context.push(
        '${GpsRoutes.doctorDetail(match.specialistId)}?book=true',
      );
    } on ReferralApiException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
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
