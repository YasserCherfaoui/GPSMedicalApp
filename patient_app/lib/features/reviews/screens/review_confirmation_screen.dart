import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../models/cached_appointment_review.dart';
import '../providers/appointment_review.provider.dart';
import '../providers/reviews_repositories.provider.dart';

class ReviewConfirmationScreen extends ConsumerStatefulWidget {
  const ReviewConfirmationScreen({
    required this.appointmentId,
    this.review,
    super.key,
  });

  final String appointmentId;
  final Review? review;

  @override
  ConsumerState<ReviewConfirmationScreen> createState() =>
      _ReviewConfirmationScreenState();
}

class _ReviewConfirmationScreenState
    extends ConsumerState<ReviewConfirmationScreen> {
  bool _deleting = false;

  CachedAppointmentReview? _cachedReview() {
    final review = widget.review;
    if (review != null) {
      return CachedAppointmentReview.fromReview(review);
    }
    return null;
  }

  Future<void> _deleteReview() async {
    final l10n = AppLocalizations.of(context)!;
    final cached = _cachedReview();
    final reviewId = cached?.reviewId;
    if (reviewId == null) return;

    if (cached?.createdAt != null &&
        !canDeleteReviewWithinWindow(cached!.createdAt!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.reviewDeleteExpired)),
      );
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(l10n.reviewDeleteConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(MaterialLocalizations.of(ctx).cancelButtonLabel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.reviewDelete),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    setState(() => _deleting = true);
    try {
      await ref.read(reviewsRepositoryProvider).delete(reviewId);
      await ref
          .read(appointmentReviewStoreProvider)
          .clear(widget.appointmentId);
      ref.invalidate(appointmentReviewProvider(widget.appointmentId));
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.reviewDeleteSuccess)),
      );
      context.go(GpsRoutes.appointmentDetail(widget.appointmentId));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.reviewDeleteError)),
      );
    } finally {
      if (mounted) setState(() => _deleting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final cached = _cachedReview();
    final rating = cached?.rating ?? widget.review?.rating ?? 0;
    final canDelete = cached?.canDelete ?? false;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.reviewConfirmationTitle)),
      body: Padding(
        padding: const EdgeInsets.all(GpsSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 72,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: GpsSpacing.md),
            Text(
              l10n.reviewConfirmationTitle,
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: GpsSpacing.sm),
            if (rating > 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  final filled = index < rating;
                  return Icon(
                    filled ? Icons.star_rounded : Icons.star_outline_rounded,
                    color: filled
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurfaceVariant,
                  );
                }),
              ),
            const SizedBox(height: GpsSpacing.md),
            GpsCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.reviewConfirmationStatusPending,
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: GpsSpacing.xs),
                  Text(l10n.reviewConfirmationBody),
                ],
              ),
            ),
            const Spacer(),
            PrimaryButton(
              label: l10n.reviewBackToAppointment,
              onPressed: () =>
                  context.go(GpsRoutes.appointmentDetail(widget.appointmentId)),
            ),
            if (canDelete) ...[
              const SizedBox(height: GpsSpacing.sm),
              OutlinedButton(
                onPressed: _deleting ? null : _deleteReview,
                child: _deleting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(l10n.reviewDelete),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
