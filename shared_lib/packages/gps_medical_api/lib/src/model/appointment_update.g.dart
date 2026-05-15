// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppointmentUpdate extends AppointmentUpdate {
  @override
  final DateTime? startAt;
  @override
  final String? reason;
  @override
  final String? notes;

  factory _$AppointmentUpdate([
    void Function(AppointmentUpdateBuilder)? updates,
  ]) => (AppointmentUpdateBuilder()..update(updates))._build();

  _$AppointmentUpdate._({this.startAt, this.reason, this.notes}) : super._();
  @override
  AppointmentUpdate rebuild(void Function(AppointmentUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppointmentUpdateBuilder toBuilder() =>
      AppointmentUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppointmentUpdate &&
        startAt == other.startAt &&
        reason == other.reason &&
        notes == other.notes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, startAt.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppointmentUpdate')
          ..add('startAt', startAt)
          ..add('reason', reason)
          ..add('notes', notes))
        .toString();
  }
}

class AppointmentUpdateBuilder
    implements Builder<AppointmentUpdate, AppointmentUpdateBuilder> {
  _$AppointmentUpdate? _$v;

  DateTime? _startAt;
  DateTime? get startAt => _$this._startAt;
  set startAt(DateTime? startAt) => _$this._startAt = startAt;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

  AppointmentUpdateBuilder() {
    AppointmentUpdate._defaults(this);
  }

  AppointmentUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startAt = $v.startAt;
      _reason = $v.reason;
      _notes = $v.notes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppointmentUpdate other) {
    _$v = other as _$AppointmentUpdate;
  }

  @override
  void update(void Function(AppointmentUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppointmentUpdate build() => _build();

  _$AppointmentUpdate _build() {
    final _$result =
        _$v ??
        _$AppointmentUpdate._(startAt: startAt, reason: reason, notes: notes);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
