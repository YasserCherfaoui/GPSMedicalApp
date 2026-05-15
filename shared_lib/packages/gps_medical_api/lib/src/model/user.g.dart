// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UserRoleEnum _$userRoleEnum_patient = const UserRoleEnum._('patient');
const UserRoleEnum _$userRoleEnum_specialist = const UserRoleEnum._(
  'specialist',
);
const UserRoleEnum _$userRoleEnum_concierge = const UserRoleEnum._('concierge');
const UserRoleEnum _$userRoleEnum_admin = const UserRoleEnum._('admin');
const UserRoleEnum _$userRoleEnum_moderator = const UserRoleEnum._('moderator');

UserRoleEnum _$userRoleEnumValueOf(String name) {
  switch (name) {
    case 'patient':
      return _$userRoleEnum_patient;
    case 'specialist':
      return _$userRoleEnum_specialist;
    case 'concierge':
      return _$userRoleEnum_concierge;
    case 'admin':
      return _$userRoleEnum_admin;
    case 'moderator':
      return _$userRoleEnum_moderator;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UserRoleEnum> _$userRoleEnumValues =
    BuiltSet<UserRoleEnum>(const <UserRoleEnum>[
      _$userRoleEnum_patient,
      _$userRoleEnum_specialist,
      _$userRoleEnum_concierge,
      _$userRoleEnum_admin,
      _$userRoleEnum_moderator,
    ]);

const UserStatusEnum _$userStatusEnum_pendingVerification =
    const UserStatusEnum._('pendingVerification');
const UserStatusEnum _$userStatusEnum_active = const UserStatusEnum._('active');
const UserStatusEnum _$userStatusEnum_suspended = const UserStatusEnum._(
  'suspended',
);
const UserStatusEnum _$userStatusEnum_deleted = const UserStatusEnum._(
  'deleted',
);

UserStatusEnum _$userStatusEnumValueOf(String name) {
  switch (name) {
    case 'pendingVerification':
      return _$userStatusEnum_pendingVerification;
    case 'active':
      return _$userStatusEnum_active;
    case 'suspended':
      return _$userStatusEnum_suspended;
    case 'deleted':
      return _$userStatusEnum_deleted;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UserStatusEnum> _$userStatusEnumValues =
    BuiltSet<UserStatusEnum>(const <UserStatusEnum>[
      _$userStatusEnum_pendingVerification,
      _$userStatusEnum_active,
      _$userStatusEnum_suspended,
      _$userStatusEnum_deleted,
    ]);

Serializer<UserRoleEnum> _$userRoleEnumSerializer = _$UserRoleEnumSerializer();
Serializer<UserStatusEnum> _$userStatusEnumSerializer =
    _$UserStatusEnumSerializer();

class _$UserRoleEnumSerializer implements PrimitiveSerializer<UserRoleEnum> {
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
  final Iterable<Type> types = const <Type>[UserRoleEnum];
  @override
  final String wireName = 'UserRoleEnum';

  @override
  Object serialize(
    Serializers serializers,
    UserRoleEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  UserRoleEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => UserRoleEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$UserStatusEnumSerializer
    implements PrimitiveSerializer<UserStatusEnum> {
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
  final Iterable<Type> types = const <Type>[UserStatusEnum];
  @override
  final String wireName = 'UserStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    UserStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  UserStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => UserStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

abstract class UserBuilder {
  void replace(User other);
  void update(void Function(UserBuilder) updates);
  String? get id;
  set id(String? id);

  String? get phone;
  set phone(String? phone);

  String? get email;
  set email(String? email);

  UserRoleEnum? get role;
  set role(UserRoleEnum? role);

  String? get fullName;
  set fullName(String? fullName);

  UserStatusEnum? get status;
  set status(UserStatusEnum? status);

  DateTime? get createdAt;
  set createdAt(DateTime? createdAt);
}

class _$$User extends $User {
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

  factory _$$User([void Function($UserBuilder)? updates]) =>
      ($UserBuilder()..update(updates))._build();

  _$$User._({
    this.id,
    this.phone,
    this.email,
    this.role,
    this.fullName,
    this.status,
    this.createdAt,
  }) : super._();
  @override
  $User rebuild(void Function($UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $UserBuilder toBuilder() => $UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $User &&
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
    return (newBuiltValueToStringHelper(r'$User')
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

class $UserBuilder implements Builder<$User, $UserBuilder>, UserBuilder {
  _$$User? _$v;

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

  $UserBuilder() {
    $User._defaults(this);
  }

  $UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
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
  void replace(covariant $User other) {
    _$v = other as _$$User;
  }

  @override
  void update(void Function($UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $User build() => _build();

  _$$User _build() {
    final _$result =
        _$v ??
        _$$User._(
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
