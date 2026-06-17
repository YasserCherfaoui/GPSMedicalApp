import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/schedule_repository.dart';
import '../utils/schedule_api_error.dart';
import '../utils/schedule_validation.dart';

final scheduleRepositoryProvider = Provider<ScheduleRepository>((ref) {
  return ScheduleRepository(ref.watch(gpsMedicalClientProvider));
});

final scheduleTemplatesProvider =
    AsyncNotifierProvider<ScheduleTemplatesNotifier, List<ScheduleTemplate>>(
      ScheduleTemplatesNotifier.new,
    );

class ScheduleTemplatesNotifier extends AsyncNotifier<List<ScheduleTemplate>> {
  @override
  Future<List<ScheduleTemplate>> build() async {
    final templates = await ref.read(scheduleRepositoryProvider).listTemplates();
    return templates.toList();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final templates =
          await ref.read(scheduleRepositoryProvider).listTemplates();
      return templates.toList();
    });
  }

  Future<void> saveTemplate({
    String? templateId,
    required int weekday,
    required String startTime,
    required String endTime,
    required int slotDurationMinutes,
    required String mode,
    required bool active,
  }) async {
    final repo = ref.read(scheduleRepositoryProvider);
    final clientErrors = ScheduleValidation.validateTemplate(
      weekday: weekday,
      startTime: startTime,
      endTime: endTime,
      slotDurationMinutes: slotDurationMinutes,
      mode: mode,
    );
    if (clientErrors.isNotEmpty) {
      throw ScheduleValidationException(clientErrors);
    }

    if (!active && templateId != null) {
      await repo.deleteTemplate(templateId);
    } else if (active && templateId != null) {
      await repo.updateTemplate(
        templateId: templateId,
        weekday: weekday,
        startTime: startTime,
        endTime: endTime,
        slotDurationMinutes: slotDurationMinutes,
        mode: mode,
      );
    } else if (active) {
      await repo.createTemplate(
        weekday: weekday,
        startTime: startTime,
        endTime: endTime,
        slotDurationMinutes: slotDurationMinutes,
        mode: mode,
      );
    }

    await refresh();
  }

  Future<void> deleteTemplate(String templateId) async {
    await ref.read(scheduleRepositoryProvider).deleteTemplate(templateId);
    await refresh();
  }
}

final scheduleExceptionsProvider =
    AsyncNotifierProvider<ScheduleExceptionsNotifier, List<ScheduleException>>(
      ScheduleExceptionsNotifier.new,
    );

class ScheduleExceptionsNotifier extends AsyncNotifier<List<ScheduleException>> {
  @override
  Future<List<ScheduleException>> build() async {
    final items = await ref.read(scheduleRepositoryProvider).listExceptions();
    return items.toList();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final items = await ref.read(scheduleRepositoryProvider).listExceptions();
      return items.toList();
    });
  }

  Future<void> addException({
    required DateTime startAt,
    required DateTime endAt,
    required ScheduleExceptionCreateKindEnum kind,
    String? note,
  }) async {
    final clientErrors = ScheduleValidation.validateException(
      startAt: startAt,
      endAt: endAt,
      kind: kind.name,
      note: note,
    );
    if (clientErrors.isNotEmpty) {
      throw ScheduleValidationException(clientErrors);
    }

    await ref.read(scheduleRepositoryProvider).createException(
      startAt: startAt,
      endAt: endAt,
      kind: kind,
      note: note,
    );
    await refresh();
  }
}

final scheduleAvailabilityPreviewProvider = FutureProvider.family<
    List<AvailabilitySlot>,
    ({String doctorId, Date from, Date to})
>((ref, params) async {
  final slots = await ref.read(scheduleRepositoryProvider).previewAvailability(
    doctorId: params.doctorId,
    from: params.from,
    to: params.to,
  );
  return slots.toList();
});
