import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/search_suggestion_utils.dart';
import 'discovery_repositories.provider.dart';
import 'location_filter.provider.dart';
import 'user_location.provider.dart';

part 'doctor_search.provider.g.dart';

class SearchFilters {
  const SearchFilters({
    this.query = '',
    this.specialtyId,
    this.wilayaCode,
    this.communeCode,
    this.gender,
    this.languages = const [],
    this.acceptsCnas = false,
    this.acceptsCasnos = false,
    this.maxFee = 10000,
    this.offersTelehealth = false,
    this.availableWithinDays,
    this.sort = 'relevance',
    this.locationDisplayLabel,
  });

  final String query;
  final String? specialtyId;
  final String? wilayaCode;
  final String? communeCode;
  final String? locationDisplayLabel;
  final String? gender;
  final List<String> languages;
  final bool acceptsCnas;
  final bool acceptsCasnos;
  final int maxFee;
  final bool offersTelehealth;
  final int? availableWithinDays;
  final String sort;

  int get activeFiltersCount {
    var count = 0;
    if (specialtyId != null) count++;
    if (wilayaCode != null) count++;
    if (communeCode != null) count++;
    if (gender != null) count++;
    if (languages.isNotEmpty) count++;
    if (acceptsCnas) count++;
    if (acceptsCasnos) count++;
    if (maxFee < 10000) count++;
    if (offersTelehealth) count++;
    if (availableWithinDays != null) count++;
    if (sort != 'relevance') count++;
    return count;
  }

  SearchFilters copyWith({
    String? query,
    String? specialtyId,
    String? wilayaCode,
    String? communeCode,
    String? gender,
    List<String>? languages,
    bool? acceptsCnas,
    bool? acceptsCasnos,
    int? maxFee,
    bool? offersTelehealth,
    int? availableWithinDays,
    String? sort,
    String? locationDisplayLabel,
    bool clearSpecialty = false,
    bool clearWilaya = false,
    bool clearCommune = false,
    bool clearGender = false,
    bool clearAvailableWithinDays = false,
    bool clearLocationDisplayLabel = false,
  }) {
    return SearchFilters(
      query: query ?? this.query,
      specialtyId: clearSpecialty ? null : (specialtyId ?? this.specialtyId),
      wilayaCode: clearWilaya ? null : (wilayaCode ?? this.wilayaCode),
      communeCode: clearCommune ? null : (communeCode ?? this.communeCode),
      locationDisplayLabel: clearLocationDisplayLabel
          ? null
          : (locationDisplayLabel ?? this.locationDisplayLabel),
      gender: clearGender ? null : (gender ?? this.gender),
      languages: languages ?? this.languages,
      acceptsCnas: acceptsCnas ?? this.acceptsCnas,
      acceptsCasnos: acceptsCasnos ?? this.acceptsCasnos,
      maxFee: maxFee ?? this.maxFee,
      offersTelehealth: offersTelehealth ?? this.offersTelehealth,
      availableWithinDays: clearAvailableWithinDays
          ? null
          : (availableWithinDays ?? this.availableWithinDays),
      sort: sort ?? this.sort,
    );
  }
}

@Riverpod(keepAlive: true)
class SearchFiltersNotifier extends _$SearchFiltersNotifier {
  @override
  SearchFilters build() => const SearchFilters();

  void updateQuery(String query) => state = state.copyWith(query: query);

  void selectSpecialty(String? specialtyId) {
    state = specialtyId == null
        ? state.copyWith(clearSpecialty: true)
        : state.copyWith(specialtyId: specialtyId);
  }

  void selectWilaya(String? wilayaCode) {
    state = wilayaCode == null
        ? state.copyWith(
            clearWilaya: true,
            clearCommune: true,
            clearLocationDisplayLabel: true,
          )
        : state.copyWith(
            wilayaCode: wilayaCode,
            clearCommune: true,
            clearLocationDisplayLabel: true,
          );
  }

  void selectCommune(String? communeCode, {String? displayLabel}) {
    state = communeCode == null
        ? state.copyWith(clearCommune: true, clearLocationDisplayLabel: true)
        : state.copyWith(
            communeCode: communeCode,
            locationDisplayLabel: displayLabel,
          );
  }

  /// Applies a location autosuggest row and resolves the parent wilaya for communes.
  Future<void> applyLocationSuggestion(SuggestItem item) async {
    final id = item.id ?? '';
    if (id.isEmpty) return;

    if (isWilayaCode(id)) {
      selectWilaya(id);
      return;
    }

    selectCommune(id, displayLabel: item.label);

    final commune = await ref
        .read(geoRepositoryProvider)
        .findCommuneById(
          id,
          wilayaNameHint: parseWilayaNameFromSuggestLabel(item.label),
        );

    if (commune == null) return;

    state = state.copyWith(
      wilayaCode: commune.wilayaCode,
      communeCode: commune.id,
      clearLocationDisplayLabel: true,
    );

    await ref
        .read(communesFetchProvider.notifier)
        .fetchForWilaya(commune.wilayaCode);
  }

  void selectGender(String? gender) {
    state = gender == null
        ? state.copyWith(clearGender: true)
        : state.copyWith(gender: gender);
  }

  void toggleLanguage(String lang) {
    final list = List<String>.from(state.languages);
    if (list.contains(lang)) {
      list.remove(lang);
    } else {
      list.add(lang);
    }
    state = state.copyWith(languages: list);
  }

  void toggleCnas(bool value) => state = state.copyWith(acceptsCnas: value);

  void toggleCasnos(bool value) => state = state.copyWith(acceptsCasnos: value);

  void updateMaxFee(int fee) => state = state.copyWith(maxFee: fee);

  void toggleTelehealth(bool value) =>
      state = state.copyWith(offersTelehealth: value);

  void selectAvailableWithinDays(int? days) {
    state = days == null
        ? state.copyWith(clearAvailableWithinDays: true)
        : state.copyWith(availableWithinDays: days);
  }

  void updateSort(String sort) => state = state.copyWith(sort: sort);

  void reset() => state = const SearchFilters();
}

class SearchResultState {
  const SearchResultState({
    required this.doctors,
    required this.currentPage,
    required this.hasMore,
    this.total = 0,
    this.isLoadingMore = false,
  });

  final List<Doctor> doctors;
  final int currentPage;
  final bool hasMore;
  final int total;
  final bool isLoadingMore;

  SearchResultState copyWith({
    List<Doctor>? doctors,
    int? currentPage,
    bool? hasMore,
    int? total,
    bool? isLoadingMore,
  }) {
    return SearchResultState(
      doctors: doctors ?? this.doctors,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      total: total ?? this.total,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

@riverpod
class DoctorSearch extends _$DoctorSearch {
  @override
  Future<SearchResultState> build() async {
    final filters = ref.watch(searchFiltersNotifierProvider);
    return _fetchPage(filters, 1);
  }

  Future<SearchResultState> _fetchPage(SearchFilters filters, int page) async {
    final location = ref.read(userLocationProvider).valueOrNull;
    final result = await ref
        .read(searchRepositoryProvider)
        .searchDoctors(
          filters: filters,
          page: page,
          pageSize: 20,
          userLat: location?.lat,
          userLng: location?.lng,
        );
    final doctors = result.doctors;
    final total = result.total;
    final hasMore = doctors.length == 20 && (page * 20) < total;

    return SearchResultState(
      doctors: doctors,
      currentPage: page,
      hasMore: hasMore,
      total: total,
    );
  }

  Future<void> loadNextPage() async {
    final current = state.value;
    if (current == null ||
        !current.hasMore ||
        current.isLoadingMore ||
        state.isLoading ||
        state.isRefreshing) {
      return;
    }

    state = AsyncValue.data(current.copyWith(isLoadingMore: true));

    final nextPageData = await AsyncValue.guard(() async {
      final filters = ref.read(searchFiltersNotifierProvider);
      final nextPage = current.currentPage + 1;
      final result = await _fetchPage(filters, nextPage);
      return SearchResultState(
        doctors: [...current.doctors, ...result.doctors],
        currentPage: nextPage,
        hasMore: result.hasMore,
        total: result.total,
      );
    });

    if (nextPageData.hasValue) {
      state = AsyncValue.data(nextPageData.value!);
    } else if (nextPageData.hasError) {
      state = AsyncValue.error(nextPageData.error!, nextPageData.stackTrace!);
    }
  }
}

@riverpod
Future<SearchSuggestGet200Response?> searchSuggestions(
  Ref ref,
  String query,
) async {
  if (query.trim().length < 2) return null;

  var isDisposed = false;
  ref.onDispose(() => isDisposed = true);
  await Future<void>.delayed(const Duration(milliseconds: 250));
  if (isDisposed) return null;

  return ref.read(searchRepositoryProvider).suggest(query);
}
