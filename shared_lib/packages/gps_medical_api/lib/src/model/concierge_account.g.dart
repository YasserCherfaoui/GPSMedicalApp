// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concierge_account.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ConciergeAccountStatusEnum _$conciergeAccountStatusEnum_active =
    const ConciergeAccountStatusEnum._('active');
const ConciergeAccountStatusEnum _$conciergeAccountStatusEnum_suspended =
    const ConciergeAccountStatusEnum._('suspended');

ConciergeAccountStatusEnum _$conciergeAccountStatusEnumValueOf(String name) {
  switch (name) {
    case 'active':
      return _$conciergeAccountStatusEnum_active;
    case 'suspended':
      return _$conciergeAccountStatusEnum_suspended;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ConciergeAccountStatusEnum> _$conciergeAccountStatusEnumValues =
    BuiltSet<ConciergeAccountStatusEnum>(const <ConciergeAccountStatusEnum>[
      _$conciergeAccountStatusEnum_active,
      _$conciergeAccountStatusEnum_suspended,
    ]);

const ConciergeAccountRoleEnum _$conciergeAccountRoleEnum_concierge =
    const ConciergeAccountRoleEnum._('concierge');

ConciergeAccountRoleEnum _$conciergeAccountRoleEnumValueOf(String name) {
  switch (name) {
    case 'concierge':
      return _$conciergeAccountRoleEnum_concierge;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ConciergeAccountRoleEnum> _$conciergeAccountRoleEnumValues =
    BuiltSet<ConciergeAccountRoleEnum>(const <ConciergeAccountRoleEnum>[
      _$conciergeAccountRoleEnum_concierge,
    ]);

Serializer<ConciergeAccountStatusEnum> _$conciergeAccountStatusEnumSerializer =
    _$ConciergeAccountStatusEnumSerializer();
Serializer<ConciergeAccountRoleEnum> _$conciergeAccountRoleEnumSerializer =
    _$ConciergeAccountRoleEnumSerializer();

class _$ConciergeAccountStatusEnumSerializer
    implements PrimitiveSerializer<ConciergeAccountStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'active': 'active',
    'suspended': 'suspended',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'active': 'active',
    'suspended': 'suspended',
  };

  @override
  final Iterable<Type> types = const <Type>[ConciergeAccountStatusEnum];
  @override
  final String wireName = 'ConciergeAccountStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    ConciergeAccountStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ConciergeAccountStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ConciergeAccountStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ConciergeAccountRoleEnumSerializer
    implements PrimitiveSerializer<ConciergeAccountRoleEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'concierge': 'concierge',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'concierge': 'concierge',
  };

  @override
  final Iterable<Type> types = const <Type>[ConciergeAccountRoleEnum];
  @override
  final String wireName = 'ConciergeAccountRoleEnum';

  @override
  Object serialize(
    Serializers serializers,
    ConciergeAccountRoleEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ConciergeAccountRoleEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ConciergeAccountRoleEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ConciergeAccount extends ConciergeAccount {
  @override
  final String userId;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String fullName;
  @override
  final CountryCode country;
  @override
  final ConciergeAccountStatusEnum status;
  @override
  final ConciergeAccountRoleEnum role;
  @override
  final int? openCaseCount;
  @override
  final DateTime? createdAt;

  factory _$ConciergeAccount([
    void Function(ConciergeAccountBuilder)? updates,
  ]) => (ConciergeAccountBuilder()..update(updates))._build();

  _$ConciergeAccount._({
    required this.userId,
    this.phone,
    this.email,
    required this.fullName,
    required this.country,
    required this.status,
    required this.role,
    this.openCaseCount,
    this.createdAt,
  }) : super._();
  @override
  ConciergeAccount rebuild(void Function(ConciergeAccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConciergeAccountBuilder toBuilder() =>
      ConciergeAccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConciergeAccount &&
        userId == other.userId &&
        phone == other.phone &&
        email == other.email &&
        fullName == other.fullName &&
        country == other.country &&
        status == other.status &&
        role == other.role &&
        openCaseCount == other.openCaseCount &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, openCaseCount.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConciergeAccount')
          ..add('userId', userId)
          ..add('phone', phone)
          ..add('email', email)
          ..add('fullName', fullName)
          ..add('country', country)
          ..add('status', status)
          ..add('role', role)
          ..add('openCaseCount', openCaseCount)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class ConciergeAccountBuilder
    implements Builder<ConciergeAccount, ConciergeAccountBuilder> {
  _$ConciergeAccount? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  CountryCode? _country;
  CountryCode? get country => _$this._country;
  set country(CountryCode? country) => _$this._country = country;

  ConciergeAccountStatusEnum? _status;
  ConciergeAccountStatusEnum? get status => _$this._status;
  set status(ConciergeAccountStatusEnum? status) => _$this._status = status;

  ConciergeAccountRoleEnum? _role;
  ConciergeAccountRoleEnum? get role => _$this._role;
  set role(ConciergeAccountRoleEnum? role) => _$this._role = role;

  int? _openCaseCount;
  int? get openCaseCount => _$this._openCaseCount;
  set openCaseCount(int? openCaseCount) =>
      _$this._openCaseCount = openCaseCount;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  ConciergeAccountBuilder() {
    ConciergeAccount._defaults(this);
  }

  ConciergeAccountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _phone = $v.phone;
      _email = $v.email;
      _fullName = $v.fullName;
      _country = $v.country;
      _status = $v.status;
      _role = $v.role;
      _openCaseCount = $v.openCaseCount;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConciergeAccount other) {
    _$v = other as _$ConciergeAccount;
  }

  @override
  void update(void Function(ConciergeAccountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConciergeAccount build() => _build();

  _$ConciergeAccount _build() {
    final _$result =
        _$v ??
        _$ConciergeAccount._(
          userId: BuiltValueNullFieldError.checkNotNull(
            userId,
            r'ConciergeAccount',
            'userId',
          ),
          phone: phone,
          email: email,
          fullName: BuiltValueNullFieldError.checkNotNull(
            fullName,
            r'ConciergeAccount',
            'fullName',
          ),
          country: BuiltValueNullFieldError.checkNotNull(
            country,
            r'ConciergeAccount',
            'country',
          ),
          status: BuiltValueNullFieldError.checkNotNull(
            status,
            r'ConciergeAccount',
            'status',
          ),
          role: BuiltValueNullFieldError.checkNotNull(
            role,
            r'ConciergeAccount',
            'role',
          ),
          openCaseCount: openCaseCount,
          createdAt: createdAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
