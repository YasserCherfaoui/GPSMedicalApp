// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_overview.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DoctorOverview extends DoctorOverview {
  @override
  final int? appointmentsTotal;
  @override
  final int? appointmentsCompleted;
  @override
  final int? appointmentsCancelled;
  @override
  final double? noShowRate;
  @override
  final int? revenueDzd;
  @override
  final int? newPatients;
  @override
  final double? averageRating;

  factory _$DoctorOverview([void Function(DoctorOverviewBuilder)? updates]) =>
      (DoctorOverviewBuilder()..update(updates))._build();

  _$DoctorOverview._({
    this.appointmentsTotal,
    this.appointmentsCompleted,
    this.appointmentsCancelled,
    this.noShowRate,
    this.revenueDzd,
    this.newPatients,
    this.averageRating,
  }) : super._();
  @override
  DoctorOverview rebuild(void Function(DoctorOverviewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorOverviewBuilder toBuilder() => DoctorOverviewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorOverview &&
        appointmentsTotal == other.appointmentsTotal &&
        appointmentsCompleted == other.appointmentsCompleted &&
        appointmentsCancelled == other.appointmentsCancelled &&
        noShowRate == other.noShowRate &&
        revenueDzd == other.revenueDzd &&
        newPatients == other.newPatients &&
        averageRating == other.averageRating;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, appointmentsTotal.hashCode);
    _$hash = $jc(_$hash, appointmentsCompleted.hashCode);
    _$hash = $jc(_$hash, appointmentsCancelled.hashCode);
    _$hash = $jc(_$hash, noShowRate.hashCode);
    _$hash = $jc(_$hash, revenueDzd.hashCode);
    _$hash = $jc(_$hash, newPatients.hashCode);
    _$hash = $jc(_$hash, averageRating.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoctorOverview')
          ..add('appointmentsTotal', appointmentsTotal)
          ..add('appointmentsCompleted', appointmentsCompleted)
          ..add('appointmentsCancelled', appointmentsCancelled)
          ..add('noShowRate', noShowRate)
          ..add('revenueDzd', revenueDzd)
          ..add('newPatients', newPatients)
          ..add('averageRating', averageRating))
        .toString();
  }
}

class DoctorOverviewBuilder
    implements Builder<DoctorOverview, DoctorOverviewBuilder> {
  _$DoctorOverview? _$v;

  int? _appointmentsTotal;
  int? get appointmentsTotal => _$this._appointmentsTotal;
  set appointmentsTotal(int? appointmentsTotal) =>
      _$this._appointmentsTotal = appointmentsTotal;

  int? _appointmentsCompleted;
  int? get appointmentsCompleted => _$this._appointmentsCompleted;
  set appointmentsCompleted(int? appointmentsCompleted) =>
      _$this._appointmentsCompleted = appointmentsCompleted;

  int? _appointmentsCancelled;
  int? get appointmentsCancelled => _$this._appointmentsCancelled;
  set appointmentsCancelled(int? appointmentsCancelled) =>
      _$this._appointmentsCancelled = appointmentsCancelled;

  double? _noShowRate;
  double? get noShowRate => _$this._noShowRate;
  set noShowRate(double? noShowRate) => _$this._noShowRate = noShowRate;

  int? _revenueDzd;
  int? get revenueDzd => _$this._revenueDzd;
  set revenueDzd(int? revenueDzd) => _$this._revenueDzd = revenueDzd;

  int? _newPatients;
  int? get newPatients => _$this._newPatients;
  set newPatients(int? newPatients) => _$this._newPatients = newPatients;

  double? _averageRating;
  double? get averageRating => _$this._averageRating;
  set averageRating(double? averageRating) =>
      _$this._averageRating = averageRating;

  DoctorOverviewBuilder() {
    DoctorOverview._defaults(this);
  }

  DoctorOverviewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appointmentsTotal = $v.appointmentsTotal;
      _appointmentsCompleted = $v.appointmentsCompleted;
      _appointmentsCancelled = $v.appointmentsCancelled;
      _noShowRate = $v.noShowRate;
      _revenueDzd = $v.revenueDzd;
      _newPatients = $v.newPatients;
      _averageRating = $v.averageRating;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorOverview other) {
    _$v = other as _$DoctorOverview;
  }

  @override
  void update(void Function(DoctorOverviewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DoctorOverview build() => _build();

  _$DoctorOverview _build() {
    final _$result =
        _$v ??
        _$DoctorOverview._(
          appointmentsTotal: appointmentsTotal,
          appointmentsCompleted: appointmentsCompleted,
          appointmentsCancelled: appointmentsCancelled,
          noShowRate: noShowRate,
          revenueDzd: revenueDzd,
          newPatients: newPatients,
          averageRating: averageRating,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
