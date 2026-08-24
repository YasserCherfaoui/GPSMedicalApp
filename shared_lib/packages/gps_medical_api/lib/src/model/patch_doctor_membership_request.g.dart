// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_doctor_membership_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PatchDoctorMembershipRequest extends PatchDoctorMembershipRequest {
  @override
  final bool visibleOnProfile;

  factory _$PatchDoctorMembershipRequest([
    void Function(PatchDoctorMembershipRequestBuilder)? updates,
  ]) => (PatchDoctorMembershipRequestBuilder()..update(updates))._build();

  _$PatchDoctorMembershipRequest._({required this.visibleOnProfile})
    : super._();
  @override
  PatchDoctorMembershipRequest rebuild(
    void Function(PatchDoctorMembershipRequestBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PatchDoctorMembershipRequestBuilder toBuilder() =>
      PatchDoctorMembershipRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatchDoctorMembershipRequest &&
        visibleOnProfile == other.visibleOnProfile;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, visibleOnProfile.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
      r'PatchDoctorMembershipRequest',
    )..add('visibleOnProfile', visibleOnProfile)).toString();
  }
}

class PatchDoctorMembershipRequestBuilder
    implements
        Builder<
          PatchDoctorMembershipRequest,
          PatchDoctorMembershipRequestBuilder
        > {
  _$PatchDoctorMembershipRequest? _$v;

  bool? _visibleOnProfile;
  bool? get visibleOnProfile => _$this._visibleOnProfile;
  set visibleOnProfile(bool? visibleOnProfile) =>
      _$this._visibleOnProfile = visibleOnProfile;

  PatchDoctorMembershipRequestBuilder() {
    PatchDoctorMembershipRequest._defaults(this);
  }

  PatchDoctorMembershipRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _visibleOnProfile = $v.visibleOnProfile;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatchDoctorMembershipRequest other) {
    _$v = other as _$PatchDoctorMembershipRequest;
  }

  @override
  void update(void Function(PatchDoctorMembershipRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PatchDoctorMembershipRequest build() => _build();

  _$PatchDoctorMembershipRequest _build() {
    final _$result =
        _$v ??
        _$PatchDoctorMembershipRequest._(
          visibleOnProfile: BuiltValueNullFieldError.checkNotNull(
            visibleOnProfile,
            r'PatchDoctorMembershipRequest',
            'visibleOnProfile',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
