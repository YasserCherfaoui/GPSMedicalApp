import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../models/cached_clinic_profile_review.dart';
import '../providers/clinic_profile_review.provider.dart';
import '../providers/reviews_repositories.provider.dart';
import '../utils/review_validation.dart';
import '../utils/reviews_api_error.dart';
import '../widgets/star_rating_input.dart';

class CreateClinicProfileReviewScreen extends ConsumerStatefulWidget {
  const CreateClinicProfileReviewScreen({
    required this.appointmentId,
    required this.clinicId,
    this.clinicName,
    super.key,
  });

  final String appointmentId;
  final String clinicId;
  final String? clinicName;

  @override
  ConsumerState<CreateClinicProfileReviewScreen> createState() =>
      _CreateClinicProfileReviewScreenState();
}

class _CreateClinicProfileReviewScreenState
    extends ConsumerState<CreateClinicProfileReviewScreen> {
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
    final ratingError = validateReviewRating(
      _rating,
      l10n.reviewRatingRequired,
    );
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
      final review = await ref
          .read(reviewsRepositoryProvider)
          .create(
            appointmentId: widget.appointmentId,
            rating: _rating!,
            comment: comment,
            reviewScope: ReviewCreateReviewScopeEnum.profile,
            subjectType: ReviewCreateSubjectTypeEnum.clinic,
            clinicId: widget.clinicId,
          );
      await ref
          .read(clinicProfileReviewStoreProvider)
          .save(CachedClinicProfileReview.fromReview(review));
      ref.invalidate(clinicProfileReviewProvider(widget.clinicId));
      if (!mounted) return;
      context.pushReplacement(
        GpsRoutes.reviewConfirmation(widget.appointmentId),
        extra: review,
      );
    } on ReviewAlreadyExistsException {
      await ref
          .read(clinicProfileReviewStoreProvider)
          .save(CachedClinicProfileReview.alreadyExists(widget.clinicId));
      ref.invalidate(clinicProfileReviewProvider(widget.clinicId));
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.reviewAlreadyExistsError)));
      context.pop();
    } on ReviewNotEligibleException {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.reviewNotEligibleError)));
    } on ReviewValidationException catch (e) {
      setState(() => _fieldErrors.addAll(e.fieldErrors));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.reviewSubmitError)));
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.reviewClinicProfileCreateTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GpsSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.clinicName ?? '',
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
                style: TextStyle(color: Theme.of(context).colorScheme.error),
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
      ),
    );
  }
}
