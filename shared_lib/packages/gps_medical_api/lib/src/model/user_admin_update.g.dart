// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_admin_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UserAdminUpdateStatusEnum _$userAdminUpdateStatusEnum_active =
    const UserAdminUpdateStatusEnum._('active');
const UserAdminUpdateStatusEnum _$userAdminUpdateStatusEnum_suspended =
    const UserAdminUpdateStatusEnum._('suspended');

UserAdminUpdateStatusEnum _$userAdminUpdateStatusEnumValueOf(String name) {
  switch (name) {
    case 'active':
      return _$userAdminUpdateStatusEnum_active;
    case 'suspended':
      return _$userAdminUpdateStatusEnum_suspended;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UserAdminUpdateStatusEnum> _$userAdminUpdateStatusEnumValues =
    BuiltSet<UserAdminUpdateStatusEnum>(const <UserAdminUpdateStatusEnum>[
      _$userAdminUpdateStatusEnum_active,
      _$userAdminUpdateStatusEnum_suspended,
    ]);

const UserAdminUpdateRoleEnum _$userAdminUpdateRoleEnum_patient =
    const UserAdminUpdateRoleEnum._('patient');
const UserAdminUpdateRoleEnum _$userAdminUpdateRoleEnum_specialist =
    const UserAdminUpdateRoleEnum._('specialist');
const UserAdminUpdateRoleEnum _$userAdminUpdateRoleEnum_concierge =
    const UserAdminUpdateRoleEnum._('concierge');
const UserAdminUpdateRoleEnum _$userAdminUpdateRoleEnum_admin =
    const UserAdminUpdateRoleEnum._('admin');
const UserAdminUpdateRoleEnum _$userAdminUpdateRoleEnum_moderator =
    const UserAdminUpdateRoleEnum._('moderator');

UserAdminUpdateRoleEnum _$userAdminUpdateRoleEnumValueOf(String name) {
  switch (name) {
    case 'patient':
      return _$userAdminUpdateRoleEnum_patient;
    case 'specialist':
      return _$userAdminUpdateRoleEnum_specialist;
    case 'concierge':
      return _$userAdminUpdateRoleEnum_concierge;
    case 'admin':
      return _$userAdminUpdateRoleEnum_admin;
    case 'moderator':
      return _$userAdminUpdateRoleEnum_moderator;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UserAdminUpdateRoleEnum> _$userAdminUpdateRoleEnumValues =
    BuiltSet<UserAdminUpdateRoleEnum>(const <UserAdminUpdateRoleEnum>[
      _$userAdminUpdateRoleEnum_patient,
      _$userAdminUpdateRoleEnum_specialist,
      _$userAdminUpdateRoleEnum_concierge,
      _$userAdminUpdateRoleEnum_admin,
      _$userAdminUpdateRoleEnum_moderator,
    ]);

Serializer<UserAdminUpdateStatusEnum> _$userAdminUpdateStatusEnumSerializer =
    _$UserAdminUpdateStatusEnumSerializer();
Serializer<UserAdminUpdateRoleEnum> _$userAdminUpdateRoleEnumSerializer =
    _$UserAdminUpdateRoleEnumSerializer();

class _$UserAdminUpdateStatusEnumSerializer
    implements PrimitiveSerializer<UserAdminUpdateStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'active': 'active',
    'suspended': 'suspended',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'active': 'active',
    'suspended': 'suspended',
  };

  @override
  final Iterable<Type> types = const <Type>[UserAdminUpdateStatusEnum];
  @override
  final String wireName = 'UserAdminUpdateStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    UserAdminUpdateStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  UserAdminUpdateStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => UserAdminUpdateStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$UserAdminUpdateRoleEnumSerializer
    implements PrimitiveSerializer<UserAdminUpdateRoleEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'patient': 'patient',
    'specialist': 'specialist',
    'concierge': 'concierge',
    'admin': 'admin',
    'moderator': 'moderator',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'patient': 'patient',
    'specialist': 'specialist',
    'concierge': 'concierge',
    'admin': 'admin',
    'moderator': 'moderator',
  };

  @override
  final Iterable<Type> types = const <Type>[UserAdminUpdateRoleEnum];
  @override
  final String wireName = 'UserAdminUpdateRoleEnum';

  @override
  Object serialize(
    Serializers serializers,
    UserAdminUpdateRoleEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  UserAdminUpdateRoleEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => UserAdminUpdateRoleEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$UserAdminUpdate extends UserAdminUpdate {
  @override
  final UserAdminUpdateStatusEnum? status;
  @override
  final DateTime? suspendedUntil;
  @override
  final String? suspensionReason;
  @override
  final UserAdminUpdateRoleEnum? role;

  factory _$UserAdminUpdate([void Function(UserAdminUpdateBuilder)? updates]) =>
      (UserAdminUpdateBuilder()..update(updates))._build();

  _$UserAdminUpdate._({
    this.status,
    this.suspendedUntil,
    this.suspensionReason,
    this.role,
  }) : super._();
  @override
  UserAdminUpdate rebuild(void Function(UserAdminUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserAdminUpdateBuilder toBuilder() => UserAdminUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserAdminUpdate &&
        status == other.status &&
        suspendedUntil == other.suspendedUntil &&
        suspensionReason == other.suspensionReason &&
        role == other.role;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, suspendedUntil.hashCode);
    _$hash = $jc(_$hash, suspensionReason.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserAdminUpdate')
          ..add('status', status)
          ..add('suspendedUntil', suspendedUntil)
          ..add('suspensionReason', suspensionReason)
          ..add('role', role))
        .toString();
  }
}

class UserAdminUpdateBuilder
    implements Builder<UserAdminUpdate, UserAdminUpdateBuilder> {
  _$UserAdminUpdate? _$v;

  UserAdminUpdateStatusEnum? _status;
  UserAdminUpdateStatusEnum? get status => _$this._status;
  set status(UserAdminUpdateStatusEnum? status) => _$this._status = status;

  DateTime? _suspendedUntil;
  DateTime? get suspendedUntil => _$this._suspendedUntil;
  set suspendedUntil(DateTime? suspendedUntil) =>
      _$this._suspendedUntil = suspendedUntil;

  String? _suspensionReason;
  String? get suspensionReason => _$this._suspensionReason;
  set suspensionReason(String? suspensionReason) =>
      _$this._suspensionReason = suspensionReason;

  UserAdminUpdateRoleEnum? _role;
  UserAdminUpdateRoleEnum? get role => _$this._role;
  set role(UserAdminUpdateRoleEnum? role) => _$this._role = role;

  UserAdminUpdateBuilder() {
    UserAdminUpdate._defaults(this);
  }

  UserAdminUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _suspendedUntil = $v.suspendedUntil;
      _suspensionReason = $v.suspensionReason;
      _role = $v.role;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserAdminUpdate other) {
    _$v = other as _$UserAdminUpdate;
  }

  @override
  void update(void Function(UserAdminUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserAdminUpdate build() => _build();

  _$UserAdminUpdate _build() {
    final _$result =
        _$v ??
        _$UserAdminUpdate._(
          status: status,
          suspendedUntil: suspendedUntil,
          suspensionReason: suspensionReason,
          role: role,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
