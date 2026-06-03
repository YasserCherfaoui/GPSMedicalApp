import 'package:flutter/material.dart';

import '../theme/gps_radii.dart';
import '../theme/gps_spacing.dart';
import 'rating_display.dart';
import 'specialty_chip.dart';

/// Renders a premium card summarizing a doctor's credentials, rating, and distance.
class DoctorCard extends StatelessWidget {
  const DoctorCard({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviewCount,
    required this.city,
    required this.fee,
    required this.onBookPressed,
    this.photoUrl,
    this.isVerified = false,
    this.offersTelehealth = false,
    this.distanceKm,
    this.matchPercentage,
    this.isFavorite = false,
    this.onFavoritePressed,
    this.onTap,
    this.specialtyChips,
    super.key,
  });

  final String name;
  final String specialty;
  final double rating;
  final int reviewCount;
  final String city;
  final int fee;
  final VoidCallback onBookPressed;
  final String? photoUrl;
  final bool isVerified;
  final bool offersTelehealth;
  final double? distanceKm;
  final int? matchPercentage;
  final bool isFavorite;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onTap;
  final List<String>? specialtyChips;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    final avatarImage = photoUrl != null && photoUrl!.isNotEmpty
        ? NetworkImage(photoUrl!) as ImageProvider
        : const AssetImage('assets/images/default_avatar.png');

    final photoBlock = Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 96,
          height: 96,
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
        if (isVerified)
          PositionedDirectional(
            bottom: -4,
            end: -4,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.verified,
                color: colorScheme.primary,
                size: 20,
              ),
            ),
          ),
      ],
    );

    final infoBlock = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: GpsSpacing.xs),
                    if (specialtyChips != null && specialtyChips!.isNotEmpty)
                      Wrap(
                        spacing: GpsSpacing.xs,
                        runSpacing: GpsSpacing.xs,
                        children: specialtyChips!
                            .map((label) => SpecialtyChip(label: label))
                            .toList(),
                      )
                    else
                      Text(
                        specialty,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),
              if (matchPercentage != null) ...[
                const SizedBox(width: GpsSpacing.sm),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: GpsSpacing.sm,
                    vertical: GpsSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(GpsRadii.full),
                  ),
                  child: Text(
                    'Match $matchPercentage%',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: GpsSpacing.sm),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: GpsSpacing.md,
            runSpacing: GpsSpacing.xs,
            children: [
              RatingDisplay(rating: rating, count: reviewCount),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: colorScheme.outline,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    distanceKm != null
                        ? '${distanceKm!.toStringAsFixed(1)} km — $city'
                        : city,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: GpsSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$fee DZD',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
              if (offersTelehealth)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.videocam_outlined,
                      size: 16,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      'Téléconsultation',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: GpsSpacing.md),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 36,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(GpsRadii.md),
                      ),
                    ),
                    onPressed: onBookPressed,
                    child: const Text('Prendre RDV'),
                  ),
                ),
              ),
              if (onFavoritePressed != null) ...[
                const SizedBox(width: GpsSpacing.sm),
                SizedBox(
                  height: 36,
                  width: 44,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(GpsRadii.md),
                      ),
                      backgroundColor: colorScheme.surfaceContainerHigh,
                      side: BorderSide.none,
                    ),
                    onPressed: onFavoritePressed,
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : colorScheme.primary,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );

    final rowChildren = isRtl
        ? [infoBlock, const SizedBox(width: GpsSpacing.md), photoBlock]
        : [photoBlock, const SizedBox(width: GpsSpacing.md), infoBlock];

    final card = Card(
      child: Padding(
        padding: const EdgeInsets.all(GpsSpacing.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rowChildren,
        ),
      ),
    );

    if (onTap == null) return card;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(GpsRadii.lg),
      child: card,
    );
  }
}
