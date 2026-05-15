// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_overview.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminOverview extends AdminOverview {
  @override
  final int? usersTotal;
  @override
  final int? patientsActive;
  @override
  final int? doctorsActive;
  @override
  final int? doctorsPendingVerification;
  @override
  final int? appointmentsLast30d;
  @override
  final int? gmvDzdLast30d;
  @override
  final double? avgAppointmentsPerActiveUser;

  factory _$AdminOverview([void Function(AdminOverviewBuilder)? updates]) =>
      (AdminOverviewBuilder()..update(updates))._build();

  _$AdminOverview._({
    this.usersTotal,
    this.patientsActive,
    this.doctorsActive,
    this.doctorsPendingVerification,
    this.appointmentsLast30d,
    this.gmvDzdLast30d,
    this.avgAppointmentsPerActiveUser,
  }) : super._();
  @override
  AdminOverview rebuild(void Function(AdminOverviewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminOverviewBuilder toBuilder() => AdminOverviewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminOverview &&
        usersTotal == other.usersTotal &&
        patientsActive == other.patientsActive &&
        doctorsActive == other.doctorsActive &&
        doctorsPendingVerification == other.doctorsPendingVerification &&
        appointmentsLast30d == other.appointmentsLast30d &&
        gmvDzdLast30d == other.gmvDzdLast30d &&
        avgAppointmentsPerActiveUser == other.avgAppointmentsPerActiveUser;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, usersTotal.hashCode);
    _$hash = $jc(_$hash, patientsActive.hashCode);
    _$hash = $jc(_$hash, doctorsActive.hashCode);
    _$hash = $jc(_$hash, doctorsPendingVerification.hashCode);
    _$hash = $jc(_$hash, appointmentsLast30d.hashCode);
    _$hash = $jc(_$hash, gmvDzdLast30d.hashCode);
    _$hash = $jc(_$hash, avgAppointmentsPerActiveUser.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminOverview')
          ..add('usersTotal', usersTotal)
          ..add('patientsActive', patientsActive)
          ..add('doctorsActive', doctorsActive)
          ..add('doctorsPendingVerification', doctorsPendingVerification)
          ..add('appointmentsLast30d', appointmentsLast30d)
          ..add('gmvDzdLast30d', gmvDzdLast30d)
          ..add('avgAppointmentsPerActiveUser', avgAppointmentsPerActiveUser))
        .toString();
  }
}

class AdminOverviewBuilder
    implements Builder<AdminOverview, AdminOverviewBuilder> {
  _$AdminOverview? _$v;

  int? _usersTotal;
  int? get usersTotal => _$this._usersTotal;
  set usersTotal(int? usersTotal) => _$this._usersTotal = usersTotal;

  int? _patientsActive;
  int? get patientsActive => _$this._patientsActive;
  set patientsActive(int? patientsActive) =>
      _$this._patientsActive = patientsActive;

  int? _doctorsActive;
  int? get doctorsActive => _$this._doctorsActive;
  set doctorsActive(int? doctorsActive) =>
      _$this._doctorsActive = doctorsActive;

  int? _doctorsPendingVerification;
  int? get doctorsPendingVerification => _$this._doctorsPendingVerification;
  set doctorsPendingVerification(int? doctorsPendingVerification) =>
      _$this._doctorsPendingVerification = doctorsPendingVerification;

  int? _appointmentsLast30d;
  int? get appointmentsLast30d => _$this._appointmentsLast30d;
  set appointmentsLast30d(int? appointmentsLast30d) =>
      _$this._appointmentsLast30d = appointmentsLast30d;

  int? _gmvDzdLast30d;
  int? get gmvDzdLast30d => _$this._gmvDzdLast30d;
  set gmvDzdLast30d(int? gmvDzdLast30d) =>
      _$this._gmvDzdLast30d = gmvDzdLast30d;

  double? _avgAppointmentsPerActiveUser;
  double? get avgAppointmentsPerActiveUser =>
      _$this._avgAppointmentsPerActiveUser;
  set avgAppointmentsPerActiveUser(double? avgAppointmentsPerActiveUser) =>
      _$this._avgAppointmentsPerActiveUser = avgAppointmentsPerActiveUser;

  AdminOverviewBuilder() {
    AdminOverview._defaults(this);
  }

  AdminOverviewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _usersTotal = $v.usersTotal;
      _patientsActive = $v.patientsActive;
      _doctorsActive = $v.doctorsActive;
      _doctorsPendingVerification = $v.doctorsPendingVerification;
      _appointmentsLast30d = $v.appointmentsLast30d;
      _gmvDzdLast30d = $v.gmvDzdLast30d;
      _avgAppointmentsPerActiveUser = $v.avgAppointmentsPerActiveUser;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminOverview other) {
    _$v = other as _$AdminOverview;
  }

  @override
  void update(void Function(AdminOverviewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminOverview build() => _build();

  _$AdminOverview _build() {
    final _$result =
        _$v ??
        _$AdminOverview._(
          usersTotal: usersTotal,
          patientsActive: patientsActive,
          doctorsActive: doctorsActive,
          doctorsPendingVerification: doctorsPendingVerification,
          appointmentsLast30d: appointmentsLast30d,
          gmvDzdLast30d: gmvDzdLast30d,
          avgAppointmentsPerActiveUser: avgAppointmentsPerActiveUser,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
