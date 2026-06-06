import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/doctor_list.provider.dart';
import '../providers/doctor_search.provider.dart';
import '../providers/specialties.provider.dart';
import '../providers/user_location.provider.dart';
import '../utils/specialty_display.dart';
import '../widgets/discovery_error_view.dart';
import '../widgets/doctor_card_tile.dart';
import '../widgets/doctor_list_shimmer.dart';

class DoctorListScreen extends ConsumerWidget {
  const DoctorListScreen({super.key});

  void _maybeLoadNextPage(
    WidgetRef ref, {
    required int index,
    required int doctorCount,
    required bool hasMore,
    required bool isLoadingMore,
  }) {
    if (!hasMore || isLoadingMore) return;
    if (index < doctorCount - 3) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(doctorListProvider.notifier).loadNextPage();
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final languageCode = Localizations.localeOf(context).languageCode;
    final listStateAsync = ref.watch(doctorListProvider);
    final specialtiesAsync = ref.watch(specialtiesProvider);
    final userLocation = ref.watch(userLocationProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.discoveryAppBarTitle),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              context.push(GpsRoutes.search);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(doctorListProvider.notifier).refresh(),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(GpsSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.discoveryRecommendedTitle,
                      style: theme.textTheme.displayMedium?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: GpsSpacing.md),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(GpsRadii.xl),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              foregroundColor: colorScheme.onPrimary,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  GpsRadii.lg,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: GpsSpacing.lg,
                                vertical: GpsSpacing.sm,
                              ),
                            ),
                            onPressed: () {},
                            child: Text(l10n.discoveryViewList),
                          ),
                          const SizedBox(width: 4),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: colorScheme.onSurfaceVariant,
                              padding: const EdgeInsets.symmetric(
                                horizontal: GpsSpacing.lg,
                                vertical: GpsSpacing.sm,
                              ),
                            ),
                            onPressed: () {
                              final shell = StatefulNavigationShell.of(context);
                              shell.goBranch(1);
                            },
                            child: Text(l10n.discoveryViewMap),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: specialtiesAsync.when(
                data: (specialties) {
                  final parentSpecialties = specialties
                      .where((s) => s.parentId == null)
                      .toList();
                  return Container(
                    height: 52,
                    padding: const EdgeInsets.symmetric(
                      vertical: GpsSpacing.xs,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: GpsSpacing.md,
                      ),
                      itemCount: parentSpecialties.length,
                      itemBuilder: (context, index) {
                        final specialty = parentSpecialties[index];
                        final name = specialtyDisplayName(
                          specialty,
                          languageCode,
                        );

                        return Padding(
                          padding: const EdgeInsetsDirectional.only(
                            end: GpsSpacing.sm,
                          ),
                          child: ActionChip(
                            label: Text(name),
                            onPressed: () {
                              ref
                                  .read(searchFiltersNotifierProvider.notifier)
                                  .reset();
                              ref
                                  .read(searchFiltersNotifierProvider.notifier)
                                  .selectSpecialty(specialty.id);
                              context.push(GpsRoutes.search);
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
                loading: () => const SizedBox(
                  height: 52,
                  child: Center(child: LoadingSkeleton(height: 40)),
                ),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: GpsSpacing.md)),
            listStateAsync.when(
              data: (listState) {
                final doctors = listState.doctors;
                if (doctors.isEmpty) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: EmptyState(
                        title: l10n.discoveryDoctorsEmptyTitle,
                        message: l10n.discoveryDoctorsEmptyMessage,
                        actionLabel: l10n.discoverySearchAction,
                        onAction: () => context.push(GpsRoutes.search),
                      ),
                    ),
                  );
                }

                return SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: GpsSpacing.md,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      if (index == doctors.length) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: GpsSpacing.md),
                          child: LoadingSkeleton.card(),
                        );
                      }

                      _maybeLoadNextPage(
                        ref,
                        index: index,
                        doctorCount: doctors.length,
                        hasMore: listState.hasMore,
                        isLoadingMore: listState.isLoadingMore,
                      );

                      final doc = doctors[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: GpsSpacing.md),
                        child: buildDoctorCardTile(
                          context: context,
                          doc: doc,
                          languageCode: languageCode,
                          userLat: userLocation?.lat,
                          userLng: userLocation?.lng,
                        ),
                      );
                    }, childCount: doctors.length + (listState.hasMore ? 1 : 0)),
                  ),
                );
              },
              loading: () => const DoctorListShimmer(),
              error: (error, stack) => SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(GpsSpacing.md),
                    child: DiscoveryErrorView(
                      error: error,
                      defaultTitle: l10n.errorGenericTitle,
                      defaultMessage: l10n.discoveryDoctorsLoadError,
                      onRetry: () =>
                          ref.read(doctorListProvider.notifier).refresh(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
