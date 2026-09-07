import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

final presenceSettingsRepositoryProvider =
    Provider<PresenceSettingsRepository>((ref) {
  return PresenceSettingsRepository(ref.watch(gpsMedicalClientProvider));
});

/// Specialist presence opt-out (D-39.3). Defaults to visible until patched.
final specialistPresenceSettingsProvider = AsyncNotifierProvider<
  SpecialistPresenceSettingsNotifier,
  PresenceSettings
>(SpecialistPresenceSettingsNotifier.new);

class SpecialistPresenceSettingsNotifier
    extends AsyncNotifier<PresenceSettings> {
  @override
  Future<PresenceSettings> build() async {
    // No GET on the addendum surface — default matches server defaults.
    return const PresenceSettings(
      presenceVisible: true,
      acceptsMessageRequests: true,
    );
  }

  Future<void> setPresenceVisible(bool visible) async {
    final previous = state.valueOrNull;
    state = AsyncData(
      PresenceSettings(
        presenceVisible: visible,
        acceptsMessageRequests:
            previous?.acceptsMessageRequests ?? true,
      ),
    );
    try {
      final updated = await ref
          .read(presenceSettingsRepositoryProvider)
          .update(presenceVisible: visible);
      state = AsyncData(updated);
    } catch (e, st) {
      if (previous != null) {
        state = AsyncData(previous);
      } else {
        state = AsyncError(e, st);
      }
      rethrow;
    }
  }
}
