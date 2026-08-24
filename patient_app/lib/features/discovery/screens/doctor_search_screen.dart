import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/clinic_search.provider.dart';
import '../providers/doctor_search.provider.dart';
import '../providers/user_location.provider.dart';
import '../widgets/clinic_card_tile.dart';
import '../widgets/discovery_entity_toggle.dart';
import '../widgets/discovery_error_view.dart';
import '../widgets/doctor_card_tile.dart';
import '../widgets/doctor_list_shimmer.dart';
import '../widgets/search_filters_sheet.dart';

class DoctorSearchScreen extends ConsumerStatefulWidget {
  const DoctorSearchScreen({super.key});

  @override
  ConsumerState<DoctorSearchScreen> createState() => _DoctorSearchScreenState();
}

class _DoctorSearchScreenState extends ConsumerState<DoctorSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  bool _isSuggestionsVisible = false;

  @override
  void initState() {
    super.initState();
    final currentQuery = ref.read(searchFiltersNotifierProvider).query;
    _searchController.text = currentQuery;
    _searchController.addListener(_onSearchChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _scrollController.dispose();
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final text = _searchController.text;
    ref.read(searchFiltersNotifierProvider.notifier).updateQuery(text);
    setState(() {
      _isSuggestionsVisible = text.trim().length >= 2 && _focusNode.hasFocus;
    });
  }

  void _onFocusChanged() {
    setState(() {
      _isSuggestionsVisible =
          _searchController.text.trim().length >= 2 && _focusNode.hasFocus;
    });
  }

  void _hideSuggestions() {
    setState(() => _isSuggestionsVisible = false);
    _focusNode.unfocus();
  }

  void _maybeLoadNextDoctorsPage({
    required int index,
    required int doctorCount,
    required bool hasMore,
    required bool isLoadingMore,
  }) {
    if (!hasMore || isLoadingMore) return;
    if (index < doctorCount - 3) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(doctorSearchProvider.notifier).loadNextPage();
    });
  }

  void _maybeLoadNextClinicsPage({
    required int index,
    required int clinicCount,
    required bool hasMore,
    required bool isLoadingMore,
  }) {
    if (!hasMore || isLoadingMore) return;
    if (index < clinicCount - 3) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(clinicSearchProvider.notifier).loadNextPage();
    });
  }

  void _openFiltersSheet() {
    _hideSuggestions();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => const FractionallySizedBox(
        heightFactor: 0.85,
        child: SearchFiltersSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(searchFiltersNotifierProvider, (previous, next) {
      if (previous != next) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.jumpTo(0);
          }
        });
      }
    });

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final languageCode = Localizations.localeOf(context).languageCode;
    final filters = ref.watch(searchFiltersNotifierProvider);
    final searchingClinics = filters.entity == DiscoveryEntity.clinics;
    final userLocation = ref.watch(userLocationProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsetsDirectional.only(end: GpsSpacing.md),
          child: TextField(
            controller: _searchController,
            focusNode: _focusNode,
            autofocus: true,
            decoration: InputDecoration(
              hintText: searchingClinics
                  ? l10n.searchHintClinics
                  : l10n.searchHint,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_searchController.text.isNotEmpty)
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                      },
                    ),
                  IconButton(
                    icon: Badge.count(
                      count: filters.activeFiltersCount,
                      isLabelVisible: filters.activeFiltersCount > 0,
                      child: const Icon(Icons.tune),
                    ),
                    onPressed: _openFiltersSheet,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              GpsSpacing.md,
              GpsSpacing.sm,
              GpsSpacing.md,
              GpsSpacing.sm,
            ),
            child: SizedBox(
              width: double.infinity,
              child: DiscoveryEntityToggle(
                value: filters.entity,
                onChanged: (entity) {
                  _hideSuggestions();
                  ref
                      .read(searchFiltersNotifierProvider.notifier)
                      .selectEntity(entity);
                },
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                if (searchingClinics)
                  _ClinicSearchResults(
                    scrollController: _scrollController,
                    userLat: userLocation?.lat,
                    userLng: userLocation?.lng,
                    onClear: () {
                      _searchController.clear();
                      ref.read(searchFiltersNotifierProvider.notifier).reset();
                    },
                    onLoadMore: _maybeLoadNextClinicsPage,
                  )
                else
                  _DoctorSearchResults(
                    scrollController: _scrollController,
                    languageCode: languageCode,
                    userLat: userLocation?.lat,
                    userLng: userLocation?.lng,
                    onClear: () {
                      _searchController.clear();
                      ref.read(searchFiltersNotifierProvider.notifier).reset();
                    },
                    onLoadMore: _maybeLoadNextDoctorsPage,
                  ),
                if (_isSuggestionsVisible)
                  Positioned.fill(
                    child: Container(
                      color: colorScheme.surface.withValues(alpha: 0.95),
                      child: Consumer(
                        builder: (context, ref, child) {
                          final query = _searchController.text.trim();
                          final suggestionsAsync = ref.watch(
                            searchSuggestionsProvider(query),
                          );

                          return suggestionsAsync.when(
                            data: (suggestions) {
                              if (suggestions == null) {
                                return const SizedBox.shrink();
                              }

                              final listDoctors =
                                  suggestions.doctors?.toList() ?? [];
                              final listClinics =
                                  suggestions.clinics?.toList() ?? [];
                              final listSpecialties =
                                  suggestions.specialties?.toList() ?? [];
                              final listLocations =
                                  suggestions.locations?.toList() ?? [];

                              if (listDoctors.isEmpty &&
                                  listClinics.isEmpty &&
                                  listSpecialties.isEmpty &&
                                  listLocations.isEmpty) {
                                return Center(
                                  child: Text(l10n.searchSuggestionsEmpty),
                                );
                              }

                              final filtersNotifier = ref.read(
                                searchFiltersNotifierProvider.notifier,
                              );

                              return ListView(
                                padding: const EdgeInsets.all(GpsSpacing.md),
                                children: [
                                  if (listSpecialties.isNotEmpty) ...[
                                    _buildSuggestionHeader(
                                      theme,
                                      l10n.searchSuggestionsSpecialties,
                                    ),
                                    ...listSpecialties.map(
                                      (item) => _buildSuggestionTile(
                                        item,
                                        Icons.medical_services_outlined,
                                        () {
                                          filtersNotifier.selectEntity(
                                            DiscoveryEntity.doctors,
                                          );
                                          filtersNotifier.selectSpecialty(
                                            item.id,
                                          );
                                          _searchController.clear();
                                          _hideSuggestions();
                                        },
                                      ),
                                    ),
                                  ],
                                  if (listDoctors.isNotEmpty) ...[
                                    _buildSuggestionHeader(
                                      theme,
                                      l10n.searchSuggestionsDoctors,
                                    ),
                                    ...listDoctors.map(
                                      (item) => _buildSuggestionTile(
                                        item,
                                        Icons.person_search_outlined,
                                        () {
                                          filtersNotifier.selectEntity(
                                            DiscoveryEntity.doctors,
                                          );
                                          _searchController.text =
                                              item.label ?? '';
                                          _hideSuggestions();
                                        },
                                      ),
                                    ),
                                  ],
                                  if (listClinics.isNotEmpty) ...[
                                    _buildSuggestionHeader(
                                      theme,
                                      l10n.searchSuggestionsClinics,
                                    ),
                                    ...listClinics.map(
                                      (item) => _buildSuggestionTile(
                                        item,
                                        Icons.local_hospital_outlined,
                                        () {
                                          filtersNotifier.selectEntity(
                                            DiscoveryEntity.clinics,
                                          );
                                          _searchController.text =
                                              item.label ?? '';
                                          _hideSuggestions();
                                        },
                                      ),
                                    ),
                                  ],
                                  if (listLocations.isNotEmpty) ...[
                                    _buildSuggestionHeader(
                                      theme,
                                      l10n.searchSuggestionsLocations,
                                    ),
                                    ...listLocations.map(
                                      (item) => _buildSuggestionTile(
                                        item,
                                        Icons.location_on_outlined,
                                        () async {
                                          await filtersNotifier
                                              .applyLocationSuggestion(item);
                                          _searchController.clear();
                                          _hideSuggestions();
                                        },
                                      ),
                                    ),
                                  ],
                                ],
                              );
                            },
                            loading: () => const Center(
                              child: LoadingSkeleton(height: 40),
                            ),
                            error: (err, stack) => Center(
                              child: Text(l10n.searchSuggestionsLoadError),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionHeader(ThemeData theme, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: GpsSpacing.sm,
        horizontal: GpsSpacing.xs,
      ),
      child: Text(
        title.toUpperCase(),
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  Widget _buildSuggestionTile(
    SuggestItem item,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, size: 20),
      title: Text(item.label ?? ''),
      onTap: onTap,
    );
  }
}

class _DoctorSearchResults extends ConsumerWidget {
  const _DoctorSearchResults({
    required this.scrollController,
    required this.languageCode,
    required this.userLat,
    required this.userLng,
    required this.onClear,
    required this.onLoadMore,
  });

  final ScrollController scrollController;
  final String languageCode;
  final double? userLat;
  final double? userLng;
  final VoidCallback onClear;
  final void Function({
    required int index,
    required int doctorCount,
    required bool hasMore,
    required bool isLoadingMore,
  })
  onLoadMore;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final searchResultAsync = ref.watch(doctorSearchProvider);

    return searchResultAsync.when(
      data: (searchResult) {
        final doctors = searchResult.doctors;
        if (doctors.isEmpty) {
          return Center(
            child: EmptyState(
              title: l10n.searchEmptyTitle,
              message: l10n.searchEmptyMessage,
              actionLabel: l10n.searchClearFilters,
              onAction: onClear,
            ),
          );
        }

        return ListView.builder(
          controller: scrollController,
          padding: const EdgeInsets.all(GpsSpacing.md),
          itemCount: doctors.length + (searchResult.hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == doctors.length) {
              return const Padding(
                padding: EdgeInsets.only(bottom: GpsSpacing.md),
                child: LoadingSkeleton.card(),
              );
            }

            onLoadMore(
              index: index,
              doctorCount: doctors.length,
              hasMore: searchResult.hasMore,
              isLoadingMore: searchResult.isLoadingMore,
            );

            final doc = doctors[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: GpsSpacing.md),
              child: buildDoctorCardTile(
                context: context,
                doc: doc,
                languageCode: languageCode,
                userLat: userLat,
                userLng: userLng,
              ),
            );
          },
        );
      },
      loading: () => const CustomScrollView(slivers: [DoctorListShimmer()]),
      error: (error, stack) => Center(
        child: Padding(
          padding: const EdgeInsets.all(GpsSpacing.md),
          child: DiscoveryErrorView(
            error: error,
            defaultTitle: l10n.errorGenericTitle,
            defaultMessage: l10n.searchLoadError,
            onRetry: () => ref.invalidate(doctorSearchProvider),
          ),
        ),
      ),
    );
  }
}

class _ClinicSearchResults extends ConsumerWidget {
  const _ClinicSearchResults({
    required this.scrollController,
    required this.userLat,
    required this.userLng,
    required this.onClear,
    required this.onLoadMore,
  });

  final ScrollController scrollController;
  final double? userLat;
  final double? userLng;
  final VoidCallback onClear;
  final void Function({
    required int index,
    required int clinicCount,
    required bool hasMore,
    required bool isLoadingMore,
  })
  onLoadMore;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final searchResultAsync = ref.watch(clinicSearchProvider);

    return searchResultAsync.when(
      data: (searchResult) {
        final clinics = searchResult.clinics;
        if (clinics.isEmpty) {
          return Center(
            child: EmptyState(
              title: l10n.searchEmptyClinicsTitle,
              message: l10n.searchEmptyClinicsMessage,
              actionLabel: l10n.searchClearFilters,
              onAction: onClear,
            ),
          );
        }

        return ListView.builder(
          controller: scrollController,
          padding: const EdgeInsets.all(GpsSpacing.md),
          itemCount: clinics.length + (searchResult.hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == clinics.length) {
              return const Padding(
                padding: EdgeInsets.only(bottom: GpsSpacing.md),
                child: LoadingSkeleton.card(),
              );
            }

            onLoadMore(
              index: index,
              clinicCount: clinics.length,
              hasMore: searchResult.hasMore,
              isLoadingMore: searchResult.isLoadingMore,
            );

            final clinic = clinics[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: GpsSpacing.md),
              child: buildClinicCardTile(
                context: context,
                clinic: clinic,
                userLat: userLat,
                userLng: userLng,
              ),
            );
          },
        );
      },
      loading: () => const CustomScrollView(slivers: [DoctorListShimmer()]),
      error: (error, stack) => Center(
        child: Padding(
          padding: const EdgeInsets.all(GpsSpacing.md),
          child: DiscoveryErrorView(
            error: error,
            defaultTitle: l10n.errorGenericTitle,
            defaultMessage: l10n.searchLoadError,
            onRetry: () => ref.invalidate(clinicSearchProvider),
          ),
        ),
      ),
    );
  }
}
