import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../booking/providers/booking_draft.provider.dart';
import '../providers/doctor_detail.provider.dart';
import '../repositories/doctor_repository.dart';
import '../utils/doctor_display.dart';
import '../utils/relative_time.dart';
import '../widgets/discovery_error_view.dart';
import '../widgets/doctor_detail_shimmer.dart';
import '../widgets/map_preview_tile.dart';

class DoctorDetailScreen extends ConsumerStatefulWidget {
  const DoctorDetailScreen({
    required this.doctorId,
    this.openBooking = false,
    super.key,
  });

  final String doctorId;
  final bool openBooking;

  @override
  ConsumerState<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends ConsumerState<DoctorDetailScreen> {
  var _bookingLaunched = false;

  void _startInPersonBooking(Doctor doc) {
    ref.read(bookingDraftProvider.notifier).startBooking(
      doctorId: widget.doctorId,
      doctor: doc,
    );
    context.push(GpsRoutes.doctorBooking(widget.doctorId));
  }

  void _startTelehealthBooking(Doctor doc) {
    ref.read(bookingDraftProvider.notifier).startBooking(
      doctorId: widget.doctorId,
      doctor: doc,
      modeFilter: 'telehealth',
    );
    context.push(
      '${GpsRoutes.doctorBooking(widget.doctorId)}?mode=telehealth',
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final languageCode = Localizations.localeOf(context).languageCode;
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final detailAsync = ref.watch(doctorDetailProvider(widget.doctorId));

    ref.listen(doctorDetailProvider(widget.doctorId), (previous, next) {
      if (!widget.openBooking || _bookingLaunched) return;
      final doc = next.value?.doctor;
      if (doc == null) return;

      _bookingLaunched = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _startInPersonBooking(doc);
      });
    });

    return Scaffold(
      appBar: AppBar(title: Text(l10n.doctorDetailTitle)),
      body: detailAsync.when(
        data: (detail) => _DoctorDetailBody(
          detail: detail,
          doctorId: widget.doctorId,
          languageCode: languageCode,
          isRtl: isRtl,
          onBook: () => _startInPersonBooking(detail.doctor),
          onTelehealth: detail.doctor.offersTelehealth == true
              ? () => _startTelehealthBooking(detail.doctor)
              : null,
          onLoadMoreReviews: () => ref
              .read(doctorDetailProvider(widget.doctorId).notifier)
              .loadMoreReviews(),
        ),
        loading: () => const DoctorDetailShimmer(),
        error: (error, stack) {
          if (error is DoctorNotFoundException) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(GpsSpacing.md),
                child: ErrorState(
                  title: l10n.doctorDetailNotFoundTitle,
                  message: l10n.doctorDetailNotFoundMessage,
                  onRetry: () => context.pop(),
                ),
              ),
            );
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(GpsSpacing.md),
              child: DiscoveryErrorView(
                error: error,
                defaultTitle: l10n.errorGenericTitle,
                defaultMessage: l10n.doctorDetailLoadError,
                onRetry: () =>
                    ref.refresh(doctorDetailProvider(widget.doctorId)),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DoctorDetailBody extends StatelessWidget {
  const _DoctorDetailBody({
    required this.detail,
    required this.doctorId,
    required this.languageCode,
    required this.isRtl,
    required this.onBook,
    required this.onLoadMoreReviews,
    this.onTelehealth,
  });

  final DoctorDetailState detail;
  final String doctorId;
  final String languageCode;
  final bool isRtl;
  final VoidCallback onBook;
  final VoidCallback? onTelehealth;
  final VoidCallback onLoadMoreReviews;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final doc = detail.doctor;
    final specialtyLabels = doctorSpecialtyLabels(doc, languageCode);
    final languages = formatDoctorLanguages(doc.languages, l10n);
    final address = formatPracticeAddress(doc.practiceAddress);

    final avatarImage = doc.photoUrl != null && doc.photoUrl!.isNotEmpty
        ? NetworkImage(doc.photoUrl!) as ImageProvider
        : const AssetImage('assets/images/default_avatar.png');

    final photoBlock = Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(GpsRadii.lg),
            image: DecorationImage(
              image: avatarImage,
              fit: BoxFit.cover,
              onError: (exception, stackTrace) {},
            ),
            color: colorScheme.surfaceContainerHigh,
          ),
        ),
        if (doc.verified == true)
          PositionedDirectional(
            bottom: -2,
            end: -2,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.verified,
                color: colorScheme.primary,
                size: 18,
              ),
            ),
          ),
      ],
    );

    final infoBlock = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${doc.title ?? 'Dr.'} ${doc.fullName ?? ''}',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: GpsSpacing.xs),
          Wrap(
            spacing: GpsSpacing.xs,
            runSpacing: GpsSpacing.xs,
            children: specialtyLabels
                .map((label) => SpecialtyChip(label: label))
                .toList(),
          ),
          const SizedBox(height: GpsSpacing.sm),
          RatingDisplay(
            rating: doc.ratingAverage ?? 0.0,
            count: doc.ratingCount ?? 0,
          ),
        ],
      ),
    );

    return Stack(
      children: [
        Positioned.fill(
          bottom: 84,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(GpsSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GpsCard(
                  showAccentBorder: true,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: isRtl
                        ? [infoBlock, const SizedBox(width: GpsSpacing.md), photoBlock]
                        : [photoBlock, const SizedBox(width: GpsSpacing.md), infoBlock],
                  ),
                ),
                const SizedBox(height: GpsSpacing.lg),
                _SectionTitle(title: l10n.doctorDetailBioTitle),
                const SizedBox(height: GpsSpacing.xs),
                _CollapsibleText(
                  text: (doc.bio != null && doc.bio!.trim().isNotEmpty)
                      ? doc.bio!
                      : l10n.doctorDetailBioEmpty,
                  expandLabel: l10n.doctorDetailBioExpand,
                  collapseLabel: l10n.doctorDetailBioCollapse,
                ),
                const SizedBox(height: GpsSpacing.lg),
                _SectionTitle(title: l10n.doctorDetailLanguagesTitle),
                const SizedBox(height: GpsSpacing.xs),
                Text(
                  languages.isNotEmpty
                      ? languages
                      : l10n.doctorDetailLanguagesEmpty,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: languages.isEmpty
                        ? colorScheme.onSurfaceVariant
                        : null,
                    fontStyle:
                        languages.isEmpty ? FontStyle.italic : FontStyle.normal,
                  ),
                ),
                const SizedBox(height: GpsSpacing.lg),
                _SectionTitle(title: l10n.doctorDetailFeeTitle),
                const SizedBox(height: GpsSpacing.xs),
                GpsCard(
                  child: Padding(
                    padding: const EdgeInsets.all(GpsSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                l10n.doctorDetailFeeInPerson,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              l10n.doctorDetailFeeValue(
                                doc.consultationFeeDzd ?? 0,
                              ),
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        if (doc.acceptsCnas == true ||
                            doc.acceptsCasnos == true) ...[
                          const SizedBox(height: GpsSpacing.sm),
                          Wrap(
                            spacing: GpsSpacing.sm,
                            runSpacing: GpsSpacing.xs,
                            children: [
                              if (doc.acceptsCnas == true)
                                _InsuranceChip(
                                  icon: Icons.health_and_safety_outlined,
                                  label: l10n.searchFilterInsuranceCnas,
                                ),
                              if (doc.acceptsCasnos == true)
                                _InsuranceChip(
                                  icon: Icons.shield_outlined,
                                  label: l10n.searchFilterInsuranceCasnos,
                                ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: GpsSpacing.lg),
                _SectionTitle(title: l10n.doctorDetailAddressTitle),
                const SizedBox(height: GpsSpacing.xs),
                GpsCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (address.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(GpsSpacing.md),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: colorScheme.primary,
                                size: 20,
                              ),
                              const SizedBox(width: GpsSpacing.xs),
                              Expanded(
                                child: Text(
                                  address,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      MapPreviewTile(
                        latitude: doc.practiceAddress?.latitude,
                        longitude: doc.practiceAddress?.longitude,
                        unavailableLabel: l10n.doctorDetailMapUnavailable,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: GpsSpacing.lg),
                _SectionTitle(title: l10n.doctorDetailReviewsTitle),
                const SizedBox(height: GpsSpacing.xs),
                _ReviewsSection(
                  detail: detail,
                  languageCode: languageCode,
                  onLoadMore: onLoadMoreReviews,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(GpsSpacing.md),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border(
                top: BorderSide(color: colorScheme.outlineVariant, width: 0.5),
              ),
            ),
            child: Row(
              children: [
                if (onTelehealth != null) ...[
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(GpsRadii.md),
                        ),
                      ),
                      onPressed: onTelehealth,
                      icon: const Icon(Icons.videocam_outlined),
                      label: Text(l10n.doctorDetailTelehealthCta),
                    ),
                  ),
                  const SizedBox(width: GpsSpacing.sm),
                ],
                Expanded(
                  child: PrimaryButton(
                    label: l10n.doctorDetailBookCta,
                    onPressed: onBook,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _InsuranceChip extends StatelessWidget {
  const _InsuranceChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GpsSpacing.sm,
        vertical: GpsSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(GpsRadii.full),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: colorScheme.onPrimaryContainer),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewsSection extends StatelessWidget {
  const _ReviewsSection({
    required this.detail,
    required this.languageCode,
    required this.onLoadMore,
  });

  final DoctorDetailState detail;
  final String languageCode;
  final VoidCallback onLoadMore;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final reviews = detail.reviews;

    if (reviews.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: GpsSpacing.md),
        child: Text(
          l10n.doctorDetailReviewsEmpty,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontStyle: FontStyle.italic,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...reviews.map((review) {
          return Container(
            margin: const EdgeInsets.only(bottom: GpsSpacing.sm),
            padding: const EdgeInsets.all(GpsSpacing.md),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(GpsRadii.md),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        l10n.doctorDetailVerifiedPatient,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(5, (index) {
                            final starRating = review.rating ?? 0;
                            return Icon(
                              index < starRating
                                  ? Icons.star_rounded
                                  : Icons.star_border_rounded,
                              color: Colors.amber,
                              size: 16,
                            );
                          }),
                        ),
                        if (review.createdAt != null)
                          Text(
                            formatReviewRelativeTime(
                              review.createdAt!,
                              languageCode,
                            ),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                if (review.comment != null && review.comment!.isNotEmpty) ...[
                  const SizedBox(height: GpsSpacing.xs),
                  Text(review.comment!, style: theme.textTheme.bodyMedium),
                ],
              ],
            ),
          );
        }),
        if (detail.hasMoreReviews) ...[
          const SizedBox(height: GpsSpacing.sm),
          if (detail.isLoadingMoreReviews)
            const Center(child: LoadingSkeleton(height: 32))
          else
            TextButton(
              onPressed: onLoadMore,
              child: Text(l10n.doctorDetailReviewsLoadMore),
            ),
        ],
      ],
    );
  }
}

class _CollapsibleText extends StatefulWidget {
  const _CollapsibleText({
    required this.text,
    required this.expandLabel,
    required this.collapseLabel,
  });

  final String text;
  final String expandLabel;
  final String collapseLabel;

  @override
  State<_CollapsibleText> createState() => _CollapsibleTextState();
}

class _CollapsibleTextState extends State<_CollapsibleText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: _expanded ? null : 3,
          overflow: _expanded ? null : TextOverflow.ellipsis,
          style: theme.textTheme.bodyMedium,
        ),
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              _expanded ? widget.collapseLabel : widget.expandLabel,
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
