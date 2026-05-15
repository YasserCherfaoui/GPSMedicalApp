// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consent_grant.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ConsentGrantConsentTypeEnum _$consentGrantConsentTypeEnum_dataProcessing =
    const ConsentGrantConsentTypeEnum._('dataProcessing');
const ConsentGrantConsentTypeEnum _$consentGrantConsentTypeEnum_healthData =
    const ConsentGrantConsentTypeEnum._('healthData');
const ConsentGrantConsentTypeEnum _$consentGrantConsentTypeEnum_anpdpTerms =
    const ConsentGrantConsentTypeEnum._('anpdpTerms');
const ConsentGrantConsentTypeEnum _$consentGrantConsentTypeEnum_marketing =
    const ConsentGrantConsentTypeEnum._('marketing');

ConsentGrantConsentTypeEnum _$consentGrantConsentTypeEnumValueOf(String name) {
  switch (name) {
    case 'dataProcessing':
      return _$consentGrantConsentTypeEnum_dataProcessing;
    case 'healthData':
      return _$consentGrantConsentTypeEnum_healthData;
    case 'anpdpTerms':
      return _$consentGrantConsentTypeEnum_anpdpTerms;
    case 'marketing':
      return _$consentGrantConsentTypeEnum_marketing;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ConsentGrantConsentTypeEnum>
_$consentGrantConsentTypeEnumValues =
    BuiltSet<ConsentGrantConsentTypeEnum>(const <ConsentGrantConsentTypeEnum>[
      _$consentGrantConsentTypeEnum_dataProcessing,
      _$consentGrantConsentTypeEnum_healthData,
      _$consentGrantConsentTypeEnum_anpdpTerms,
      _$consentGrantConsentTypeEnum_marketing,
    ]);

Serializer<ConsentGrantConsentTypeEnum>
_$consentGrantConsentTypeEnumSerializer =
    _$ConsentGrantConsentTypeEnumSerializer();

class _$ConsentGrantConsentTypeEnumSerializer
    implements PrimitiveSerializer<ConsentGrantConsentTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'dataProcessing': 'data_processing',
    'healthData': 'health_data',
    'anpdpTerms': 'anpdp_terms',
    'marketing': 'marketing',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'data_processing': 'dataProcessing',
    'health_data': 'healthData',
    'anpdp_terms': 'anpdpTerms',
    'marketing': 'marketing',
  };

  @override
  final Iterable<Type> types = const <Type>[ConsentGrantConsentTypeEnum];
  @override
  final String wireName = 'ConsentGrantConsentTypeEnum';

  @override
  Object serialize(
    Serializers serializers,
    ConsentGrantConsentTypeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ConsentGrantConsentTypeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ConsentGrantConsentTypeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ConsentGrant extends ConsentGrant {
  @override
  final String id;
  @override
  final String userId;
  @override
  final ConsentGrantConsentTypeEnum consentType;
  @override
  final String version;
  @override
  final DateTime grantedAt;
  @override
  final DateTime? revokedAt;
  @override
  final String? ipAddress;
  @override
  final String? userAgent;

  factory _$ConsentGrant([void Function(ConsentGrantBuilder)? updates]) =>
      (ConsentGrantBuilder()..update(updates))._build();

  _$ConsentGrant._({
    required this.id,
    required this.userId,
    required this.consentType,
    required this.version,
    required this.grantedAt,
    this.revokedAt,
    this.ipAddress,
    this.userAgent,
  }) : super._();
  @override
  ConsentGrant rebuild(void Function(ConsentGrantBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConsentGrantBuilder toBuilder() => ConsentGrantBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConsentGrant &&
        id == other.id &&
        userId == other.userId &&
        consentType == other.consentType &&
        version == other.version &&
        grantedAt == other.grantedAt &&
        revokedAt == other.revokedAt &&
        ipAddress == other.ipAddress &&
        userAgent == other.userAgent;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, consentType.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, grantedAt.hashCode);
    _$hash = $jc(_$hash, revokedAt.hashCode);
    _$hash = $jc(_$hash, ipAddress.hashCode);
    _$hash = $jc(_$hash, userAgent.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConsentGrant')
          ..add('id', id)
          ..add('userId', userId)
          ..add('consentType', consentType)
          ..add('version', version)
          ..add('grantedAt', grantedAt)
          ..add('revokedAt', revokedAt)
          ..add('ipAddress', ipAddress)
          ..add('userAgent', userAgent))
        .toString();
  }
}

class ConsentGrantBuilder
    implements Builder<ConsentGrant, ConsentGrantBuilder> {
  _$ConsentGrant? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  ConsentGrantConsentTypeEnum? _consentType;
  ConsentGrantConsentTypeEnum? get consentType => _$this._consentType;
  set consentType(ConsentGrantConsentTypeEnum? consentType) =>
      _$this._consentType = consentType;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  DateTime? _grantedAt;
  DateTime? get grantedAt => _$this._grantedAt;
  set grantedAt(DateTime? grantedAt) => _$this._grantedAt = grantedAt;

  DateTime? _revokedAt;
  DateTime? get revokedAt => _$this._revokedAt;
  set revokedAt(DateTime? revokedAt) => _$this._revokedAt = revokedAt;

  String? _ipAddress;
  String? get ipAddress => _$this._ipAddress;
  set ipAddress(String? ipAddress) => _$this._ipAddress = ipAddress;

  String? _userAgent;
  String? get userAgent => _$this._userAgent;
  set userAgent(String? userAgent) => _$this._userAgent = userAgent;

  ConsentGrantBuilder() {
    ConsentGrant._defaults(this);
  }

  ConsentGrantBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _consentType = $v.consentType;
      _version = $v.version;
      _grantedAt = $v.grantedAt;
      _revokedAt = $v.revokedAt;
      _ipAddress = $v.ipAddress;
      _userAgent = $v.userAgent;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConsentGrant other) {
    _$v = other as _$ConsentGrant;
  }

  @override
  void update(void Function(ConsentGrantBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConsentGrant build() => _build();

  _$ConsentGrant _build() {
    final _$result =
        _$v ??
        _$ConsentGrant._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'ConsentGrant', 'id'),
          userId: BuiltValueNullFieldError.checkNotNull(
            userId,
            r'ConsentGrant',
            'userId',
          ),
          consentType: BuiltValueNullFieldError.checkNotNull(
            consentType,
            r'ConsentGrant',
            'consentType',
          ),
          version: BuiltValueNullFieldError.checkNotNull(
            version,
            r'ConsentGrant',
            'version',
          ),
          grantedAt: BuiltValueNullFieldError.checkNotNull(
            grantedAt,
            r'ConsentGrant',
            'grantedAt',
          ),
          revokedAt: revokedAt,
          ipAddress: ipAddress,
          userAgent: userAgent,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
