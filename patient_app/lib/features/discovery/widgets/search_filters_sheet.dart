import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import '../providers/doctor_search.provider.dart';
import '../providers/location_filter.provider.dart';
import '../providers/specialties.provider.dart';
import 'specialties_picker.dart';
import 'wilaya_commune_picker.dart';

class SearchFiltersSheet extends ConsumerWidget {
  const SearchFiltersSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final filters = ref.watch(searchFiltersNotifierProvider);
    final searchFiltersNotifier = ref.read(
      searchFiltersNotifierProvider.notifier,
    );
    final isAr = Localizations.localeOf(context).languageCode == 'ar';

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(GpsSpacing.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isAr ? 'Filtres de recherche' : 'Filtres de recherche',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      searchFiltersNotifier.reset();
                    },
                    child: Text(isAr ? 'Réinitialiser' : 'Réinitialiser'),
                  ),
                ],
              ),
            ),
            const Divider(),

            // Filters list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.md),
                children: [
                  // Specialty Select
                  _buildSectionHeader(
                    theme,
                    isAr ? 'Spécialité' : 'Spécialité',
                  ),
                  _buildSpecialtySelector(
                    context,
                    ref,
                    filters,
                    searchFiltersNotifier,
                    isAr,
                  ),
                  const SizedBox(height: GpsSpacing.md),

                  // Location Select (Wilaya / Commune)
                  _buildSectionHeader(
                    theme,
                    isAr
                        ? 'Localisation (Wilaya / Commune)'
                        : 'Localisation (Wilaya / Commune)',
                  ),
                  _buildLocationSelector(
                    context,
                    ref,
                    filters,
                    searchFiltersNotifier,
                    isAr,
                  ),
                  const SizedBox(height: GpsSpacing.md),

                  // Gender Select
                  _buildSectionHeader(theme, isAr ? 'Genre' : 'Genre'),
                  Row(
                    children: [
                      _buildGenderChip(
                        ref,
                        filters,
                        searchFiltersNotifier,
                        null,
                        isAr ? 'Tous' : 'Tous',
                      ),
                      const SizedBox(width: GpsSpacing.sm),
                      _buildGenderChip(
                        ref,
                        filters,
                        searchFiltersNotifier,
                        'male',
                        isAr ? 'Homme' : 'Homme',
                      ),
                      const SizedBox(width: GpsSpacing.sm),
                      _buildGenderChip(
                        ref,
                        filters,
                        searchFiltersNotifier,
                        'female',
                        isAr ? 'Femme' : 'Femme',
                      ),
                    ],
                  ),
                  const SizedBox(height: GpsSpacing.md),

                  // Languages
                  _buildSectionHeader(
                    theme,
                    isAr ? 'Langues parlées' : 'Langues parlées',
                  ),
                  Wrap(
                    spacing: GpsSpacing.sm,
                    runSpacing: GpsSpacing.xs,
                    children: [
                      _buildLanguageChip(
                        ref,
                        filters,
                        searchFiltersNotifier,
                        'ar',
                        'العربية (Arabe)',
                      ),
                      _buildLanguageChip(
                        ref,
                        filters,
                        searchFiltersNotifier,
                        'fr',
                        'Français',
                      ),
                      _buildLanguageChip(
                        ref,
                        filters,
                        searchFiltersNotifier,
                        'en',
                        'English',
                      ),
                      _buildLanguageChip(
                        ref,
                        filters,
                        searchFiltersNotifier,
                        'ber',
                        'Tamazight',
                      ),
                    ],
                  ),
                  const SizedBox(height: GpsSpacing.md),

                  // Max Fee Slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSectionHeader(
                        theme,
                        isAr ? 'Tarif maximum' : 'Tarif maximum',
                      ),
                      Text(
                        '${filters.maxFee} DZD',
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
                    label: '${filters.maxFee} DZD',
                    activeColor: colorScheme.primary,
                    onChanged: (val) {
                      searchFiltersNotifier.updateMaxFee(val.round());
                    },
                  ),
                  const SizedBox(height: GpsSpacing.md),

                  // Telehealth Toggle
                  SwitchListTile(
                    title: Text(
                      isAr
                          ? 'Téléconsultation disponible'
                          : 'Téléconsultation disponible',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: filters.offersTelehealth,
                    activeColor: colorScheme.primary,
                    onChanged: (val) {
                      searchFiltersNotifier.toggleTelehealth(val);
                    },
                  ),
                  const SizedBox(height: GpsSpacing.md),

                  // Insurance Toggles
                  _buildSectionHeader(
                    theme,
                    isAr ? 'Assurances acceptées' : 'Assurances acceptées',
                  ),
                  CheckboxListTile(
                    title: const Text('Conventionné CNAS'),
                    value: filters.acceptsCnas,
                    activeColor: colorScheme.primary,
                    onChanged: (val) =>
                        searchFiltersNotifier.toggleCnas(val ?? false),
                  ),
                  CheckboxListTile(
                    title: const Text('Conventionné CASNOS'),
                    value: filters.acceptsCasnos,
                    activeColor: colorScheme.primary,
                    onChanged: (val) =>
                        searchFiltersNotifier.toggleCasnos(val ?? false),
                  ),
                  const SizedBox(height: GpsSpacing.md),

                  // Sort dropdown
                  _buildSectionHeader(theme, isAr ? 'Trier par' : 'Trier par'),
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
                        child: Text(isAr ? 'Pertinence' : 'Pertinence'),
                      ),
                      DropdownMenuItem(
                        value: 'rating_desc',
                        child: Text(
                          isAr ? 'Note la plus haute' : 'Note la plus haute',
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'fee_asc',
                        child: Text(
                          isAr ? 'Tarif croissant' : 'Tarif croissant',
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'fee_desc',
                        child: Text(
                          isAr ? 'Tarif décroissant' : 'Tarif décroissant',
                        ),
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

            // Confirm Button
            Padding(
              padding: const EdgeInsets.all(GpsSpacing.md),
              child: PrimaryButton(
                label: isAr ? 'Appliquer les filtres' : 'Appliquer les filtres',
                onPressed: () {
                  Navigator.of(context).pop();
                },
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
    bool isAr,
  ) {
    String name = isAr ? 'Toutes' : 'Toutes les spécialités';
    if (filters.specialtyId != null) {
      final specialties = ref.read(specialtiesProvider).value;
      if (specialties != null) {
        final spec = specialties
            .where((s) => s.id == filters.specialtyId)
            .firstOrNull;
        if (spec != null) {
          name = isAr
              ? (spec.nameAr ?? spec.nameFr ?? '')
              : (spec.nameFr ?? '');
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
            Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationSelector(
    BuildContext context,
    WidgetRef ref,
    SearchFilters filters,
    SearchFiltersNotifier searchFiltersNotifier,
    bool isAr,
  ) {
    String text = isAr ? 'Toute l\'Algérie' : 'Toute l\'Algérie';
    if (filters.wilayaCode != null) {
      text = 'Wilaya ${filters.wilayaCode}';
      if (filters.communeCode != null) {
        // Find commune name if communes are loaded
        final communeMap = ref.read(communesFetchProvider).value;
        if (communeMap != null && communeMap.containsKey(filters.wilayaCode)) {
          final commune = communeMap[filters.wilayaCode]!
              .where((c) => c.id == filters.communeCode)
              .firstOrNull;
          if (commune != null) {
            final cName = isAr
                ? (commune.nameAr ?? commune.nameFr ?? '')
                : (commune.nameFr ?? '');
            text = '$text — $cName';
          }
        }
      }
    }

    return InkWell(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderChip(
    WidgetRef ref,
    SearchFilters filters,
    SearchFiltersNotifier searchFiltersNotifier,
    String? genderValue,
    String label,
  ) {
    final isSelected = filters.gender == genderValue;
    final colorScheme = Theme.of(ref.context).colorScheme;

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

  Widget _buildLanguageChip(
    WidgetRef ref,
    SearchFilters filters,
    SearchFiltersNotifier searchFiltersNotifier,
    String langCode,
    String label,
  ) {
    final isSelected = filters.languages.contains(langCode);
    final colorScheme = Theme.of(ref.context).colorScheme;

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: colorScheme.primaryContainer,
      onSelected: (val) {
        searchFiltersNotifier.toggleLanguage(langCode);
      },
    );
  }
}
