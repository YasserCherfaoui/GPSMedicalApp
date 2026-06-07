import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/profile_api_error.dart';
import '../utils/profile_display.dart';
import 'profile_repositories.provider.dart';

part 'patient_profile.provider.g.dart';

@Riverpod(keepAlive: true)
class PatientProfile extends _$PatientProfile {
  @override
  Future<Patient> build() async {
    return ref.watch(patientRepositoryProvider).getProfile();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(patientRepositoryProvider).getProfile(),
    );
  }

  Future<Patient> patchProfile(PatientUpdate update) async {
    final previous = state.valueOrNull;
    if (previous != null) {
      state = AsyncValue.data(_mergeOptimistic(previous, update));
    }

    try {
      final updated = await ref.read(patientRepositoryProvider).patchProfile(
        update,
      );
      state = AsyncValue.data(updated);
      return updated;
    } on ProfileValidationException {
      if (previous != null) {
        state = AsyncValue.data(previous);
      }
      rethrow;
    } catch (e) {
      if (previous != null) {
        state = AsyncValue.data(previous);
      }
      rethrow;
    }
  }

  Future<void> deleteAccount() async {
    await ref.read(patientRepositoryProvider).deleteProfile();
    state = const AsyncValue.loading();
  }
}

Patient _mergeOptimistic(Patient previous, PatientUpdate update) {
  return previous.rebuild((b) {
    if (update.fullName != null) b.fullName = update.fullName;
    if (update.email != null) b.email = update.email;
    if (update.birthDate != null) b.birthDate = update.birthDate;
    if (update.gender != null) {
      b.gender = toPatientGender(update.gender);
    }
    if (update.bloodType != null) {
      b.bloodType = toPatientBloodType(update.bloodType);
    }
    if (update.address != null) b.address.replace(update.address!);
    if (update.allergies != null) b.allergies.replace(update.allergies!);
    if (update.chronicConditions != null) {
      b.chronicConditions.replace(update.chronicConditions!);
    }
  });
}
