// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_membership.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClinicMembership extends ClinicMembership {
  @override
  final String? id;
  @override
  final String? clinicId;
  @override
  final String? specialistId;
  @override
  final String? clinicName;
  @override
  final String? specialistName;
  @override
  final ClinicMembershipStatus? status;
  @override
  final bool? visibleOnProfile;
  @override
  final bool? isPrimary;
  @override
  final DateTime? invitedAt;
  @override
  final DateTime? acceptedAt;
  @override
  final DateTime? detachRequestedAt;
  @override
  final DateTime? detachedAt;

  factory _$ClinicMembership([
    void Function(ClinicMembershipBuilder)? updates,
  ]) => (ClinicMembershipBuilder()..update(updates))._build();

  _$ClinicMembership._({
    this.id,
    this.clinicId,
    this.specialistId,
    this.clinicName,
    this.specialistName,
    this.status,
    this.visibleOnProfile,
    this.isPrimary,
    this.invitedAt,
    this.acceptedAt,
    this.detachRequestedAt,
    this.detachedAt,
  }) : super._();
  @override
  ClinicMembership rebuild(void Function(ClinicMembershipBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClinicMembershipBuilder toBuilder() =>
      ClinicMembershipBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicMembership &&
        id == other.id &&
        clinicId == other.clinicId &&
        specialistId == other.specialistId &&
        clinicName == other.clinicName &&
        specialistName == other.specialistName &&
        status == other.status &&
        visibleOnProfile == other.visibleOnProfile &&
        isPrimary == other.isPrimary &&
        invitedAt == other.invitedAt &&
        acceptedAt == other.acceptedAt &&
        detachRequestedAt == other.detachRequestedAt &&
        detachedAt == other.detachedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, clinicId.hashCode);
    _$hash = $jc(_$hash, specialistId.hashCode);
    _$hash = $jc(_$hash, clinicName.hashCode);
    _$hash = $jc(_$hash, specialistName.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, visibleOnProfile.hashCode);
    _$hash = $jc(_$hash, isPrimary.hashCode);
    _$hash = $jc(_$hash, invitedAt.hashCode);
    _$hash = $jc(_$hash, acceptedAt.hashCode);
    _$hash = $jc(_$hash, detachRequestedAt.hashCode);
    _$hash = $jc(_$hash, detachedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicMembership')
          ..add('id', id)
          ..add('clinicId', clinicId)
          ..add('specialistId', specialistId)
          ..add('clinicName', clinicName)
          ..add('specialistName', specialistName)
          ..add('status', status)
          ..add('visibleOnProfile', visibleOnProfile)
          ..add('isPrimary', isPrimary)
          ..add('invitedAt', invitedAt)
          ..add('acceptedAt', acceptedAt)
          ..add('detachRequestedAt', detachRequestedAt)
          ..add('detachedAt', detachedAt))
        .toString();
  }
}

class ClinicMembershipBuilder
    implements Builder<ClinicMembership, ClinicMembershipBuilder> {
  _$ClinicMembership? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _clinicId;
  String? get clinicId => _$this._clinicId;
  set clinicId(String? clinicId) => _$this._clinicId = clinicId;

  String? _specialistId;
  String? get specialistId => _$this._specialistId;
  set specialistId(String? specialistId) => _$this._specialistId = specialistId;

  String? _clinicName;
  String? get clinicName => _$this._clinicName;
  set clinicName(String? clinicName) => _$this._clinicName = clinicName;

  String? _specialistName;
  String? get specialistName => _$this._specialistName;
  set specialistName(String? specialistName) =>
      _$this._specialistName = specialistName;

  ClinicMembershipStatus? _status;
  ClinicMembershipStatus? get status => _$this._status;
  set status(ClinicMembershipStatus? status) => _$this._status = status;

  bool? _visibleOnProfile;
  bool? get visibleOnProfile => _$this._visibleOnProfile;
  set visibleOnProfile(bool? visibleOnProfile) =>
      _$this._visibleOnProfile = visibleOnProfile;

  bool? _isPrimary;
  bool? get isPrimary => _$this._isPrimary;
  set isPrimary(bool? isPrimary) => _$this._isPrimary = isPrimary;

  DateTime? _invitedAt;
  DateTime? get invitedAt => _$this._invitedAt;
  set invitedAt(DateTime? invitedAt) => _$this._invitedAt = invitedAt;

  DateTime? _acceptedAt;
  DateTime? get acceptedAt => _$this._acceptedAt;
  set acceptedAt(DateTime? acceptedAt) => _$this._acceptedAt = acceptedAt;

  DateTime? _detachRequestedAt;
  DateTime? get detachRequestedAt => _$this._detachRequestedAt;
  set detachRequestedAt(DateTime? detachRequestedAt) =>
      _$this._detachRequestedAt = detachRequestedAt;

  DateTime? _detachedAt;
  DateTime? get detachedAt => _$this._detachedAt;
  set detachedAt(DateTime? detachedAt) => _$this._detachedAt = detachedAt;

  ClinicMembershipBuilder() {
    ClinicMembership._defaults(this);
  }

  ClinicMembershipBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _clinicId = $v.clinicId;
      _specialistId = $v.specialistId;
      _clinicName = $v.clinicName;
      _specialistName = $v.specialistName;
      _status = $v.status;
      _visibleOnProfile = $v.visibleOnProfile;
      _isPrimary = $v.isPrimary;
      _invitedAt = $v.invitedAt;
      _acceptedAt = $v.acceptedAt;
      _detachRequestedAt = $v.detachRequestedAt;
      _detachedAt = $v.detachedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicMembership other) {
    _$v = other as _$ClinicMembership;
  }

  @override
  void update(void Function(ClinicMembershipBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicMembership build() => _build();

  _$ClinicMembership _build() {
    final _$result =
        _$v ??
        _$ClinicMembership._(
          id: id,
          clinicId: clinicId,
          specialistId: specialistId,
          clinicName: clinicName,
          specialistName: specialistName,
          status: status,
          visibleOnProfile: visibleOnProfile,
          isPrimary: isPrimary,
          invitedAt: invitedAt,
          acceptedAt: acceptedAt,
          detachRequestedAt: detachRequestedAt,
          detachedAt: detachedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
