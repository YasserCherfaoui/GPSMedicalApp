// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concierge_upcoming_appointment.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConciergeUpcomingAppointment extends ConciergeUpcomingAppointment {
  @override
  final String id;
  @override
  final DateTime startAt;
  @override
  final String status;
  @override
  final String? doctorName;

  factory _$ConciergeUpcomingAppointment([
    void Function(ConciergeUpcomingAppointmentBuilder)? updates,
  ]) => (ConciergeUpcomingAppointmentBuilder()..update(updates))._build();

  _$ConciergeUpcomingAppointment._({
    required this.id,
    required this.startAt,
    required this.status,
    this.doctorName,
  }) : super._();
  @override
  ConciergeUpcomingAppointment rebuild(
    void Function(ConciergeUpcomingAppointmentBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ConciergeUpcomingAppointmentBuilder toBuilder() =>
      ConciergeUpcomingAppointmentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConciergeUpcomingAppointment &&
        id == other.id &&
        startAt == other.startAt &&
        status == other.status &&
        doctorName == other.doctorName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, startAt.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, doctorName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConciergeUpcomingAppointment')
          ..add('id', id)
          ..add('startAt', startAt)
          ..add('status', status)
          ..add('doctorName', doctorName))
        .toString();
  }
}

class ConciergeUpcomingAppointmentBuilder
    implements
        Builder<
          ConciergeUpcomingAppointment,
          ConciergeUpcomingAppointmentBuilder
        > {
  _$ConciergeUpcomingAppointment? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DateTime? _startAt;
  DateTime? get startAt => _$this._startAt;
  set startAt(DateTime? startAt) => _$this._startAt = startAt;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _doctorName;
  String? get doctorName => _$this._doctorName;
  set doctorName(String? doctorName) => _$this._doctorName = doctorName;

  ConciergeUpcomingAppointmentBuilder() {
    ConciergeUpcomingAppointment._defaults(this);
  }

  ConciergeUpcomingAppointmentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _startAt = $v.startAt;
      _status = $v.status;
      _doctorName = $v.doctorName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConciergeUpcomingAppointment other) {
    _$v = other as _$ConciergeUpcomingAppointment;
  }

  @override
  void update(void Function(ConciergeUpcomingAppointmentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConciergeUpcomingAppointment build() => _build();

  _$ConciergeUpcomingAppointment _build() {
    final _$result =
        _$v ??
        _$ConciergeUpcomingAppointment._(
          id: BuiltValueNullFieldError.checkNotNull(
            id,
            r'ConciergeUpcomingAppointment',
            'id',
          ),
          startAt: BuiltValueNullFieldError.checkNotNull(
            startAt,
            r'ConciergeUpcomingAppointment',
            'startAt',
          ),
          status: BuiltValueNullFieldError.checkNotNull(
            status,
            r'ConciergeUpcomingAppointment',
            'status',
          ),
          doctorName: doctorName,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
