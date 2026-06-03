import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_filter.provider.g.dart';

@Riverpod(keepAlive: true)
class WilayasFetch extends _$WilayasFetch {
  @override
  Future<List<Wilaya>> build() async {
    final client = ref.watch(gpsMedicalClientProvider);
    final response = await client.geolocation.geoWilayasGet();
    return response.data?.toList() ?? [];
  }
}

@Riverpod(keepAlive: true)
class CommunesFetch extends _$CommunesFetch {
  @override
  Future<Map<String, List<Commune>>> build() async {
    return {};
  }

  Future<List<Commune>> fetchForWilaya(String wilayaCode) async {
    final currentMap = state.value ?? {};
    if (currentMap.containsKey(wilayaCode)) {
      return currentMap[wilayaCode]!;
    }

    final client = ref.read(gpsMedicalClientProvider);
    final response = await client.geolocation.geoWilayasWilayaCodeCommunesGet(
      wilayaCode: wilayaCode,
    );
    final list = response.data?.toList() ?? [];

    final updatedMap = Map<String, List<Commune>>.from(currentMap)
      ..[wilayaCode] = list;
    state = AsyncValue.data(updatedMap);
    return list;
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
  LocationFilterState build() {
    return const LocationFilterState();
  }

  void selectWilaya(Wilaya? wilaya) {
    if (state.selectedWilaya?.code == wilaya?.code) return;

    state = state.copyWith(selectedWilaya: wilaya, clearCommune: true);

    if (wilaya != null && wilaya.code != null) {
      ref.read(communesFetchProvider.notifier).fetchForWilaya(wilaya.code!);
    }
  }

  void selectCommune(Commune? commune) {
    state = state.copyWith(selectedCommune: commune);
  }

  void clear() {
    state = const LocationFilterState();
  }
}
