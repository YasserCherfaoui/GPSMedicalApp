import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import '../providers/doctor_search.provider.dart';
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
    _scrollController.addListener(_onScroll);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _scrollController.removeListener(_onScroll);
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

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= 600) {
      ref.read(doctorSearchProvider.notifier).loadNextPage();
    }
  }

  void _onFocusChanged() {
    setState(() {
      _isSuggestionsVisible =
          _searchController.text.trim().length >= 2 && _focusNode.hasFocus;
    });
  }

  void _openFiltersSheet() {
    _focusNode.unfocus();
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final filters = ref.watch(searchFiltersNotifierProvider);
    final searchResultAsync = ref.watch(doctorSearchProvider);
    final isAr = Localizations.localeOf(context).languageCode == 'ar';

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
              hintText: isAr
                  ? 'Rechercher un médecin, spécialité...'
                  : 'Rechercher un médecin, spécialité...',
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
          // Primary search results list
          searchResultAsync.when(
            data: (searchResult) {
              final doctors = searchResult.doctors;
              if (doctors.isEmpty) {
                return Center(
                  child: EmptyState(
                    title: isAr
                        ? 'Aucun résultat'
                        : 'Aucun médecin ne correspond',
                    message: isAr
                        ? 'Essayez d\'élargir vos filtres ou de modifier votre recherche.'
                        : 'Essayez d\'élargir vos filtres ou de modifier votre recherche.',
                    actionLabel: isAr
                        ? 'Effacer les filtres'
                        : 'Effacer les filtres',
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
                      padding: EdgeInsets.all(GpsSpacing.md),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  final doc = doctors[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: GpsSpacing.md),
                    child: DoctorCard(
                      name: '${doc.title ?? "Dr."} ${doc.fullName ?? ""}',
                      specialty: doc.specialties?.firstOrNull?.nameFr ?? '',
                      rating: doc.ratingAverage ?? 0.0,
                      reviewCount: doc.ratingCount ?? 0,
                      city:
                          doc.practiceAddress?.communeName ??
                          doc.practiceAddress?.wilayaName ??
                          '',
                      fee: doc.consultationFeeDzd ?? 0,
                      photoUrl: doc.photoUrl,
                      isVerified: doc.verified ?? false,
                      offersTelehealth: doc.offersTelehealth ?? false,
                      onBookPressed: () {
                        context.push(
                          '${GpsRoutes.doctorDetail(doc.id ?? '')}?book=true',
                        );
                      },
                      onFavoritePressed: () {},
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: Padding(
                padding: const EdgeInsets.all(GpsSpacing.md),
                child: ErrorState(
                  title: 'Erreur',
                  message: 'Une erreur s\'est produite lors de la recherche.',
                  onRetry: () {
                    // Re-trigger build
                    ref.invalidate(doctorSearchProvider);
                  },
                ),
              ),
            ),
          ),

          // Debounced suggestions overlay
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
                          return const Center(
                            child: Text('Aucune suggestion.'),
                          );
                        }

                        return ListView(
                          padding: const EdgeInsets.all(GpsSpacing.md),
                          children: [
                            if (listSpecialties.isNotEmpty) ...[
                              _buildSuggestionHeader(
                                theme,
                                isAr ? 'Spécialités' : 'Spécialités',
                              ),
                              ...listSpecialties.map(
                                (item) => _buildSuggestionTile(
                                  item,
                                  Icons.medical_services_outlined,
                                  () {
                                    ref
                                        .read(
                                          searchFiltersNotifierProvider
                                              .notifier,
                                        )
                                        .selectSpecialty(item.id);
                                    _searchController.clear();
                                    _focusNode.unfocus();
                                  },
                                ),
                              ),
                            ],
                            if (listDoctors.isNotEmpty) ...[
                              _buildSuggestionHeader(
                                theme,
                                isAr ? 'Médecins' : 'Médecins',
                              ),
                              ...listDoctors.map(
                                (item) => _buildSuggestionTile(
                                  item,
                                  Icons.person_search_outlined,
                                  () {
                                    _searchController.text = item.label ?? '';
                                    _focusNode.unfocus();
                                  },
                                ),
                              ),
                            ],
                            if (listLocations.isNotEmpty) ...[
                              _buildSuggestionHeader(
                                theme,
                                isAr ? 'Localisations' : 'Localisations',
                              ),
                              ...listLocations.map(
                                (item) => _buildSuggestionTile(
                                  item,
                                  Icons.location_on_outlined,
                                  () {
                                    // Filter by location (e.g. wilaya or commune depending on the id)
                                    ref
                                        .read(
                                          searchFiltersNotifierProvider
                                              .notifier,
                                        )
                                        .selectWilaya(item.id);
                                    _searchController.clear();
                                    _focusNode.unfocus();
                                  },
                                ),
                              ),
                            ],
                          ],
                        );
                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (err, stack) => const Center(
                        child: Text(
                          'Erreur lors du chargement des suggestions.',
                        ),
                      ),
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
