import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'specialties.provider.g.dart';

@Riverpod(keepAlive: true)
class Specialties extends _$Specialties {
  @override
  Future<List<Specialty>> build() async {
    final client = ref.watch(gpsMedicalClientProvider);
    final response = await client.doctors.specialtiesGet();
    final data = response.data;
    if (data == null) {
      return [];
    }
    return data.toList();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final client = ref.read(gpsMedicalClientProvider);
      final response = await client.doctors.specialtiesGet();
      return response.data?.toList() ?? [];
    });
  }
}
