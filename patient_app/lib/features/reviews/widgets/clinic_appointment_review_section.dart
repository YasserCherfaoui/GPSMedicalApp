import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../models/cached_appointment_review.dart';
import '../providers/appointment_review.provider.dart';
import '../providers/clinic_profile_review.provider.dart';

class ClinicAppointmentReviewSection extends ConsumerWidget {
  const ClinicAppointmentReviewSection({
    required this.appointmentId,
    required this.clinicId,
    this.clinicName,
    super.key,
  });

  final String appointmentId;
  final String clinicId;
  final String? clinicName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final sessionReviewAsync = ref.watch(
      appointmentReviewProvider(appointmentId),
    );
    final clinicReviewAsync = ref.watch(clinicProfileReviewProvider(clinicId));

    return sessionReviewAsync.when(
      data: (sessionCached) {
        return clinicReviewAsync.when(
          data: (clinicCached) {
            return GpsCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _ReviewRow(
                    label: l10n.appointmentReviewSession,
                    submitted: sessionCached != null,
                    submittedLabel: l10n.reviewAlreadySubmitted,
                    actionLabel: l10n.appointmentReviewSession,
                    onPressed: sessionCached == null
                        ? () => context.push(
                            GpsRoutes.appointmentReview(appointmentId),
                          )
                        : null,
                  ),
                  const SizedBox(height: GpsSpacing.md),
                  _ReviewRow(
                    label: l10n.appointmentReviewClinicProfile,
                    submitted: clinicCached != null,
                    submittedLabel: l10n.reviewClinicAlreadySubmitted,
                    actionLabel: l10n.appointmentReviewClinicProfile,
                    onPressed: clinicCached == null
                        ? () => context.push(
                            GpsRoutes.clinicProfileReview(
                              appointmentId,
                              clinicId,
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            );
          },
          loading: () => const SizedBox(
            height: 48,
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (_, __) => _dualButtons(context, l10n, sessionCached),
        );
      },
      loading: () => const SizedBox(
        height: 48,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => _dualButtons(context, l10n, null),
    );
  }

  Widget _dualButtons(
    BuildContext context,
    AppLocalizations l10n,
    CachedAppointmentReview? sessionCached,
  ) {
    return GpsCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OutlinedButton(
            onPressed: sessionCached == null
                ? () => context.push(GpsRoutes.appointmentReview(appointmentId))
                : null,
            child: Text(l10n.appointmentReviewSession),
          ),
          const SizedBox(height: GpsSpacing.sm),
          OutlinedButton(
            onPressed: () => context.push(
              GpsRoutes.clinicProfileReview(appointmentId, clinicId),
            ),
            child: Text(l10n.appointmentReviewClinicProfile),
          ),
        ],
      ),
    );
  }
}

class _ReviewRow extends StatelessWidget {
  const _ReviewRow({
    required this.label,
    required this.submitted,
    required this.submittedLabel,
    required this.actionLabel,
    required this.onPressed,
  });

  final String label;
  final bool submitted;
  final String submittedLabel;
  final String actionLabel;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    if (submitted) {
      return Row(
        children: [
          Icon(
            Icons.check_circle_outline,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: GpsSpacing.sm),
          Expanded(child: Text(submittedLabel)),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: GpsSpacing.sm),
        OutlinedButton(onPressed: onPressed, child: Text(actionLabel)),
      ],
    );
  }
}
