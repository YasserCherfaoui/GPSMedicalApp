import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../booking/providers/booking_draft.provider.dart';
import '../../booking/widgets/offline_banner.dart';
import '../providers/clinic_detail.provider.dart';
import '../repositories/clinic_repository.dart';
import '../utils/clinic_display.dart';
import '../utils/doctor_display.dart';
import '../widgets/discovery_error_view.dart';
import '../widgets/doctor_detail_shimmer.dart';
import '../widgets/map_preview_tile.dart';

class ClinicDetailScreen extends ConsumerWidget {
  const ClinicDetailScreen({required this.clinicId, super.key});

  final String clinicId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final languageCode = Localizations.localeOf(context).languageCode;
    final detailAsync = ref.watch(clinicDetailProvider(clinicId));

    return Scaffold(
      appBar: AppBar(title: Text(l10n.clinicDetailTitle)),
      body: Column(
        children: [
          const OfflineBanner(),
          Expanded(
            child: detailAsync.when(
              data: (detail) => _ClinicDetailBody(
                detail: detail,
                languageCode: languageCode,
                onLoadMoreReviews: () => ref
                    .read(clinicDetailProvider(clinicId).notifier)
                    .loadMoreReviews(),
              ),
              loading: () => const DoctorDetailShimmer(),
              error: (error, stack) {
                if (error is ClinicNotFoundException) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(GpsSpacing.md),
                      child: ErrorState(
                        title: l10n.clinicDetailNotFoundTitle,
                        message: l10n.clinicDetailNotFoundMessage,
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
                      defaultMessage: l10n.clinicDetailLoadError,
                      onRetry: () =>
                          ref.refresh(clinicDetailProvider(clinicId)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ClinicDetailBody extends StatelessWidget {
  const _ClinicDetailBody({
    required this.detail,
    required this.languageCode,
    required this.onLoadMoreReviews,
  });

  final ClinicDetailState detail;
  final String languageCode;
  final VoidCallback onLoadMoreReviews;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final clinic = detail.clinic;
    final address = formatPracticeAddress(clinic.address);
    final description = clinic.description?.trim() ?? '';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(GpsSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GpsCard(
            showAccentBorder: true,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(GpsRadii.md),
                  ),
                  child: Icon(
                    Icons.local_hospital_outlined,
                    color: colorScheme.onPrimaryContainer,
                    size: 36,
                  ),
                ),
                const SizedBox(width: GpsSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        clinic.name ?? '',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: GpsSpacing.xs),
                      if (clinic.verified == true)
                        GpsBadge(label: l10n.clinicDetailVerifiedBadge),
                      const SizedBox(height: GpsSpacing.sm),
                      RatingDisplay(
                        rating: clinic.ratingAverage ?? 0.0,
                        count: clinic.ratingCount ?? 0,
                      ),
                      if (clinic.offersTelehealth == true) ...[
                        const SizedBox(height: GpsSpacing.xs),
                        Text(
                          l10n.clinicCardTelehealth,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: GpsSpacing.md),
          GpsCard(
            child: Padding(
              padding: const EdgeInsets.all(GpsSpacing.md),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(width: GpsSpacing.sm),
                  Expanded(
                    child: Text(
                      l10n.clinicDetailAssignNotice,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: GpsSpacing.lg),
          _SectionTitle(title: l10n.clinicDetailAboutTitle),
          const SizedBox(height: GpsSpacing.xs),
          Text(
            description.isNotEmpty ? description : l10n.clinicDetailAboutEmpty,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: description.isEmpty ? colorScheme.onSurfaceVariant : null,
              fontStyle: description.isEmpty
                  ? FontStyle.italic
                  : FontStyle.normal,
            ),
          ),
          const SizedBox(height: GpsSpacing.lg),
          _SectionTitle(title: l10n.clinicDetailServicesTitle),
          const SizedBox(height: GpsSpacing.xs),
          if (detail.services.isEmpty)
            Text(
              l10n.clinicDetailServicesEmpty,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontStyle: FontStyle.italic,
              ),
            )
          else
            ...detail.services.map(
              (service) => Padding(
                padding: const EdgeInsets.only(bottom: GpsSpacing.sm),
                child: _ServiceTile(
                  service: service,
                  clinicId: clinic.id ?? '',
                  clinicName: clinic.name ?? '',
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
                  latitude: clinic.address?.latitude,
                  longitude: clinic.address?.longitude,
                  unavailableLabel: l10n.clinicDetailMapUnavailable,
                ),
              ],
            ),
          ),
          const SizedBox(height: GpsSpacing.lg),
          _SectionTitle(title: l10n.clinicDetailSpecialistsTitle),
          const SizedBox(height: GpsSpacing.xs),
          if (detail.specialists.isEmpty)
            Text(
              l10n.clinicDetailSpecialistsEmpty,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontStyle: FontStyle.italic,
              ),
            )
          else
            ...detail.specialists.map(
              (specialist) => Padding(
                padding: const EdgeInsets.only(bottom: GpsSpacing.sm),
                child: _SpecialistTile(specialist: specialist),
              ),
            ),
          const SizedBox(height: GpsSpacing.lg),
          _SectionTitle(title: l10n.clinicDetailReviewsTitle),
          const SizedBox(height: GpsSpacing.xs),
          _ReviewsSection(
            detail: detail,
            languageCode: languageCode,
            onLoadMore: onLoadMoreReviews,
          ),
        ],
      ),
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

class _ServiceTile extends ConsumerWidget {
  const _ServiceTile({
    required this.service,
    required this.clinicId,
    required this.clinicName,
  });

  final ClinicService service;
  final String clinicId;
  final String clinicName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final duration = clinicServiceDurationMinutes(service.durationMinutes);
    final price = service.priceAmount;
    final currency = clinicCurrencyLabel(service.currency);

    return GpsCard(
      child: Padding(
        padding: const EdgeInsets.all(GpsSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    service.name ?? '',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (price != null)
                  Text(
                    l10n.clinicDetailServicePrice(price, currency),
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
              ],
            ),
            if (service.description != null &&
                service.description!.trim().isNotEmpty) ...[
              const SizedBox(height: GpsSpacing.xs),
              Text(
                service.description!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            const SizedBox(height: GpsSpacing.sm),
            Wrap(
              spacing: GpsSpacing.sm,
              runSpacing: GpsSpacing.xs,
              children: [
                if (duration != null)
                  Text(
                    l10n.clinicDetailDurationMinutes(duration),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                if (service.offersTelehealth == true)
                  Text(
                    l10n.clinicCardTelehealth,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                if (service.acceptsCnas == true)
                  Text(
                    l10n.searchFilterInsuranceCnas,
                    style: theme.textTheme.labelSmall,
                  ),
                if (service.acceptsCasnos == true)
                  Text(
                    l10n.searchFilterInsuranceCasnos,
                    style: theme.textTheme.labelSmall,
                  ),
              ],
            ),
            if (service.id != null &&
                service.id!.isNotEmpty &&
                clinicId.isNotEmpty) ...[
              const SizedBox(height: GpsSpacing.md),
              PrimaryButton(
                label: l10n.clinicBookingCta,
                onPressed: () {
                  ref
                      .read(bookingDraftProvider.notifier)
                      .startClinicBooking(
                        clinicId: clinicId,
                        clinicName: clinicName,
                        serviceId: service.id!,
                        serviceName: service.name ?? '',
                        serviceFeeAmount: service.priceAmount,
                        serviceCurrency: clinicCurrencyLabel(service.currency),
                        offersTelehealth: service.offersTelehealth == true,
                      );
                  context.push(GpsRoutes.clinicBooking(clinicId, service.id!));
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SpecialistTile extends StatelessWidget {
  const _SpecialistTile({required this.specialist});

  final ClinicSpecialistTeaser specialist;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final id = specialist.id ?? '';

    return GpsCard(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: GpsSpacing.md,
          vertical: GpsSpacing.xs,
        ),
        leading: GpsDoctorPhoto(size: 44, imageUrl: specialist.photoUrl),
        title: Text(
          formatClinicSpecialistName(specialist),
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: specialist.specialtyCode == null
            ? null
            : Text(
                specialist.specialtyCode!,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
        trailing: id.isEmpty
            ? null
            : const Icon(Icons.arrow_forward),
        onTap: id.isEmpty
            ? null
            : () => context.push(GpsRoutes.doctorDetail(id)),
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

  final ClinicDetailState detail;
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
          l10n.clinicDetailReviewsEmpty,
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
                        l10n.clinicDetailVerifiedPatient,
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
              child: Text(l10n.clinicDetailLoadMoreReviews),
            ),
        ],
      ],
    );
  }
}
