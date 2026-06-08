import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../booking/providers/appointment_detail.provider.dart';
import '../../booking/widgets/booking_error_view.dart';
import '../models/cached_appointment_review.dart';
import '../providers/appointment_review.provider.dart';
import '../providers/reviews_repositories.provider.dart';
import '../utils/review_validation.dart';
import '../utils/reviews_api_error.dart';
import '../widgets/star_rating_input.dart';

class CreateReviewScreen extends ConsumerStatefulWidget {
  const CreateReviewScreen({required this.appointmentId, super.key});

  final String appointmentId;

  @override
  ConsumerState<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends ConsumerState<CreateReviewScreen> {
  int? _rating;
  final _commentController = TextEditingController();
  final _fieldErrors = <String, String>{};
  bool _submitting = false;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context)!;
    final comment = _commentController.text;
    final errors = <String, String>{};
    final ratingError = validateReviewRating(_rating, l10n.reviewRatingRequired);
    if (ratingError != null) errors['rating'] = ratingError;
    final commentError = validateReviewComment(
      comment,
      l10n.reviewCommentTooLong(maxReviewCommentLength),
    );
    if (commentError != null) errors['comment'] = commentError;
    setState(() {
      _fieldErrors
        ..clear()
        ..addAll(errors);
    });
    if (errors.isNotEmpty) return;

    setState(() => _submitting = true);
    try {
      final review = await ref.read(reviewsRepositoryProvider).create(
        appointmentId: widget.appointmentId,
        rating: _rating!,
        comment: comment,
      );
      await ref
          .read(appointmentReviewStoreProvider)
          .save(CachedAppointmentReview.fromReview(review));
      ref.invalidate(appointmentReviewProvider(widget.appointmentId));
      if (!mounted) return;
      context.pushReplacement(
        GpsRoutes.reviewConfirmation(widget.appointmentId),
        extra: review,
      );
    } on ReviewAlreadyExistsException {
      await ref
          .read(appointmentReviewStoreProvider)
          .save(
            CachedAppointmentReview.alreadyExists(widget.appointmentId),
          );
      ref.invalidate(appointmentReviewProvider(widget.appointmentId));
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.reviewAlreadyExistsError)),
      );
      context.pop();
    } on ReviewNotEligibleException {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.reviewNotEligibleError)),
      );
    } on ReviewValidationException catch (e) {
      setState(() => _fieldErrors.addAll(e.fieldErrors));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.reviewSubmitError)),
      );
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final detailAsync = ref.watch(
      appointmentDetailProvider(widget.appointmentId),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.reviewCreateTitle)),
      body: detailAsync.when(
        data: (state) {
          final doctor = state.doctor;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(GpsSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '${doctor.title ?? 'Dr.'} ${doctor.fullName ?? ''}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: GpsSpacing.lg),
                StarRatingInput(
                  label: l10n.reviewRatingLabel,
                  value: _rating,
                  onChanged: (value) => setState(() {
                    _rating = value;
                    _fieldErrors.remove('rating');
                  }),
                ),
                if (_fieldErrors['rating'] != null) ...[
                  const SizedBox(height: GpsSpacing.xs),
                  Text(
                    _fieldErrors['rating']!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
                const SizedBox(height: GpsSpacing.lg),
                TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                    labelText: l10n.reviewCommentLabel,
                    hintText: l10n.reviewCommentHint,
                    alignLabelWithHint: true,
                    errorText: _fieldErrors['comment'],
                  ),
                  maxLines: 5,
                  maxLength: maxReviewCommentLength,
                  onChanged: (_) => _fieldErrors.remove('comment'),
                ),
                const SizedBox(height: GpsSpacing.lg),
                PrimaryButton(
                  label: l10n.reviewSubmit,
                  onPressed: _submitting ? null : _submit,
                  isLoading: _submitting,
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => BookingErrorView(
          error: e,
          message: l10n.appointmentDetailLoadError,
          onRetry: () => ref.invalidate(
            appointmentDetailProvider(widget.appointmentId),
          ),
        ),
      ),
    );
  }
}
