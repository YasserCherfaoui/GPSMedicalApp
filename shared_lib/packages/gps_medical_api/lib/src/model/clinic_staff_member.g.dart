// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_staff_member.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicStaffMemberRoleEnum _$clinicStaffMemberRoleEnum_clinicOwner =
    const ClinicStaffMemberRoleEnum._('clinicOwner');
const ClinicStaffMemberRoleEnum _$clinicStaffMemberRoleEnum_clinicAdmin =
    const ClinicStaffMemberRoleEnum._('clinicAdmin');

ClinicStaffMemberRoleEnum _$clinicStaffMemberRoleEnumValueOf(String name) {
  switch (name) {
    case 'clinicOwner':
      return _$clinicStaffMemberRoleEnum_clinicOwner;
    case 'clinicAdmin':
      return _$clinicStaffMemberRoleEnum_clinicAdmin;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicStaffMemberRoleEnum> _$clinicStaffMemberRoleEnumValues =
    BuiltSet<ClinicStaffMemberRoleEnum>(const <ClinicStaffMemberRoleEnum>[
      _$clinicStaffMemberRoleEnum_clinicOwner,
      _$clinicStaffMemberRoleEnum_clinicAdmin,
    ]);

Serializer<ClinicStaffMemberRoleEnum> _$clinicStaffMemberRoleEnumSerializer =
    _$ClinicStaffMemberRoleEnumSerializer();

class _$ClinicStaffMemberRoleEnumSerializer
    implements PrimitiveSerializer<ClinicStaffMemberRoleEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'clinicOwner': 'clinic_owner',
    'clinicAdmin': 'clinic_admin',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'clinic_owner': 'clinicOwner',
    'clinic_admin': 'clinicAdmin',
  };

  @override
  final Iterable<Type> types = const <Type>[ClinicStaffMemberRoleEnum];
  @override
  final String wireName = 'ClinicStaffMemberRoleEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicStaffMemberRoleEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicStaffMemberRoleEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicStaffMemberRoleEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ClinicStaffMember extends ClinicStaffMember {
  @override
  final String? userId;
  @override
  final ClinicStaffMemberRoleEnum? role;
  @override
  final String? fullName;
  @override
  final String? email;

  factory _$ClinicStaffMember([
    void Function(ClinicStaffMemberBuilder)? updates,
  ]) => (ClinicStaffMemberBuilder()..update(updates))._build();

  _$ClinicStaffMember._({this.userId, this.role, this.fullName, this.email})
    : super._();
  @override
  ClinicStaffMember rebuild(void Function(ClinicStaffMemberBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClinicStaffMemberBuilder toBuilder() =>
      ClinicStaffMemberBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicStaffMember &&
        userId == other.userId &&
        role == other.role &&
        fullName == other.fullName &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicStaffMember')
          ..add('userId', userId)
          ..add('role', role)
          ..add('fullName', fullName)
          ..add('email', email))
        .toString();
  }
}

class ClinicStaffMemberBuilder
    implements Builder<ClinicStaffMember, ClinicStaffMemberBuilder> {
  _$ClinicStaffMember? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  ClinicStaffMemberRoleEnum? _role;
  ClinicStaffMemberRoleEnum? get role => _$this._role;
  set role(ClinicStaffMemberRoleEnum? role) => _$this._role = role;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  ClinicStaffMemberBuilder() {
    ClinicStaffMember._defaults(this);
  }

  ClinicStaffMemberBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _role = $v.role;
      _fullName = $v.fullName;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicStaffMember other) {
    _$v = other as _$ClinicStaffMember;
  }

  @override
  void update(void Function(ClinicStaffMemberBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicStaffMember build() => _build();

  _$ClinicStaffMember _build() {
    final _$result =
        _$v ??
        _$ClinicStaffMember._(
          userId: userId,
          role: role,
          fullName: fullName,
          email: email,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
