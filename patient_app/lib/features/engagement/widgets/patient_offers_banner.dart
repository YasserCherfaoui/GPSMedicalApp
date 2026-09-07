import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

final patientPendingOffersProvider =
    FutureProvider.autoDispose<List<EngagementOffer>>((ref) async {
  return ref.watch(engagementRepositoryProvider).listOffers(roleView: 'patient');
});

/// Pending appointment offers for the patient (pay / decline).
class PatientOffersBanner extends ConsumerWidget {
  const PatientOffersBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(patientPendingOffersProvider);
    return async.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (offers) {
        final live = offers.where((o) => o.status == 'offered').toList();
        if (live.isEmpty) return const SizedBox.shrink();
        return Column(
          children: [
            for (final offer in live.take(3))
              _OfferCard(
                offer: offer,
                onDone: () => ref.invalidate(patientPendingOffersProvider),
              ),
          ],
        );
      },
    );
  }
}

class _OfferCard extends ConsumerStatefulWidget {
  const _OfferCard({required this.offer, required this.onDone});

  final EngagementOffer offer;
  final VoidCallback onDone;

  @override
  ConsumerState<_OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends ConsumerState<_OfferCard> {
  var _busy = false;

  Future<void> _pay() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _busy = true);
    try {
      final result = await ref
          .read(engagementRepositoryProvider)
          .payOffer(widget.offer.id);
      if (!mounted) return;
      final appointmentId = result['appointment_id'] as String? ??
          widget.offer.appointmentId;
      widget.onDone();
      if (appointmentId != null && appointmentId.isNotEmpty) {
        context.push(GpsRoutes.appointmentDetail(appointmentId));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.engagementOfferPayStarted)),
        );
      }
    } on DioException catch (e) {
      if (!mounted) return;
      final msg = e.response?.statusCode == 422
          ? l10n.engagementOfferPayUnavailable
          : l10n.networkError;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.networkError)),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _decline() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _busy = true);
    try {
      await ref.read(engagementRepositoryProvider).declineOffer(widget.offer.id);
      if (!mounted) return;
      widget.onDone();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.networkError)),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final offer = widget.offer;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        GpsSpacing.md,
        GpsSpacing.sm,
        GpsSpacing.md,
        0,
      ),
      child: GpsCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.engagementOfferPendingTitle,
              style: theme.textTheme.titleSmall,
            ),
            const SizedBox(height: GpsSpacing.xs),
            Text(
              '${offer.priceMinor} ${offer.currency}'
              '${offer.startAt != null ? ' · ${offer.startAt!.toLocal()}' : ''}',
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: GpsSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: _busy ? null : _pay,
                    child: Text(l10n.engagementOfferPay),
                  ),
                ),
                const SizedBox(width: GpsSpacing.sm),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _busy ? null : _decline,
                    child: Text(l10n.engagementOfferDecline),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
