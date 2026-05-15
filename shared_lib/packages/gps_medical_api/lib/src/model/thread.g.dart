// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Thread extends Thread {
  @override
  final String? id;
  @override
  final String? patientId;
  @override
  final String? doctorId;
  @override
  final DateTime? lastMessageAt;
  @override
  final int? unreadCount;
  @override
  final String? appointmentId;

  factory _$Thread([void Function(ThreadBuilder)? updates]) =>
      (ThreadBuilder()..update(updates))._build();

  _$Thread._({
    this.id,
    this.patientId,
    this.doctorId,
    this.lastMessageAt,
    this.unreadCount,
    this.appointmentId,
  }) : super._();
  @override
  Thread rebuild(void Function(ThreadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThreadBuilder toBuilder() => ThreadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Thread &&
        id == other.id &&
        patientId == other.patientId &&
        doctorId == other.doctorId &&
        lastMessageAt == other.lastMessageAt &&
        unreadCount == other.unreadCount &&
        appointmentId == other.appointmentId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, patientId.hashCode);
    _$hash = $jc(_$hash, doctorId.hashCode);
    _$hash = $jc(_$hash, lastMessageAt.hashCode);
    _$hash = $jc(_$hash, unreadCount.hashCode);
    _$hash = $jc(_$hash, appointmentId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Thread')
          ..add('id', id)
          ..add('patientId', patientId)
          ..add('doctorId', doctorId)
          ..add('lastMessageAt', lastMessageAt)
          ..add('unreadCount', unreadCount)
          ..add('appointmentId', appointmentId))
        .toString();
  }
}

class ThreadBuilder implements Builder<Thread, ThreadBuilder> {
  _$Thread? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _patientId;
  String? get patientId => _$this._patientId;
  set patientId(String? patientId) => _$this._patientId = patientId;

  String? _doctorId;
  String? get doctorId => _$this._doctorId;
  set doctorId(String? doctorId) => _$this._doctorId = doctorId;

  DateTime? _lastMessageAt;
  DateTime? get lastMessageAt => _$this._lastMessageAt;
  set lastMessageAt(DateTime? lastMessageAt) =>
      _$this._lastMessageAt = lastMessageAt;

  int? _unreadCount;
  int? get unreadCount => _$this._unreadCount;
  set unreadCount(int? unreadCount) => _$this._unreadCount = unreadCount;

  String? _appointmentId;
  String? get appointmentId => _$this._appointmentId;
  set appointmentId(String? appointmentId) =>
      _$this._appointmentId = appointmentId;

  ThreadBuilder() {
    Thread._defaults(this);
  }

  ThreadBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _patientId = $v.patientId;
      _doctorId = $v.doctorId;
      _lastMessageAt = $v.lastMessageAt;
      _unreadCount = $v.unreadCount;
      _appointmentId = $v.appointmentId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Thread other) {
    _$v = other as _$Thread;
  }

  @override
  void update(void Function(ThreadBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Thread build() => _build();

  _$Thread _build() {
    final _$result =
        _$v ??
        _$Thread._(
          id: id,
          patientId: patientId,
          doctorId: doctorId,
          lastMessageAt: lastMessageAt,
          unreadCount: unreadCount,
          appointmentId: appointmentId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
