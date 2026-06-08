import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/appointment_review.provider.dart';

class AppointmentReviewSection extends ConsumerWidget {
  const AppointmentReviewSection({required this.appointmentId, super.key});

  final String appointmentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final reviewAsync = ref.watch(appointmentReviewProvider(appointmentId));

    return reviewAsync.when(
      data: (cached) {
        if (cached != null) {
          return GpsCard(
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: GpsSpacing.sm),
                Expanded(
                  child: Text(
                    l10n.reviewAlreadySubmitted,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          );
        }
        return OutlinedButton(
          onPressed: () =>
              context.push(GpsRoutes.appointmentReview(appointmentId)),
          child: Text(l10n.appointmentLeaveReview),
        );
      },
      loading: () => const SizedBox(
        height: 48,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => OutlinedButton(
        onPressed: () =>
            context.push(GpsRoutes.appointmentReview(appointmentId)),
        child: Text(l10n.appointmentLeaveReview),
      ),
    );
  }
}
