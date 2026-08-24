// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_clinic_membership_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InviteClinicMembershipRequest extends InviteClinicMembershipRequest {
  @override
  final String specialistId;

  factory _$InviteClinicMembershipRequest([
    void Function(InviteClinicMembershipRequestBuilder)? updates,
  ]) => (InviteClinicMembershipRequestBuilder()..update(updates))._build();

  _$InviteClinicMembershipRequest._({required this.specialistId}) : super._();
  @override
  InviteClinicMembershipRequest rebuild(
    void Function(InviteClinicMembershipRequestBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  InviteClinicMembershipRequestBuilder toBuilder() =>
      InviteClinicMembershipRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InviteClinicMembershipRequest &&
        specialistId == other.specialistId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, specialistId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
      r'InviteClinicMembershipRequest',
    )..add('specialistId', specialistId)).toString();
  }
}

class InviteClinicMembershipRequestBuilder
    implements
        Builder<
          InviteClinicMembershipRequest,
          InviteClinicMembershipRequestBuilder
        > {
  _$InviteClinicMembershipRequest? _$v;

  String? _specialistId;
  String? get specialistId => _$this._specialistId;
  set specialistId(String? specialistId) => _$this._specialistId = specialistId;

  InviteClinicMembershipRequestBuilder() {
    InviteClinicMembershipRequest._defaults(this);
  }

  InviteClinicMembershipRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specialistId = $v.specialistId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InviteClinicMembershipRequest other) {
    _$v = other as _$InviteClinicMembershipRequest;
  }

  @override
  void update(void Function(InviteClinicMembershipRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InviteClinicMembershipRequest build() => _build();

  _$InviteClinicMembershipRequest _build() {
    final _$result =
        _$v ??
        _$InviteClinicMembershipRequest._(
          specialistId: BuiltValueNullFieldError.checkNotNull(
            specialistId,
            r'InviteClinicMembershipRequest',
            'specialistId',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
