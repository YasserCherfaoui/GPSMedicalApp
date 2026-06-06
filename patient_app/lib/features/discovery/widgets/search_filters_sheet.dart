import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/doctor_search.provider.dart';
import '../providers/discovery_repositories.provider.dart';
import '../providers/location_filter.provider.dart';
import '../providers/specialties.provider.dart';
import '../utils/geo_display.dart';
import '../utils/specialty_display.dart';
import 'specialties_picker.dart';
import 'wilaya_commune_picker.dart';

class SearchFiltersSheet extends ConsumerWidget {
  const SearchFiltersSheet({super.key});

  static int _feeStep(int raw) =>
      ((raw / 500).round() * 500).clamp(0, 10000).toInt();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final languageCode = Localizations.localeOf(context).languageCode;
    final filters = ref.watch(searchFiltersNotifierProvider);
    final searchFiltersNotifier = ref.read(
      searchFiltersNotifierProvider.notifier,
    );

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(GpsSpacing.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.searchFiltersTitle,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: searchFiltersNotifier.reset,
                    child: Text(l10n.searchFiltersReset),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.md),
                children: [
                  _buildSectionHeader(theme, l10n.searchFilterSpecialty),
                  _buildSpecialtySelector(
                    context,
                    ref,
                    filters,
                    searchFiltersNotifier,
                    languageCode,
                    l10n,
                  ),
                  const SizedBox(height: GpsSpacing.md),
                  _buildSectionHeader(theme, l10n.searchFilterLocation),
                  _buildLocationSelector(
                    context,
                    ref,
                    filters,
                    searchFiltersNotifier,
                    languageCode,
                    l10n,
                  ),
                  const SizedBox(height: GpsSpacing.md),
                  _buildSectionHeader(theme, l10n.searchFilterGender),
                  Wrap(
                    spacing: GpsSpacing.sm,
                    runSpacing: GpsSpacing.xs,
                    children: [
                      _buildGenderChip(
                        context,
                        filters,
                        searchFiltersNotifier,
                        null,
                        l10n.searchFilterGenderAny,
                      ),
                      _buildGenderChip(
                        context,
                        filters,
                        searchFiltersNotifier,
                        'male',
                        l10n.searchFilterGenderMale,
                      ),
                      _buildGenderChip(
                        context,
                        filters,
                        searchFiltersNotifier,
                        'female',
                        l10n.searchFilterGenderFemale,
                      ),
                    ],
                  ),
                  const SizedBox(height: GpsSpacing.md),
                  _buildSectionHeader(theme, l10n.searchFilterLanguages),
                  Wrap(
                    spacing: GpsSpacing.sm,
                    runSpacing: GpsSpacing.xs,
                    children: [
                      _buildLanguageChip(
                        context,
                        filters,
                        searchFiltersNotifier,
                        'ar',
                        'العربية',
                      ),
                      _buildLanguageChip(
                        context,
                        filters,
                        searchFiltersNotifier,
                        'fr',
                        'Français',
                      ),
                      _buildLanguageChip(
                        context,
                        filters,
                        searchFiltersNotifier,
                        'en',
                        'English',
                      ),
                      _buildLanguageChip(
                        context,
                        filters,
                        searchFiltersNotifier,
                        'ber',
                        'Tamazight',
                      ),
                    ],
                  ),
                  const SizedBox(height: GpsSpacing.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSectionHeader(theme, l10n.searchFilterMaxFee),
                      Text(
                        l10n.searchFilterMaxFeeValue(filters.maxFee),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: filters.maxFee.toDouble(),
                    min: 0,
                    max: 10000,
                    divisions: 20,
                    label: l10n.searchFilterMaxFeeValue(filters.maxFee),
                    activeColor: colorScheme.primary,
                    onChanged: (val) {
                      searchFiltersNotifier.updateMaxFee(_feeStep(val.round()));
                    },
                  ),
                  const SizedBox(height: GpsSpacing.md),
                  _buildSectionHeader(theme, l10n.searchFilterAvailability),
                  Wrap(
                    spacing: GpsSpacing.sm,
                    runSpacing: GpsSpacing.xs,
                    children: [
                      _buildAvailabilityChip(
                        context,
                        filters,
                        searchFiltersNotifier,
                        null,
                        l10n.searchFilterAvailabilityAll,
                      ),
                      _buildAvailabilityChip(
                        context,
                        filters,
                        searchFiltersNotifier,
                        0,
                        l10n.searchFilterAvailabilityToday,
                      ),
                      _buildAvailabilityChip(
                        context,
                        filters,
                        searchFiltersNotifier,
                        3,
                        l10n.searchFilterAvailability3Days,
                      ),
                      _buildAvailabilityChip(
                        context,
                        filters,
                        searchFiltersNotifier,
                        7,
                        l10n.searchFilterAvailability1Week,
                      ),
                      _buildAvailabilityChip(
                        context,
                        filters,
                        searchFiltersNotifier,
                        30,
                        l10n.searchFilterAvailability1Month,
                      ),
                    ],
                  ),
                  const SizedBox(height: GpsSpacing.md),
                  SwitchListTile(
                    title: Text(
                      l10n.searchFilterTelehealth,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: filters.offersTelehealth,
                    activeTrackColor: colorScheme.primary.withValues(alpha: 0.4),
                    activeColor: colorScheme.primary,
                    onChanged: searchFiltersNotifier.toggleTelehealth,
                  ),
                  const SizedBox(height: GpsSpacing.md),
                  _buildSectionHeader(theme, l10n.searchFilterInsurance),
                  CheckboxListTile(
                    title: Text(l10n.searchFilterInsuranceCnas),
                    value: filters.acceptsCnas,
                    activeColor: colorScheme.primary,
                    onChanged: (val) =>
                        searchFiltersNotifier.toggleCnas(val ?? false),
                  ),
                  CheckboxListTile(
                    title: Text(l10n.searchFilterInsuranceCasnos),
                    value: filters.acceptsCasnos,
                    activeColor: colorScheme.primary,
                    onChanged: (val) =>
                        searchFiltersNotifier.toggleCasnos(val ?? false),
                  ),
                  const SizedBox(height: GpsSpacing.md),
                  _buildSectionHeader(theme, l10n.searchFilterSort),
                  DropdownButtonFormField<String>(
                    value: filters.sort,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(GpsRadii.md),
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'relevance',
                        child: Text(l10n.searchFilterSortRelevance),
                      ),
                      DropdownMenuItem(
                        value: 'rating_desc',
                        child: Text(l10n.searchFilterSortRating),
                      ),
                      DropdownMenuItem(
                        value: 'fee_asc',
                        child: Text(l10n.searchFilterSortFeeAsc),
                      ),
                      DropdownMenuItem(
                        value: 'fee_desc',
                        child: Text(l10n.searchFilterSortFeeDesc),
                      ),
                      DropdownMenuItem(
                        value: 'distance_asc',
                        child: Text(l10n.searchFilterSortDistance),
                      ),
                    ],
                    onChanged: (val) {
                      if (val != null) {
                        searchFiltersNotifier.updateSort(val);
                      }
                    },
                  ),
                  const SizedBox(height: GpsSpacing.lg),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(GpsSpacing.md),
              child: PrimaryButton(
                label: l10n.searchFiltersApply,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(ThemeData theme, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GpsSpacing.sm),
      child: Text(
        title,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildSpecialtySelector(
    BuildContext context,
    WidgetRef ref,
    SearchFilters filters,
    SearchFiltersNotifier searchFiltersNotifier,
    String languageCode,
    AppLocalizations l10n,
  ) {
    var name = l10n.searchFilterSpecialtyAll;
    if (filters.specialtyId != null) {
      final specialties = ref.read(specialtiesProvider).value;
      if (specialties != null) {
        final spec = specialties
            .where((s) => s.id == filters.specialtyId)
            .firstOrNull;
        if (spec != null) {
          name = specialtyDisplayName(spec, languageCode);
        }
      }
    }

    return InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.8,
              maxChildSize: 0.9,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: SpecialtiesPicker(
                    selectedSpecialtyId: filters.specialtyId,
                    onSpecialtySelected: (spec) {
                      searchFiltersNotifier.selectSpecialty(spec.id);
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: GpsSpacing.md,
          vertical: GpsSpacing.sm,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
          borderRadius: BorderRadius.circular(GpsRadii.md),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  String _locationLabel(
    SearchFilters filters,
    WidgetRef ref,
    String languageCode,
    AppLocalizations l10n,
  ) {
    if (filters.wilayaCode == null && filters.communeCode == null) {
      return l10n.searchFilterLocationAll;
    }

    final wilayas = ref.read(wilayasFetchProvider).value ?? [];
    Wilaya? wilaya;
    if (filters.wilayaCode != null) {
      wilaya = wilayas
          .where((w) => w.code == filters.wilayaCode)
          .firstOrNull;
    }

    if (filters.communeCode != null) {
      final communeMap = ref.read(communesFetchProvider).value;
      final wilayaCode = filters.wilayaCode;
      if (communeMap != null && wilayaCode != null) {
        final commune = communeMap[wilayaCode]
            ?.where((c) => c.id == filters.communeCode)
            .firstOrNull;
        if (commune != null) {
          final communeName = communeDisplayName(commune, languageCode);
          final wilayaName = wilaya != null
              ? wilayaDisplayName(wilaya, languageCode)
              : wilayaCode;
          return '$communeName, $wilayaName';
        }
      }

      final cachedCommune = ref
          .read(geoRepositoryProvider)
          .findCommuneInCache(filters.communeCode!);
      if (cachedCommune != null) {
        final communeName = communeDisplayName(cachedCommune, languageCode);
        final cachedWilaya = wilayas
            .where((w) => w.code == cachedCommune.wilayaCode)
            .firstOrNull;
        if (cachedWilaya != null) {
          return '$communeName, ${wilayaDisplayName(cachedWilaya, languageCode)}';
        }
        return communeName;
      }

      if (filters.locationDisplayLabel != null &&
          filters.locationDisplayLabel!.isNotEmpty) {
        return filters.locationDisplayLabel!;
      }

      if (wilaya != null) {
        return wilayaDisplayName(wilaya, languageCode);
      }

      return l10n.searchFilterLocationAll;
    }

    if (wilaya != null) {
      return wilayaDisplayName(wilaya, languageCode);
    }

    return filters.wilayaCode ?? l10n.searchFilterLocationAll;
  }

  Widget _buildLocationSelector(
    BuildContext context,
    WidgetRef ref,
    SearchFilters filters,
    SearchFiltersNotifier searchFiltersNotifier,
    String languageCode,
    AppLocalizations l10n,
  ) {
    final text = _locationLabel(filters, ref, languageCode, l10n);

    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (context) {
              return WilayaCommunePicker(
                onLocationChanged: (wilaya, commune) {
                  searchFiltersNotifier.selectWilaya(wilaya?.code);
                  searchFiltersNotifier.selectCommune(commune?.id);
                },
              );
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: GpsSpacing.md,
            vertical: GpsSpacing.sm,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            borderRadius: BorderRadius.circular(GpsRadii.md),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderChip(
    BuildContext context,
    SearchFilters filters,
    SearchFiltersNotifier searchFiltersNotifier,
    String? genderValue,
    String label,
  ) {
    final isSelected = filters.gender == genderValue;
    final colorScheme = Theme.of(context).colorScheme;

    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: colorScheme.primaryContainer,
      onSelected: (val) {
        if (val) {
          searchFiltersNotifier.selectGender(genderValue);
        }
      },
    );
  }

  Widget _buildAvailabilityChip(
    BuildContext context,
    SearchFilters filters,
    SearchFiltersNotifier searchFiltersNotifier,
    int? days,
    String label,
  ) {
    final isSelected = filters.availableWithinDays == days;
    final colorScheme = Theme.of(context).colorScheme;

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: colorScheme.primaryContainer,
      onSelected: (selected) {
        if (selected) {
          searchFiltersNotifier.selectAvailableWithinDays(days);
        }
      },
    );
  }

  Widget _buildLanguageChip(
    BuildContext context,
    SearchFilters filters,
    SearchFiltersNotifier searchFiltersNotifier,
    String langCode,
    String label,
  ) {
    final isSelected = filters.languages.contains(langCode);
    final colorScheme = Theme.of(context).colorScheme;

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: colorScheme.primaryContainer,
      onSelected: (_) => searchFiltersNotifier.toggleLanguage(langCode),
    );
  }
}
