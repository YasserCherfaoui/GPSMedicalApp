import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import '../providers/doctor_list.provider.dart';
import '../providers/doctor_search.provider.dart';
import '../providers/specialties.provider.dart';
import '../providers/user_location.provider.dart';
import '../widgets/discovery_error_view.dart';
import '../widgets/doctor_card_tile.dart';
import '../widgets/doctor_list_shimmer.dart';

class DoctorListScreen extends ConsumerStatefulWidget {
  const DoctorListScreen({super.key});

  @override
  ConsumerState<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends ConsumerState<DoctorListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    // Fetch next page when last visible card is within 3 of the end (approx 3 * 200px = 600px)
    if (maxScroll - currentScroll <= 600) {
      ref.read(doctorListProvider.notifier).loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final listStateAsync = ref.watch(doctorListProvider);
    final specialtiesAsync = ref.watch(specialtiesProvider);
    final userLocation = ref.watch(userLocationProvider).valueOrNull;
    final isAr = Localizations.localeOf(context).languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: const Text('MedNavigator'),
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
          controller: _scrollController,
          slivers: [
            // Page Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(GpsSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isAr
                          ? 'Spécialistes recommandés'
                          : 'Spécialistes recommandés',
                      style: theme.textTheme.displayMedium?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: GpsSpacing.md),

                    // Segmented Control (List / Map)
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
                            onPressed: () {}, // Already on list
                            child: Text(isAr ? 'Liste' : 'Liste'),
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
                              // Switch to Map tab (branch index 1)
                              final shell = StatefulNavigationShell.of(context);
                              shell.goBranch(1);
                            },
                            child: Text(isAr ? 'Carte' : 'Carte'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Horizontal Filter Chips Row
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
                        final name = isAr
                            ? (specialty.nameAr ?? specialty.nameFr ?? '')
                            : (specialty.nameFr ?? '');

                        return Padding(
                          padding: const EdgeInsetsDirectional.only(
                            end: GpsSpacing.sm,
                          ),
                          child: ActionChip(
                            label: Text(name),
                            onPressed: () {
                              // Reset filters and select this specialty, then push to Search screen
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

            // Spacing
            const SliverToBoxAdapter(child: SizedBox(height: GpsSpacing.md)),

            // Doctor List Content
            listStateAsync.when(
              data: (listState) {
                final doctors = listState.doctors;
                if (doctors.isEmpty) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: EmptyState(
                        title: isAr ? 'Aucun médecin' : 'Aucun médecin trouvé',
                        message: isAr
                            ? 'Aucun spécialiste ne correspond pour le moment.'
                            : 'Aucun spécialiste ne correspond pour le moment.',
                        actionLabel: isAr ? 'Rechercher' : 'Rechercher',
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
                          padding: EdgeInsets.all(GpsSpacing.md),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final doc = doctors[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: GpsSpacing.md),
                        child: buildDoctorCardTile(
                          context: context,
                          doc: doc,
                          isAr: isAr,
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
                      defaultTitle: 'Erreur de connexion',
                      defaultMessage:
                          'Impossible de charger la liste des spécialistes.',
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
