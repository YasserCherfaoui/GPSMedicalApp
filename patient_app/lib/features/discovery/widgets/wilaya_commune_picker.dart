import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import '../providers/location_filter.provider.dart';

class WilayaCommunePicker extends ConsumerStatefulWidget {
  const WilayaCommunePicker({
    required this.onLocationChanged,
    this.closeOnWilayaPick = false,
    super.key,
  });

  final void Function(Wilaya? wilaya, Commune? commune) onLocationChanged;

  /// When false (map screen), picking a wilaya only opens the commune list.
  /// When true (e.g. search filters), each wilaya pick still notifies the parent.
  final bool closeOnWilayaPick;

  @override
  ConsumerState<WilayaCommunePicker> createState() =>
      _WilayaCommunePickerState();
}

class _WilayaCommunePickerState extends ConsumerState<WilayaCommunePicker> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _showingCommunes = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    final filter = ref.read(locationFilterProvider);
    if (filter.selectedWilaya != null) {
      _showingCommunes = true;
    }
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.trim().toLowerCase();
    });
  }

  // Accent-insensitive and prefix match helper
  bool _matchesQuery(String? nameFr, String? nameAr) {
    if (_searchQuery.isEmpty) return true;

    // Normalize French name by removing accents
    String normalize(String input) {
      const withAccents =
          'àáâãäåçèéêëìíîïñòóôõöùúûüýÿÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝ';
      const withoutAccents =
          'aaaaaaceeeeiiiinooooouuuuyyAAAAAACEEEEIIIINOOOOOUUUUY';
      var output = input.toLowerCase();
      for (int i = 0; i < withAccents.length; i++) {
        output = output.replaceAll(withAccents[i], withoutAccents[i]);
      }
      return output;
    }

    final normalizedFr = normalize(nameFr ?? '');
    final nameArLower = (nameAr ?? '').toLowerCase();

    return normalizedFr.startsWith(_searchQuery) ||
        nameArLower.startsWith(_searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    final locationFilter = ref.watch(locationFilterProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Navigation / Header row
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: GpsSpacing.md,
            vertical: GpsSpacing.sm,
          ),
          child: Row(
            children: [
              if (_showingCommunes) ...[
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      _showingCommunes = false;
                      _searchController.clear();
                    });
                  },
                ),
                const SizedBox(width: GpsSpacing.xs),
              ],
              Text(
                _showingCommunes
                    ? (isAr
                          ? 'Sélectionner la Commune'
                          : 'Sélectionner la commune')
                    : (isAr
                          ? 'Sélectionner la Wilaya'
                          : 'Sélectionner la wilaya'),
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              if (locationFilter.selectedWilaya != null)
                TextButton(
                  onPressed: () {
                    ref.read(locationFilterProvider.notifier).clear();
                    widget.onLocationChanged(null, null);
                    setState(() {
                      _showingCommunes = false;
                      _searchController.clear();
                    });
                  },
                  child: Text(isAr ? 'Effacer' : 'Effacer'),
                ),
            ],
          ),
        ),

        // Search text field
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: GpsSpacing.md,
            vertical: GpsSpacing.sm,
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: _showingCommunes
                  ? (isAr
                        ? 'Rechercher une commune...'
                        : 'Rechercher une commune...')
                  : (isAr
                        ? 'Rechercher une wilaya...'
                        : 'Rechercher une wilaya...'),
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => _searchController.clear(),
                    )
                  : null,
            ),
          ),
        ),

        const Divider(),

        if (_showingCommunes && locationFilter.selectedWilaya != null)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: GpsSpacing.md,
              vertical: GpsSpacing.xs,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () {
                  widget.onLocationChanged(
                    locationFilter.selectedWilaya,
                    null,
                  );
                },
                icon: const Icon(Icons.map_outlined, size: 18),
                label: Text(
                  isAr
                      ? 'Utiliser le centre de la wilaya'
                      : 'Utiliser le centre de la wilaya',
                ),
              ),
            ),
          ),

        // Selector lists
        Flexible(
          child: SizedBox(
            height: 300,
            child: _showingCommunes
                ? _buildCommunesList(locationFilter, isAr, colorScheme)
                : _buildWilayasList(isAr, colorScheme),
          ),
        ),
      ],
    );
  }

  Widget _buildWilayasList(bool isAr, ColorScheme colorScheme) {
    final wilayasAsync = ref.watch(wilayasFetchProvider);

    return wilayasAsync.when(
      data: (wilayas) {
        final filtered = wilayas
            .where((w) => _matchesQuery(w.nameFr, w.nameAr))
            .toList();

        if (filtered.isEmpty) {
          return const Center(child: Text('Aucune wilaya trouvée.'));
        }

        return ListView.builder(
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            final wilaya = filtered[index];
            final name = isAr
                ? (wilaya.nameAr ?? wilaya.nameFr ?? '')
                : (wilaya.nameFr ?? '');
            final isSelected =
                ref.read(locationFilterProvider).selectedWilaya?.code ==
                wilaya.code;

            return ListTile(
              title: Text('${wilaya.code} - $name'),
              selected: isSelected,
              selectedTileColor: colorScheme.primaryContainer.withValues(
                alpha: 0.1,
              ),
              selectedColor: colorScheme.primary,
              trailing: isSelected
                  ? const Icon(Icons.check)
                  : const Icon(Icons.chevron_right),
              onTap: () {
                ref.read(locationFilterProvider.notifier).selectWilaya(wilaya);
                if (widget.closeOnWilayaPick) {
                  widget.onLocationChanged(wilaya, null);
                }
                setState(() {
                  _showingCommunes = true;
                  _searchController.clear();
                });
              },
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) =>
          const Center(child: Text('Erreur lors du chargement des wilayas.')),
    );
  }

  Widget _buildCommunesList(
    LocationFilterState filter,
    bool isAr,
    ColorScheme colorScheme,
  ) {
    final wilayaCode = filter.selectedWilaya?.code;
    if (wilayaCode == null) return const SizedBox.shrink();

    final communesAsync = ref.watch(communesFetchProvider);

    return communesAsync.when(
      data: (communesMap) {
        final list = communesMap[wilayaCode] ?? [];
        final filtered = list
            .where((c) => _matchesQuery(c.nameFr, c.nameAr))
            .toList();

        if (filtered.isEmpty) {
          return const Center(child: Text('Aucune commune trouvée.'));
        }

        return ListView.builder(
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            final commune = filtered[index];
            final name = isAr
                ? (commune.nameAr ?? commune.nameFr ?? '')
                : (commune.nameFr ?? '');
            final isSelected = filter.selectedCommune?.id == commune.id;

            return ListTile(
              title: Text(name),
              selected: isSelected,
              selectedTileColor: colorScheme.primaryContainer.withValues(
                alpha: 0.1,
              ),
              selectedColor: colorScheme.primary,
              trailing: isSelected ? const Icon(Icons.check) : null,
              onTap: () {
                ref
                    .read(locationFilterProvider.notifier)
                    .selectCommune(commune);
                widget.onLocationChanged(filter.selectedWilaya, commune);
              },
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) =>
          const Center(child: Text('Erreur lors du chargement des communes.')),
    );
  }
}
