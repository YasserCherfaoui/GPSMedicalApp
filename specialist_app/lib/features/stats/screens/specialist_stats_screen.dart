import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

import '../../profile/providers/specialist_profile.provider.dart';
import '../providers/specialist_stats.provider.dart';

class SpecialistStatsScreen extends ConsumerStatefulWidget {
  const SpecialistStatsScreen({super.key});

  @override
  ConsumerState<SpecialistStatsScreen> createState() =>
      _SpecialistStatsScreenState();
}

class _SpecialistStatsScreenState extends ConsumerState<SpecialistStatsScreen> {
  String _metric = 'appointments';
  String _granularity = 'week';

  Date _defaultFrom() {
    final now = DateTime.now();
    return Date(now.year, now.month, now.day - 30);
  }

  Date _defaultTo() {
    final now = DateTime.now();
    return Date(now.year, now.month, now.day);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final from = _defaultFrom();
    final to = _defaultTo();
    final profileAsync = ref.watch(specialistProfileProvider);
    final overviewAsync = ref.watch(
      specialistStatsOverviewProvider((from: from, to: to)),
    );
    final timeseriesAsync = ref.watch(
      specialistStatsTimeseriesProvider((
        metric: _metric,
        granularity: _granularity,
        from: from,
        to: to,
      )),
    );
    final reviewsAsync = ref.watch(specialistDoctorReviewsProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(specialistStatsOverviewProvider);
        ref.invalidate(specialistStatsTimeseriesProvider);
        ref.invalidate(specialistDoctorReviewsProvider);
      },
      child: ListView(
        padding: const EdgeInsets.all(GpsSpacing.md),
        children: [
          profileAsync.when(
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
            data: (profile) {
              final rating = profile.ratingAverage;
              final count = profile.ratingCount;
              if (rating == null) return const SizedBox.shrink();
              return Card(
                child: ListTile(
                  title: Text(l10n.specialistStatsRatingTitle),
                  subtitle: RatingDisplay(rating: rating, count: count ?? 0),
                ),
              );
            },
          ),
          const SizedBox(height: GpsSpacing.sm),
          overviewAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => ErrorState(
              title: l10n.specialistStatsLoadError,
              onRetry: () => ref.invalidate(specialistStatsOverviewProvider),
            ),
            data: (overview) => Wrap(
              spacing: GpsSpacing.sm,
              runSpacing: GpsSpacing.sm,
              children: [
                _StatCard(
                  label: l10n.specialistStatsAppointments,
                  value: '${overview.appointmentsTotal ?? 0}',
                ),
                _StatCard(
                  label: l10n.specialistStatsCompleted,
                  value: '${overview.appointmentsCompleted ?? 0}',
                ),
                _StatCard(
                  label: l10n.specialistStatsRevenue,
                  value: '${overview.revenueDzd ?? 0} DZD',
                ),
                _StatCard(
                  label: l10n.specialistStatsNoShowRate,
                  value: overview.noShowRate != null
                      ? '${(overview.noShowRate! * 100).toStringAsFixed(1)} %'
                      : '—',
                ),
              ],
            ),
          ),
          const SizedBox(height: GpsSpacing.lg),
          Text(
            l10n.specialistStatsTrendTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: GpsSpacing.sm),
          SegmentedButton<String>(
            segments: [
              ButtonSegment(
                value: 'appointments',
                label: Text(l10n.specialistStatsMetricAppointments),
              ),
              ButtonSegment(
                value: 'revenue',
                label: Text(l10n.specialistStatsMetricRevenue),
              ),
              ButtonSegment(
                value: 'no_show_rate',
                label: Text(l10n.specialistStatsMetricNoShow),
              ),
              ButtonSegment(
                value: 'new_patients',
                label: Text(l10n.specialistStatsMetricNewPatients),
              ),
            ],
            selected: {_metric},
            onSelectionChanged: (values) {
              setState(() => _metric = values.first);
            },
          ),
          const SizedBox(height: GpsSpacing.sm),
          SegmentedButton<String>(
            segments: [
              ButtonSegment(
                value: 'day',
                label: Text(l10n.specialistStatsGranularityDay),
              ),
              ButtonSegment(
                value: 'week',
                label: Text(l10n.specialistStatsGranularityWeek),
              ),
              ButtonSegment(
                value: 'month',
                label: Text(l10n.specialistStatsGranularityMonth),
              ),
            ],
            selected: {_granularity},
            onSelectionChanged: (values) {
              setState(() => _granularity = values.first);
            },
          ),
          const SizedBox(height: GpsSpacing.md),
          SizedBox(
            height: 220,
            child: timeseriesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) => Center(child: Text(l10n.specialistStatsLoadError)),
              data: (series) {
                final points = series.points?.toList() ?? [];
                if (points.isEmpty) {
                  return Center(child: Text(l10n.specialistStatsChartEmpty));
                }
                return LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false),
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          for (var i = 0; i < points.length; i++)
                            FlSpot(
                              i.toDouble(),
                              (points[i].value ?? 0).toDouble(),
                            ),
                        ],
                        isCurved: true,
                        dotData: const FlDotData(show: false),
                        color: Theme.of(context).colorScheme.primary,
                        barWidth: 3,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: GpsSpacing.lg),
          Text(
            l10n.specialistStatsReviewsTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: GpsSpacing.sm),
          reviewsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => Text(l10n.specialistStatsReviewsLoadError),
            data: (reviews) {
              if (reviews.isEmpty) {
                return Text(l10n.specialistStatsReviewsEmpty);
              }
              return Column(
                children: [
                  for (final review in reviews)
                    Card(
                      child: ListTile(
                        title: RatingDisplay(
                          rating: (review.rating ?? 0).toDouble(),
                          count: 1,
                        ),
                        subtitle: review.comment == null
                            ? null
                            : Text(review.comment!),
                        trailing: review.createdAt == null
                            ? null
                            : Text(
                                DateFormat.yMMMd(locale).format(
                                  review.createdAt!.toLocal(),
                                ),
                              ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(GpsSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: GpsSpacing.xs),
              Text(
                value,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
