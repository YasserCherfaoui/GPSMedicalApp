import 'package:built_collection/built_collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
  });

  final String query;
  final String? specialtyId;
  final String? wilayaCode;
  final String? communeCode;
  final String? gender;
  final List<String> languages;
  final bool acceptsCnas;
  final bool acceptsCasnos;
  final int maxFee;
  final bool offersTelehealth;
  final int? availableWithinDays;
  final String sort;

  int get activeFiltersCount {
    int count = 0;
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
    bool clearSpecialty = false,
    bool clearWilaya = false,
    bool clearCommune = false,
    bool clearGender = false,
    bool clearAvailableWithinDays = false,
  }) {
    return SearchFilters(
      query: query ?? this.query,
      specialtyId: clearSpecialty ? null : (specialtyId ?? this.specialtyId),
      wilayaCode: clearWilaya ? null : (wilayaCode ?? this.wilayaCode),
      communeCode: clearCommune ? null : (communeCode ?? this.communeCode),
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

@riverpod
class SearchFiltersNotifier extends _$SearchFiltersNotifier {
  @override
  SearchFilters build() {
    return const SearchFilters();
  }

  void updateQuery(String query) {
    state = state.copyWith(query: query);
  }

  void selectSpecialty(String? specialtyId) {
    if (specialtyId == null) {
      state = state.copyWith(clearSpecialty: true);
    } else {
      state = state.copyWith(specialtyId: specialtyId);
    }
  }

  void selectWilaya(String? wilayaCode) {
    if (wilayaCode == null) {
      state = state.copyWith(clearWilaya: true, clearCommune: true);
    } else {
      state = state.copyWith(wilayaCode: wilayaCode, clearCommune: true);
    }
  }

  void selectCommune(String? communeCode) {
    if (communeCode == null) {
      state = state.copyWith(clearCommune: true);
    } else {
      state = state.copyWith(communeCode: communeCode);
    }
  }

  void selectGender(String? gender) {
    if (gender == null) {
      state = state.copyWith(clearGender: true);
    } else {
      state = state.copyWith(gender: gender);
    }
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

  void toggleCnas(bool value) {
    state = state.copyWith(acceptsCnas: value);
  }

  void toggleCasnos(bool value) {
    state = state.copyWith(acceptsCasnos: value);
  }

  void updateMaxFee(int fee) {
    state = state.copyWith(maxFee: fee);
  }

  void toggleTelehealth(bool value) {
    state = state.copyWith(offersTelehealth: value);
  }

  void selectAvailableWithinDays(int? days) {
    if (days == null) {
      state = state.copyWith(clearAvailableWithinDays: true);
    } else {
      state = state.copyWith(availableWithinDays: days);
    }
  }

  void updateSort(String sort) {
    state = state.copyWith(sort: sort);
  }

  void reset() {
    state = const SearchFilters();
  }
}

class SearchResultState {
  const SearchResultState({
    required this.doctors,
    required this.currentPage,
    required this.hasMore,
    this.total = 0,
  });

  final List<Doctor> doctors;
  final int currentPage;
  final bool hasMore;
  final int total;
}

@riverpod
class DoctorSearch extends _$DoctorSearch {
  @override
  Future<SearchResultState> build() async {
    final filters = ref.watch(searchFiltersNotifierProvider);
    return _fetchPage(filters, 1);
  }

  Future<SearchResultState> _fetchPage(SearchFilters filters, int page) async {
    final client = ref.read(gpsMedicalClientProvider);

    // Parse gender to API enum if needed, else null
    final response = await client.v1.getSearchApi().searchDoctorsGet(
      q: filters.query.isNotEmpty ? filters.query : null,
      specialtyId: filters.specialtyId,
      wilayaCode: filters.wilayaCode,
      communeId: filters.communeCode,
      gender: filters.gender,
      language: filters.languages.isNotEmpty
          ? BuiltList<String>(filters.languages)
          : null,
      acceptsCnas: filters.acceptsCnas ? true : null,
      acceptsCasnos: filters.acceptsCasnos ? true : null,
      maxFeeDzd: filters.maxFee < 10000 ? filters.maxFee : null,
      telehealth: filters.offersTelehealth ? true : null,
      availableWithinDays: filters.availableWithinDays,
      sort: filters.sort,
      page: page,
      pageSize: 20,
    );

    final paginated = response.data;
    if (paginated == null) {
      return const SearchResultState(
        doctors: [],
        currentPage: 1,
        hasMore: false,
      );
    }
    final doctors = paginated.data?.toList() ?? [];
    final total = paginated.meta?.total ?? 0;
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
    if (current == null || !current.hasMore) return;
    if (state.isLoading || state.isRefreshing || state.hasError) return;

    state = AsyncValue.data(current);

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

  // Riverpod debounce pattern
  var isDisposed = false;
  ref.onDispose(() => isDisposed = true);
  await Future<void>.delayed(const Duration(milliseconds: 250));
  if (isDisposed) return null;

  final client = ref.read(gpsMedicalClientProvider);
  final response = await client.v1.getSearchApi().searchSuggestGet(q: query);
  return response.data;
}
