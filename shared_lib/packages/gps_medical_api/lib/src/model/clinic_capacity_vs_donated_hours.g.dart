// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_capacity_vs_donated_hours.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClinicCapacityVsDonatedHours extends ClinicCapacityVsDonatedHours {
  @override
  final double capacityHoursWeekly;
  @override
  final double donatedHoursWeekly;
  @override
  final double? coverageRatio;

  factory _$ClinicCapacityVsDonatedHours([
    void Function(ClinicCapacityVsDonatedHoursBuilder)? updates,
  ]) => (ClinicCapacityVsDonatedHoursBuilder()..update(updates))._build();

  _$ClinicCapacityVsDonatedHours._({
    required this.capacityHoursWeekly,
    required this.donatedHoursWeekly,
    this.coverageRatio,
  }) : super._();
  @override
  ClinicCapacityVsDonatedHours rebuild(
    void Function(ClinicCapacityVsDonatedHoursBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ClinicCapacityVsDonatedHoursBuilder toBuilder() =>
      ClinicCapacityVsDonatedHoursBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicCapacityVsDonatedHours &&
        capacityHoursWeekly == other.capacityHoursWeekly &&
        donatedHoursWeekly == other.donatedHoursWeekly &&
        coverageRatio == other.coverageRatio;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, capacityHoursWeekly.hashCode);
    _$hash = $jc(_$hash, donatedHoursWeekly.hashCode);
    _$hash = $jc(_$hash, coverageRatio.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicCapacityVsDonatedHours')
          ..add('capacityHoursWeekly', capacityHoursWeekly)
          ..add('donatedHoursWeekly', donatedHoursWeekly)
          ..add('coverageRatio', coverageRatio))
        .toString();
  }
}

class ClinicCapacityVsDonatedHoursBuilder
    implements
        Builder<
          ClinicCapacityVsDonatedHours,
          ClinicCapacityVsDonatedHoursBuilder
        > {
  _$ClinicCapacityVsDonatedHours? _$v;

  double? _capacityHoursWeekly;
  double? get capacityHoursWeekly => _$this._capacityHoursWeekly;
  set capacityHoursWeekly(double? capacityHoursWeekly) =>
      _$this._capacityHoursWeekly = capacityHoursWeekly;

  double? _donatedHoursWeekly;
  double? get donatedHoursWeekly => _$this._donatedHoursWeekly;
  set donatedHoursWeekly(double? donatedHoursWeekly) =>
      _$this._donatedHoursWeekly = donatedHoursWeekly;

  double? _coverageRatio;
  double? get coverageRatio => _$this._coverageRatio;
  set coverageRatio(double? coverageRatio) =>
      _$this._coverageRatio = coverageRatio;

  ClinicCapacityVsDonatedHoursBuilder() {
    ClinicCapacityVsDonatedHours._defaults(this);
  }

  ClinicCapacityVsDonatedHoursBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _capacityHoursWeekly = $v.capacityHoursWeekly;
      _donatedHoursWeekly = $v.donatedHoursWeekly;
      _coverageRatio = $v.coverageRatio;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicCapacityVsDonatedHours other) {
    _$v = other as _$ClinicCapacityVsDonatedHours;
  }

  @override
  void update(void Function(ClinicCapacityVsDonatedHoursBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicCapacityVsDonatedHours build() => _build();

  _$ClinicCapacityVsDonatedHours _build() {
    final _$result =
        _$v ??
        _$ClinicCapacityVsDonatedHours._(
          capacityHoursWeekly: BuiltValueNullFieldError.checkNotNull(
            capacityHoursWeekly,
            r'ClinicCapacityVsDonatedHours',
            'capacityHoursWeekly',
          ),
          donatedHoursWeekly: BuiltValueNullFieldError.checkNotNull(
            donatedHoursWeekly,
            r'ClinicCapacityVsDonatedHours',
            'donatedHoursWeekly',
          ),
          coverageRatio: coverageRatio,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
