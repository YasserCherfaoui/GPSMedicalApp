// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_admin.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UserAdminRoleEnum _$userAdminRoleEnum_patient = const UserAdminRoleEnum._(
  'patient',
);
const UserAdminRoleEnum _$userAdminRoleEnum_specialist =
    const UserAdminRoleEnum._('specialist');
const UserAdminRoleEnum _$userAdminRoleEnum_concierge =
    const UserAdminRoleEnum._('concierge');
const UserAdminRoleEnum _$userAdminRoleEnum_admin = const UserAdminRoleEnum._(
  'admin',
);
const UserAdminRoleEnum _$userAdminRoleEnum_moderator =
    const UserAdminRoleEnum._('moderator');

UserAdminRoleEnum _$userAdminRoleEnumValueOf(String name) {
  switch (name) {
    case 'patient':
      return _$userAdminRoleEnum_patient;
    case 'specialist':
      return _$userAdminRoleEnum_specialist;
    case 'concierge':
      return _$userAdminRoleEnum_concierge;
    case 'admin':
      return _$userAdminRoleEnum_admin;
    case 'moderator':
      return _$userAdminRoleEnum_moderator;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UserAdminRoleEnum> _$userAdminRoleEnumValues =
    BuiltSet<UserAdminRoleEnum>(const <UserAdminRoleEnum>[
      _$userAdminRoleEnum_patient,
      _$userAdminRoleEnum_specialist,
      _$userAdminRoleEnum_concierge,
      _$userAdminRoleEnum_admin,
      _$userAdminRoleEnum_moderator,
    ]);

const UserAdminStatusEnum _$userAdminStatusEnum_pendingVerification =
    const UserAdminStatusEnum._('pendingVerification');
const UserAdminStatusEnum _$userAdminStatusEnum_active =
    const UserAdminStatusEnum._('active');
const UserAdminStatusEnum _$userAdminStatusEnum_suspended =
    const UserAdminStatusEnum._('suspended');
const UserAdminStatusEnum _$userAdminStatusEnum_deleted =
    const UserAdminStatusEnum._('deleted');

UserAdminStatusEnum _$userAdminStatusEnumValueOf(String name) {
  switch (name) {
    case 'pendingVerification':
      return _$userAdminStatusEnum_pendingVerification;
    case 'active':
      return _$userAdminStatusEnum_active;
    case 'suspended':
      return _$userAdminStatusEnum_suspended;
    case 'deleted':
      return _$userAdminStatusEnum_deleted;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UserAdminStatusEnum> _$userAdminStatusEnumValues =
    BuiltSet<UserAdminStatusEnum>(const <UserAdminStatusEnum>[
      _$userAdminStatusEnum_pendingVerification,
      _$userAdminStatusEnum_active,
      _$userAdminStatusEnum_suspended,
      _$userAdminStatusEnum_deleted,
    ]);

Serializer<UserAdminRoleEnum> _$userAdminRoleEnumSerializer =
    _$UserAdminRoleEnumSerializer();
Serializer<UserAdminStatusEnum> _$userAdminStatusEnumSerializer =
    _$UserAdminStatusEnumSerializer();

class _$UserAdminRoleEnumSerializer
    implements PrimitiveSerializer<UserAdminRoleEnum> {
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
  final Iterable<Type> types = const <Type>[UserAdminRoleEnum];
  @override
  final String wireName = 'UserAdminRoleEnum';

  @override
  Object serialize(
    Serializers serializers,
    UserAdminRoleEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  UserAdminRoleEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => UserAdminRoleEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$UserAdminStatusEnumSerializer
    implements PrimitiveSerializer<UserAdminStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pendingVerification': 'pending_verification',
    'active': 'active',
    'suspended': 'suspended',
    'deleted': 'deleted',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending_verification': 'pendingVerification',
    'active': 'active',
    'suspended': 'suspended',
    'deleted': 'deleted',
  };

  @override
  final Iterable<Type> types = const <Type>[UserAdminStatusEnum];
  @override
  final String wireName = 'UserAdminStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    UserAdminStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  UserAdminStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => UserAdminStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$UserAdmin extends UserAdmin {
  @override
  final DateTime? suspendedUntil;
  @override
  final DateTime? lastLoginAt;
  @override
  final String? suspensionReason;
  @override
  final int? loginCount;
  @override
  final String? id;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final UserRoleEnum? role;
  @override
  final String? fullName;
  @override
  final UserStatusEnum? status;
  @override
  final DateTime? createdAt;

  factory _$UserAdmin([void Function(UserAdminBuilder)? updates]) =>
      (UserAdminBuilder()..update(updates))._build();

  _$UserAdmin._({
    this.suspendedUntil,
    this.lastLoginAt,
    this.suspensionReason,
    this.loginCount,
    this.id,
    this.phone,
    this.email,
    this.role,
    this.fullName,
    this.status,
    this.createdAt,
  }) : super._();
  @override
  UserAdmin rebuild(void Function(UserAdminBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserAdminBuilder toBuilder() => UserAdminBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserAdmin &&
        suspendedUntil == other.suspendedUntil &&
        lastLoginAt == other.lastLoginAt &&
        suspensionReason == other.suspensionReason &&
        loginCount == other.loginCount &&
        id == other.id &&
        phone == other.phone &&
        email == other.email &&
        role == other.role &&
        fullName == other.fullName &&
        status == other.status &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, suspendedUntil.hashCode);
    _$hash = $jc(_$hash, lastLoginAt.hashCode);
    _$hash = $jc(_$hash, suspensionReason.hashCode);
    _$hash = $jc(_$hash, loginCount.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserAdmin')
          ..add('suspendedUntil', suspendedUntil)
          ..add('lastLoginAt', lastLoginAt)
          ..add('suspensionReason', suspensionReason)
          ..add('loginCount', loginCount)
          ..add('id', id)
          ..add('phone', phone)
          ..add('email', email)
          ..add('role', role)
          ..add('fullName', fullName)
          ..add('status', status)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class UserAdminBuilder
    implements Builder<UserAdmin, UserAdminBuilder>, UserBuilder {
  _$UserAdmin? _$v;

  DateTime? _suspendedUntil;
  DateTime? get suspendedUntil => _$this._suspendedUntil;
  set suspendedUntil(covariant DateTime? suspendedUntil) =>
      _$this._suspendedUntil = suspendedUntil;

  DateTime? _lastLoginAt;
  DateTime? get lastLoginAt => _$this._lastLoginAt;
  set lastLoginAt(covariant DateTime? lastLoginAt) =>
      _$this._lastLoginAt = lastLoginAt;

  String? _suspensionReason;
  String? get suspensionReason => _$this._suspensionReason;
  set suspensionReason(covariant String? suspensionReason) =>
      _$this._suspensionReason = suspensionReason;

  int? _loginCount;
  int? get loginCount => _$this._loginCount;
  set loginCount(covariant int? loginCount) => _$this._loginCount = loginCount;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(covariant String? phone) => _$this._phone = phone;

  String? _email;
  String? get email => _$this._email;
  set email(covariant String? email) => _$this._email = email;

  UserRoleEnum? _role;
  UserRoleEnum? get role => _$this._role;
  set role(covariant UserRoleEnum? role) => _$this._role = role;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(covariant String? fullName) => _$this._fullName = fullName;

  UserStatusEnum? _status;
  UserStatusEnum? get status => _$this._status;
  set status(covariant UserStatusEnum? status) => _$this._status = status;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(covariant DateTime? createdAt) => _$this._createdAt = createdAt;

  UserAdminBuilder() {
    UserAdmin._defaults(this);
  }

  UserAdminBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _suspendedUntil = $v.suspendedUntil;
      _lastLoginAt = $v.lastLoginAt;
      _suspensionReason = $v.suspensionReason;
      _loginCount = $v.loginCount;
      _id = $v.id;
      _phone = $v.phone;
      _email = $v.email;
      _role = $v.role;
      _fullName = $v.fullName;
      _status = $v.status;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserAdmin other) {
    _$v = other as _$UserAdmin;
  }

  @override
  void update(void Function(UserAdminBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserAdmin build() => _build();

  _$UserAdmin _build() {
    final _$result =
        _$v ??
        _$UserAdmin._(
          suspendedUntil: suspendedUntil,
          lastLoginAt: lastLoginAt,
          suspensionReason: suspensionReason,
          loginCount: loginCount,
          id: id,
          phone: phone,
          email: email,
          role: role,
          fullName: fullName,
          status: status,
          createdAt: createdAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
