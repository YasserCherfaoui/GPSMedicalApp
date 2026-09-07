// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_under_staffed_advisory_affected_templates_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClinicUnderStaffedAdvisoryAffectedTemplatesInner
    extends ClinicUnderStaffedAdvisoryAffectedTemplatesInner {
  @override
  final String? templateId;
  @override
  final int? weekday;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final int? capacity;
  @override
  final bool? understaffed;

  factory _$ClinicUnderStaffedAdvisoryAffectedTemplatesInner([
    void Function(ClinicUnderStaffedAdvisoryAffectedTemplatesInnerBuilder)?
    updates,
  ]) =>
      (ClinicUnderStaffedAdvisoryAffectedTemplatesInnerBuilder()
            ..update(updates))
          ._build();

  _$ClinicUnderStaffedAdvisoryAffectedTemplatesInner._({
    this.templateId,
    this.weekday,
    this.startTime,
    this.endTime,
    this.capacity,
    this.understaffed,
  }) : super._();
  @override
  ClinicUnderStaffedAdvisoryAffectedTemplatesInner rebuild(
    void Function(ClinicUnderStaffedAdvisoryAffectedTemplatesInnerBuilder)
    updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ClinicUnderStaffedAdvisoryAffectedTemplatesInnerBuilder toBuilder() =>
      ClinicUnderStaffedAdvisoryAffectedTemplatesInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicUnderStaffedAdvisoryAffectedTemplatesInner &&
        templateId == other.templateId &&
        weekday == other.weekday &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        capacity == other.capacity &&
        understaffed == other.understaffed;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, templateId.hashCode);
    _$hash = $jc(_$hash, weekday.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, capacity.hashCode);
    _$hash = $jc(_$hash, understaffed.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'ClinicUnderStaffedAdvisoryAffectedTemplatesInner',
          )
          ..add('templateId', templateId)
          ..add('weekday', weekday)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('capacity', capacity)
          ..add('understaffed', understaffed))
        .toString();
  }
}

class ClinicUnderStaffedAdvisoryAffectedTemplatesInnerBuilder
    implements
        Builder<
          ClinicUnderStaffedAdvisoryAffectedTemplatesInner,
          ClinicUnderStaffedAdvisoryAffectedTemplatesInnerBuilder
        > {
  _$ClinicUnderStaffedAdvisoryAffectedTemplatesInner? _$v;

  String? _templateId;
  String? get templateId => _$this._templateId;
  set templateId(String? templateId) => _$this._templateId = templateId;

  int? _weekday;
  int? get weekday => _$this._weekday;
  set weekday(int? weekday) => _$this._weekday = weekday;

  String? _startTime;
  String? get startTime => _$this._startTime;
  set startTime(String? startTime) => _$this._startTime = startTime;

  String? _endTime;
  String? get endTime => _$this._endTime;
  set endTime(String? endTime) => _$this._endTime = endTime;

  int? _capacity;
  int? get capacity => _$this._capacity;
  set capacity(int? capacity) => _$this._capacity = capacity;

  bool? _understaffed;
  bool? get understaffed => _$this._understaffed;
  set understaffed(bool? understaffed) => _$this._understaffed = understaffed;

  ClinicUnderStaffedAdvisoryAffectedTemplatesInnerBuilder() {
    ClinicUnderStaffedAdvisoryAffectedTemplatesInner._defaults(this);
  }

  ClinicUnderStaffedAdvisoryAffectedTemplatesInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _templateId = $v.templateId;
      _weekday = $v.weekday;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _capacity = $v.capacity;
      _understaffed = $v.understaffed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicUnderStaffedAdvisoryAffectedTemplatesInner other) {
    _$v = other as _$ClinicUnderStaffedAdvisoryAffectedTemplatesInner;
  }

  @override
  void update(
    void Function(ClinicUnderStaffedAdvisoryAffectedTemplatesInnerBuilder)?
    updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  ClinicUnderStaffedAdvisoryAffectedTemplatesInner build() => _build();

  _$ClinicUnderStaffedAdvisoryAffectedTemplatesInner _build() {
    final _$result =
        _$v ??
        _$ClinicUnderStaffedAdvisoryAffectedTemplatesInner._(
          templateId: templateId,
          weekday: weekday,
          startTime: startTime,
          endTime: endTime,
          capacity: capacity,
          understaffed: understaffed,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
