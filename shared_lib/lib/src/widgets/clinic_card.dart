import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../theme/gps_radii.dart';
import '../theme/gps_spacing.dart';
import 'rating_display.dart';

/// Layout density for [ClinicCard].
enum ClinicCardVariant {
  /// Full list row with starting price and optional telehealth.
  list,

  /// Compact horizontal card for map bottom sheets.
  map,
}

/// Summary card for a clinic in search, nearby, and discovery lists.
class ClinicCard extends StatelessWidget {
  const ClinicCard({
    required this.name,
    required this.city,
    required this.rating,
    required this.reviewCount,
    required this.onTap,
    this.serviceSummary,
    this.startingFee,
    this.currency = 'DZD',
    this.isVerified = false,
    this.offersTelehealth = false,
    this.distanceKm,
    this.onBookPressed,
    this.variant = ClinicCardVariant.list,
    super.key,
  });

  final String name;
  final String city;
  final double rating;
  final int reviewCount;
  final VoidCallback onTap;
  final String? serviceSummary;
  final int? startingFee;
  final String currency;
  final bool isVerified;
  final bool offersTelehealth;
  final double? distanceKm;
  final VoidCallback? onBookPressed;
  final ClinicCardVariant variant;

  @override
  Widget build(BuildContext context) {
    if (variant == ClinicCardVariant.map) {
      return _buildMapCard(context);
    }
    return _buildListCard(context);
  }

  Widget _buildListCard(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final card = Card(
      child: Padding(
        padding: const EdgeInsets.all(GpsSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(GpsRadii.md),
                  ),
                  child: Icon(
                    Icons.local_hospital_outlined,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(width: GpsSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (isVerified)
                            Icon(
                              Icons.verified,
                              color: colorScheme.primary,
                              size: 18,
                            ),
                        ],
                      ),
                      const SizedBox(height: GpsSpacing.xs),
                      RatingDisplay(rating: rating, count: reviewCount),
                    ],
                  ),
                ),
              ],
            ),
            if (serviceSummary != null && serviceSummary!.isNotEmpty) ...[
              const SizedBox(height: GpsSpacing.sm),
              Text(
                serviceSummary!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            const SizedBox(height: GpsSpacing.sm),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: GpsSpacing.md,
              runSpacing: GpsSpacing.xs,
              children: [
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
                        l10n.clinicCardTelehealth,
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
                if (startingFee != null)
                  Expanded(
                    child: Text(
                      l10n.clinicCardFromPrice(startingFee!, currency),
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                else
                  const Spacer(),
                FilledButton(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: GpsSpacing.md,
                      vertical: GpsSpacing.xs,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(GpsRadii.md),
                    ),
                  ),
                  onPressed: onBookPressed ?? onTap,
                  child: Text(l10n.clinicCardBookCta),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(GpsRadii.lg),
      child: card,
    );
  }

  Widget _buildMapCard(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final card = Card(
      child: Padding(
        padding: const EdgeInsets.all(GpsSpacing.md),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(GpsRadii.md),
              ),
              child: Icon(
                Icons.local_hospital_outlined,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(width: GpsSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  RatingDisplay(rating: rating, count: reviewCount),
                  if (distanceKm != null)
                    Text(
                      '${distanceKm!.toStringAsFixed(1)} km',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                ],
              ),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: GpsSpacing.md,
                  vertical: GpsSpacing.xs,
                ),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: onBookPressed ?? onTap,
              child: Text(l10n.clinicCardBookCta),
            ),
          ],
        ),
      ),
    );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(GpsRadii.lg),
      child: card,
    );
  }
}
