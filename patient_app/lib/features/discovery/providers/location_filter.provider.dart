import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'discovery_repositories.provider.dart';

part 'location_filter.provider.g.dart';

@Riverpod(keepAlive: true)
class WilayasFetch extends _$WilayasFetch {
  @override
  Future<List<Wilaya>> build() async {
    return ref.watch(geoRepositoryProvider).fetchWilayas();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final repo = ref.read(geoRepositoryProvider);
    repo.clearWilayasCache();
    state = await AsyncValue.guard(repo.fetchWilayas);
  }
}

@Riverpod(keepAlive: true)
class CommunesFetch extends _$CommunesFetch {
  @override
  Future<Map<String, List<Commune>>> build() async => {};

  Future<List<Commune>> fetchForWilaya(
    String wilayaCode, {
    bool forceRefresh = false,
  }) async {
    final currentMap = state.value ?? {};
    if (!forceRefresh && currentMap.containsKey(wilayaCode)) {
      return currentMap[wilayaCode]!;
    }

    final repo = ref.read(geoRepositoryProvider);
    if (forceRefresh) {
      repo.clearCommunesCache(wilayaCode);
    }

    final list = await repo.fetchCommunes(
      wilayaCode,
      forceRefresh: forceRefresh,
    );
    final updatedMap = Map<String, List<Commune>>.from(currentMap)
      ..[wilayaCode] = list;
    state = AsyncValue.data(updatedMap);
    return list;
  }

  Future<void> refreshWilaya(String wilayaCode) async {
    await fetchForWilaya(wilayaCode, forceRefresh: true);
  }
}

class LocationFilterState {
  const LocationFilterState({this.selectedWilaya, this.selectedCommune});

  final Wilaya? selectedWilaya;
  final Commune? selectedCommune;

  LocationFilterState copyWith({
    Wilaya? selectedWilaya,
    Commune? selectedCommune,
    bool clearWilaya = false,
    bool clearCommune = false,
  }) {
    return LocationFilterState(
      selectedWilaya: clearWilaya
          ? null
          : (selectedWilaya ?? this.selectedWilaya),
      selectedCommune: clearCommune
          ? null
          : (selectedCommune ?? this.selectedCommune),
    );
  }
}

@riverpod
class LocationFilter extends _$LocationFilter {
  @override
  LocationFilterState build() => const LocationFilterState();

  void selectWilaya(Wilaya? wilaya) {
    if (state.selectedWilaya?.code == wilaya?.code) return;

    state = state.copyWith(selectedWilaya: wilaya, clearCommune: true);

    final code = wilaya?.code;
    if (code != null) {
      ref.read(communesFetchProvider.notifier).fetchForWilaya(code);
    }
  }

  void selectCommune(Commune? commune) {
    state = state.copyWith(selectedCommune: commune);
  }

  void clear() => state = const LocationFilterState();
}
