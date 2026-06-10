import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/doctor_search.provider.dart';
import '../providers/user_location.provider.dart';
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

  void _maybeLoadNextPage({
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
    final searchResultAsync = ref.watch(doctorSearchProvider);
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
              hintText: l10n.searchHint,
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
      body: Stack(
        children: [
          searchResultAsync.when(
            data: (searchResult) {
              final doctors = searchResult.doctors;
              if (doctors.isEmpty) {
                return Center(
                  child: EmptyState(
                    title: l10n.searchEmptyTitle,
                    message: l10n.searchEmptyMessage,
                    actionLabel: l10n.searchClearFilters,
                    onAction: () {
                      _searchController.clear();
                      ref.read(searchFiltersNotifierProvider.notifier).reset();
                    },
                  ),
                );
              }

              return ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(GpsSpacing.md),
                itemCount: doctors.length + (searchResult.hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == doctors.length) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: GpsSpacing.md),
                      child: LoadingSkeleton.card(),
                    );
                  }

                  _maybeLoadNextPage(
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
                      userLat: userLocation?.lat,
                      userLng: userLocation?.lng,
                    ),
                  );
                },
              );
            },
            loading: () =>
                const CustomScrollView(slivers: [DoctorListShimmer()]),
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
                        if (suggestions == null) return const SizedBox.shrink();

                        final listDoctors = suggestions.doctors?.toList() ?? [];
                        final listSpecialties =
                            suggestions.specialties?.toList() ?? [];
                        final listLocations =
                            suggestions.locations?.toList() ?? [];

                        if (listDoctors.isEmpty &&
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
                                    filtersNotifier.selectSpecialty(item.id);
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
                                    _searchController.text = item.label ?? '';
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
                      loading: () =>
                          const Center(child: LoadingSkeleton(height: 40)),
                      error: (err, stack) =>
                          Center(child: Text(l10n.searchSuggestionsLoadError)),
                    );
                  },
                ),
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
