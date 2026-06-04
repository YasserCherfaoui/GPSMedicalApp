import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../booking/providers/booking_draft.provider.dart';
import '../providers/doctor_detail.provider.dart';
import '../repositories/doctor_repository.dart';
import '../utils/relative_time.dart';
import '../widgets/discovery_error_view.dart';

class DoctorDetailScreen extends ConsumerWidget {
  const DoctorDetailScreen({required this.doctorId, super.key});

  final String doctorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final detailAsync = ref.watch(doctorDetailProvider(doctorId));
    final isAr = Localizations.localeOf(context).languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Text(isAr ? 'Profil du médecin' : 'Profil du médecin'),
      ),
      body: detailAsync.when(
        data: (detail) {
          final doc = detail.doctor;
          final avatarImage = doc.photoUrl != null && doc.photoUrl!.isNotEmpty
              ? NetworkImage(doc.photoUrl!) as ImageProvider
              : const AssetImage('assets/images/default_avatar.png');

          return Stack(
            children: [
              // Scrollable body content
              Positioned.fill(
                bottom: 84, // Space for sticky bottom buttons
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(GpsSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header card with photo and name
                      GpsCard(
                        showAccentBorder: true,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      GpsRadii.lg,
                                    ),
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
                            ),
                            const SizedBox(width: GpsSpacing.md),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${doc.title ?? "Dr."} ${doc.fullName ?? ""}',
                                    style: theme.textTheme.headlineMedium
                                        ?.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: GpsSpacing.xs),
                                  Wrap(
                                    spacing: GpsSpacing.xs,
                                    runSpacing: GpsSpacing.xs,
                                    children:
                                        doc.specialties
                                            ?.map(
                                              (s) => SpecialtyChip(
                                                label: isAr
                                                    ? (s.nameAr ??
                                                          s.nameFr ??
                                                          '')
                                                    : (s.nameFr ?? ''),
                                              ),
                                            )
                                            .toList() ??
                                        [],
                                  ),
                                  const SizedBox(height: GpsSpacing.sm),
                                  RatingDisplay(
                                    rating: doc.ratingAverage ?? 0.0,
                                    count: doc.ratingCount ?? 0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: GpsSpacing.lg),

                      // Bio section
                      _buildSectionTitle(
                        theme,
                        isAr ? 'Biographie' : 'Biographie',
                      ),
                      const SizedBox(height: GpsSpacing.xs),
                      _CollapsibleText(
                        text:
                            doc.bio ??
                            (isAr
                                ? 'Aucune description disponible.'
                                : 'Aucune biographie disponible.'),
                      ),
                      const SizedBox(height: GpsSpacing.lg),

                      // Fee section
                      _buildSectionTitle(
                        theme,
                        isAr
                            ? 'Honoraires de consultation'
                            : 'Tarifs de consultation',
                      ),
                      const SizedBox(height: GpsSpacing.xs),
                      GpsCard(
                        child: Padding(
                          padding: const EdgeInsets.all(GpsSpacing.md),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                isAr
                                    ? 'Consultation en cabinet'
                                    : 'Consultation en cabinet',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '${doc.consultationFeeDzd ?? 0} DZD',
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: GpsSpacing.lg),

                      // Address with Map preview tile
                      _buildSectionTitle(
                        theme,
                        isAr ? 'Adresse du cabinet' : 'Adresse de pratique',
                      ),
                      const SizedBox(height: GpsSpacing.xs),
                      GpsCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(GpsSpacing.md),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: colorScheme.primary,
                                        size: 20,
                                      ),
                                      const SizedBox(width: GpsSpacing.xs),
                                      Expanded(
                                        child: Text(
                                          '${doc.practiceAddress?.line1 ?? ""}, ${doc.practiceAddress?.communeName ?? ""}, ${doc.practiceAddress?.wilayaName ?? ""}',
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Map Preview Tile
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                color: colorScheme.surfaceContainerHighest,
                                borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(16),
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.map_outlined,
                                      color: colorScheme.outline,
                                      size: 32,
                                    ),
                                    const SizedBox(height: GpsSpacing.xs),
                                    Text(
                                      isAr
                                          ? 'Aperçu de la carte'
                                          : 'Carte indisponible (hors-ligne)',
                                      style: theme.textTheme.labelSmall
                                          ?.copyWith(
                                            color: colorScheme.onSurfaceVariant,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: GpsSpacing.lg),

                      // Reviews List Section
                      _buildSectionTitle(
                        theme,
                        isAr ? 'Avis des patients' : 'Avis des patients',
                      ),
                      const SizedBox(height: GpsSpacing.xs),
                      _buildReviewsSection(context, ref, detail, isAr),
                    ],
                  ),
                ),
              ),

              // Sticky Bottom Action CTA
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(GpsSpacing.md),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    border: Border(
                      top: BorderSide(
                        color: colorScheme.outlineVariant,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      if (doc.offersTelehealth == true) ...[
                        Expanded(
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  GpsRadii.md,
                                ),
                              ),
                            ),
                            onPressed: () {
                              ref
                                  .read(bookingDraftProvider.notifier)
                                  .startBooking(
                                    doctorId: doctorId,
                                    doctor: doc,
                                    modeFilter: 'telehealth',
                                  );
                              context.push(
                                '${GpsRoutes.doctorBooking(doctorId)}?mode=telehealth',
                              );
                            },
                            icon: const Icon(Icons.videocam_outlined),
                            label: Text(
                              isAr ? 'Téléconsultation' : 'Téléconsultation',
                            ),
                          ),
                        ),
                        const SizedBox(width: GpsSpacing.sm),
                      ],
                      Expanded(
                        child: PrimaryButton(
                          label: isAr ? 'Réserver' : 'Prendre RDV',
                          onPressed: () {
                            ref.read(bookingDraftProvider.notifier).startBooking(
                              doctorId: doctorId,
                              doctor: doc,
                            );
                            context.push(GpsRoutes.doctorBooking(doctorId));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) {
          if (error is DoctorNotFoundException) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(GpsSpacing.md),
                child: ErrorState(
                  title: 'Médecin introuvable',
                  message:
                      'Le profil de ce spécialiste n\'est pas disponible.',
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
                defaultTitle: 'Erreur',
                defaultMessage:
                    'Impossible de charger le profil de ce spécialiste.',
                onRetry: () => ref.refresh(doctorDetailProvider(doctorId)),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    return Text(
      title,
      style: theme.textTheme.headlineSmall?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onSurface,
      ),
    );
  }

  Widget _buildReviewsSection(
    BuildContext context,
    WidgetRef ref,
    DoctorDetailState detail,
    bool isAr,
  ) {
    final reviews = detail.reviews;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (reviews.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: GpsSpacing.md),
        child: Text(
          isAr ? 'Aucun avis pour le moment.' : 'Aucun avis pour le moment.',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isAr ? 'Patient vérifié' : 'Patient vérifié',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
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
                              isAr ? 'ar' : 'fr',
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
          TextButton(
            onPressed: () {
              ref
                  .read(doctorDetailProvider(doctorId).notifier)
                  .loadMoreReviews();
            },
            child: Text(isAr ? 'Voir plus d\'avis' : 'Voir plus d\'avis'),
          ),
        ],
      ],
    );
  }
}

class _CollapsibleText extends StatefulWidget {
  const _CollapsibleText({required this.text});

  final String text;

  @override
  State<_CollapsibleText> createState() => _CollapsibleTextState();
}

class _CollapsibleTextState extends State<_CollapsibleText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isAr = Localizations.localeOf(context).languageCode == 'ar';

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
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              _expanded
                  ? (isAr ? 'Voir moins' : 'Voir moins')
                  : (isAr ? 'Lire la suite' : 'Lire la suite'),
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
