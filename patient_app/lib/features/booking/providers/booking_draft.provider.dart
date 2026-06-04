import 'dart:convert';

import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/booking_api_error.dart';
import '../utils/booking_dates.dart';
import '../utils/booking_enums.dart';
import 'booking_repositories.provider.dart';

part 'booking_draft.provider.g.dart';

const _draftPrefsKey = 'booking_draft_v1';

class BookingDraftState {
  const BookingDraftState({
    this.doctorId,
    this.doctor,
    this.modeFilter = 'both',
    this.selectedSlot,
    this.slotLockExpiresAt,
    this.step = 1,
    this.dependentId,
    this.reason = '',
    this.rescheduleAppointmentId,
    this.pendingResumePrompt = false,
  });

  final String? doctorId;
  final Doctor? doctor;
  final String modeFilter;
  final AvailabilitySlot? selectedSlot;
  final DateTime? slotLockExpiresAt;
  final int step;
  final String? dependentId;
  final String reason;
  final String? rescheduleAppointmentId;
  final bool pendingResumePrompt;

  bool get hasActiveLock {
    if (selectedSlot == null || slotLockExpiresAt == null) return false;
    return DateTime.now().isBefore(slotLockExpiresAt!);
  }

  bool get isReschedule => rescheduleAppointmentId != null;

  Duration? get lockRemaining {
    if (slotLockExpiresAt == null) return null;
    final diff = slotLockExpiresAt!.difference(DateTime.now());
    if (diff.isNegative) return Duration.zero;
    return diff;
  }

  BookingDraftState copyWith({
    String? doctorId,
    Doctor? doctor,
    String? modeFilter,
    AvailabilitySlot? selectedSlot,
    DateTime? slotLockExpiresAt,
    bool clearSlot = false,
    int? step,
    String? dependentId,
    bool clearDependent = false,
    String? reason,
    String? rescheduleAppointmentId,
    bool clearReschedule = false,
    bool? pendingResumePrompt,
  }) {
    return BookingDraftState(
      doctorId: doctorId ?? this.doctorId,
      doctor: doctor ?? this.doctor,
      modeFilter: modeFilter ?? this.modeFilter,
      selectedSlot: clearSlot ? null : (selectedSlot ?? this.selectedSlot),
      slotLockExpiresAt: clearSlot
          ? null
          : (slotLockExpiresAt ?? this.slotLockExpiresAt),
      step: step ?? this.step,
      dependentId: clearDependent ? null : (dependentId ?? this.dependentId),
      reason: reason ?? this.reason,
      rescheduleAppointmentId: clearReschedule
          ? null
          : (rescheduleAppointmentId ?? this.rescheduleAppointmentId),
      pendingResumePrompt:
          pendingResumePrompt ?? this.pendingResumePrompt,
    );
  }

  Map<String, dynamic> toJson() => {
    'doctorId': doctorId,
    'modeFilter': modeFilter,
    'step': step,
    'dependentId': dependentId,
    'reason': reason,
    'rescheduleAppointmentId': rescheduleAppointmentId,
    if (selectedSlot != null) ...{
      'slotStartAt': selectedSlot!.startAt?.toUtc().toIso8601String(),
      'slotEndAt': selectedSlot!.endAt?.toUtc().toIso8601String(),
      'slotMode': slotModeWire(selectedSlot!.mode),
      'slotLockToken': selectedSlot!.slotLockToken,
    },
    if (slotLockExpiresAt != null)
      'slotLockExpiresAt': slotLockExpiresAt!.toUtc().toIso8601String(),
  };
}

@Riverpod(keepAlive: true)
class BookingDraft extends _$BookingDraft {
  @override
  BookingDraftState build() {
    _loadPersistedDraft();
    return const BookingDraftState();
  }

  Future<void> _loadPersistedDraft() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_draftPrefsKey);
    if (raw == null) return;
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      final doctorId = map['doctorId'] as String?;
      if (doctorId == null) return;
      AvailabilitySlot? slot;
      final startStr = map['slotStartAt'] as String?;
      if (startStr != null) {
        slot = AvailabilitySlot(
          (b) => b
            ..startAt = DateTime.parse(startStr)
            ..endAt = map['slotEndAt'] != null
                ? DateTime.parse(map['slotEndAt'] as String)
                : null
            ..mode = parseSlotMode(map['slotMode'] as String?)
            ..slotLockToken = map['slotLockToken'] as String?,
        );
      }
      DateTime? expires;
      final expStr = map['slotLockExpiresAt'] as String?;
      if (expStr != null) {
        expires = DateTime.parse(expStr);
      }
      state = BookingDraftState(
        doctorId: doctorId,
        modeFilter: map['modeFilter'] as String? ?? 'both',
        selectedSlot: slot,
        slotLockExpiresAt: expires,
        step: map['step'] as int? ?? 1,
        dependentId: map['dependentId'] as String?,
        reason: map['reason'] as String? ?? '',
        rescheduleAppointmentId: map['rescheduleAppointmentId'] as String?,
        pendingResumePrompt: true,
      );
    } catch (_) {
      await prefs.remove(_draftPrefsKey);
    }
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    if (state.doctorId == null) {
      await prefs.remove(_draftPrefsKey);
      return;
    }
    await prefs.setString(_draftPrefsKey, jsonEncode(state.toJson()));
  }

  void startBooking({
    required String doctorId,
    required Doctor doctor,
    String modeFilter = 'both',
    String? rescheduleAppointmentId,
  }) {
    state = BookingDraftState(
      doctorId: doctorId,
      doctor: doctor,
      modeFilter: modeFilter,
      rescheduleAppointmentId: rescheduleAppointmentId,
      step: 1,
    );
    _persist();
  }

  void selectSlot(AvailabilitySlot slot) {
    state = state.copyWith(
      selectedSlot: slot,
      slotLockExpiresAt: DateTime.now().add(kSlotLockDuration),
      step: 1,
    );
    _persist();
  }

  void clearSlotLock() {
    state = state.copyWith(clearSlot: true);
    _persist();
  }

  void setStep(int step) {
    state = state.copyWith(step: step);
    _persist();
  }

  void setDependent(String? dependentId) {
    state = state.copyWith(
      dependentId: dependentId,
      clearDependent: dependentId == null,
    );
    _persist();
  }

  void setReason(String reason) {
    state = state.copyWith(reason: reason);
    _persist();
  }

  void dismissResumePrompt() {
    state = state.copyWith(pendingResumePrompt: false);
  }

  Future<void> clearDraft() async {
    state = const BookingDraftState();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_draftPrefsKey);
  }

  Future<Appointment> submitCreate() async {
    final doctorId = state.doctorId;
    final slot = state.selectedSlot;
    if (doctorId == null || slot == null) {
      throw StateError('Incomplete booking draft');
    }
    final repo = ref.read(appointmentRepositoryProvider);
    final availRepo = ref.read(availabilityRepositoryProvider);

    final start = slot.startAt;
    final mode = slot.mode;
    if (start == null || mode == null) {
      throw StateError('Invalid slot');
    }
    final modeWire = slotModeWire(mode);

    String lockToken = slot.slotLockToken ?? '';
    if (!state.hasActiveLock || lockToken.isEmpty) {
      final day = start.toLocal().toDate();
      final slots = await availRepo.fetchSlots(
        doctorId: doctorId,
        from: day,
        to: day,
        mode: modeWire,
      );
      final match = slots.where((s) {
        return s.startAt?.toUtc() == start.toUtc() && s.mode == mode;
      }).firstOrNull;
      if (match?.slotLockToken == null) {
        throw const SlotTakenException();
      }
      lockToken = match!.slotLockToken!;
      state = state.copyWith(selectedSlot: match);
    }

    final create = AppointmentCreate(
      (b) => b
        ..doctorId = doctorId
        ..startAt = start.toUtc()
        ..mode = toCreateMode(mode)
        ..slotLockToken = lockToken
        ..reason = state.reason.isNotEmpty ? state.reason : null
        ..dependentId = state.dependentId,
    );
    return repo.create(create);
  }

  Future<Appointment> submitReschedule() async {
    final appointmentId = state.rescheduleAppointmentId;
    final slot = state.selectedSlot;
    if (appointmentId == null || slot?.startAt == null) {
      throw StateError('Incomplete reschedule draft');
    }
    final repo = ref.read(appointmentRepositoryProvider);
    return repo.reschedule(
      appointmentId: appointmentId,
      startAtRfc3339: slot!.startAt!.toUtc().toIso8601String(),
    );
  }
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull {
    final it = iterator;
    if (!it.moveNext()) return null;
    return it.current;
  }
}
