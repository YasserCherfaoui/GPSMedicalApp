import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/location_filter.provider.dart';
import '../utils/geo_display.dart';
import '../utils/geo_name_search.dart';
import 'wilaya_commune_picker_shimmer.dart';

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
      _searchQuery = _searchController.text;
    });
  }

  bool _matchesQuery(String? nameFr, String? nameAr) {
    return matchesGeoNameQuery(
      query: _searchQuery,
      nameFr: nameFr,
      nameAr: nameAr,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final locationFilter = ref.watch(locationFilterProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
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
              Expanded(
                child: Text(
                  _showingCommunes
                      ? l10n.geoCommunePickerTitle
                      : l10n.geoWilayaPickerTitle,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
                  child: Text(l10n.geoClear),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: GpsSpacing.md,
            vertical: GpsSpacing.sm,
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: _showingCommunes
                  ? l10n.geoSearchCommuneHint
                  : l10n.geoSearchWilayaHint,
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
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: GpsSpacing.md,
              vertical: GpsSpacing.xs,
            ),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton.icon(
                onPressed: () {
                  widget.onLocationChanged(locationFilter.selectedWilaya, null);
                },
                icon: const Icon(Icons.map_outlined, size: 18),
                label: Text(l10n.geoUseWilayaCenter),
              ),
            ),
          ),
        Flexible(
          child: SizedBox(
            height: 300,
            child: _showingCommunes
                ? _buildCommunesList(locationFilter, locale, colorScheme, l10n)
                : _buildWilayasList(locale, colorScheme, l10n),
          ),
        ),
      ],
    );
  }

  Widget _buildWilayasList(
    String locale,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    final wilayasAsync = ref.watch(wilayasFetchProvider);

    return wilayasAsync.when(
      data: (wilayas) {
        final filtered = wilayas
            .where((w) => _matchesQuery(w.nameFr, w.nameAr))
            .toList();

        if (filtered.isEmpty) {
          return EmptyState(title: l10n.geoWilayaEmpty);
        }

        return ListView.builder(
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            final wilaya = filtered[index];
            final name = wilayaDisplayName(wilaya, locale);
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
      loading: () => const WilayaCommunePickerShimmer(),
      error: (err, stack) => ErrorState(
        title: l10n.errorGenericTitle,
        message: l10n.geoWilayasLoadError,
        retryLabel: l10n.retry,
        onRetry: () => ref.read(wilayasFetchProvider.notifier).refresh(),
      ),
    );
  }

  Widget _buildCommunesList(
    LocationFilterState filter,
    String locale,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    final wilayaCode = filter.selectedWilaya?.code;
    if (wilayaCode == null) return const SizedBox.shrink();

    final communesAsync = ref.watch(communesFetchProvider);

    return communesAsync.when(
      data: (communesMap) {
        if (!communesMap.containsKey(wilayaCode)) {
          return const WilayaCommunePickerShimmer();
        }

        final list = communesMap[wilayaCode] ?? [];
        final filtered = list
            .where((c) => _matchesQuery(c.nameFr, c.nameAr))
            .toList();

        if (filtered.isEmpty) {
          return EmptyState(title: l10n.geoCommuneEmpty);
        }

        return ListView.builder(
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            final commune = filtered[index];
            final name = communeDisplayName(commune, locale);
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
      loading: () => const WilayaCommunePickerShimmer(),
      error: (err, stack) => ErrorState(
        title: l10n.errorGenericTitle,
        message: l10n.geoCommunesLoadError,
        retryLabel: l10n.retry,
        onRetry: () =>
            ref.read(communesFetchProvider.notifier).refreshWilaya(wilayaCode),
      ),
    );
  }
}
