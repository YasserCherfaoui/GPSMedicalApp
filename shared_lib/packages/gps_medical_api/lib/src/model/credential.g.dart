// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CredentialTypeEnum _$credentialTypeEnum_diploma =
    const CredentialTypeEnum._('diploma');
const CredentialTypeEnum _$credentialTypeEnum_councilCard =
    const CredentialTypeEnum._('councilCard');
const CredentialTypeEnum _$credentialTypeEnum_specialtyCert =
    const CredentialTypeEnum._('specialtyCert');
const CredentialTypeEnum _$credentialTypeEnum_other =
    const CredentialTypeEnum._('other');

CredentialTypeEnum _$credentialTypeEnumValueOf(String name) {
  switch (name) {
    case 'diploma':
      return _$credentialTypeEnum_diploma;
    case 'councilCard':
      return _$credentialTypeEnum_councilCard;
    case 'specialtyCert':
      return _$credentialTypeEnum_specialtyCert;
    case 'other':
      return _$credentialTypeEnum_other;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<CredentialTypeEnum> _$credentialTypeEnumValues =
    BuiltSet<CredentialTypeEnum>(const <CredentialTypeEnum>[
      _$credentialTypeEnum_diploma,
      _$credentialTypeEnum_councilCard,
      _$credentialTypeEnum_specialtyCert,
      _$credentialTypeEnum_other,
    ]);

const CredentialStatusEnum _$credentialStatusEnum_pending =
    const CredentialStatusEnum._('pending');
const CredentialStatusEnum _$credentialStatusEnum_approved =
    const CredentialStatusEnum._('approved');
const CredentialStatusEnum _$credentialStatusEnum_rejected =
    const CredentialStatusEnum._('rejected');

CredentialStatusEnum _$credentialStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$credentialStatusEnum_pending;
    case 'approved':
      return _$credentialStatusEnum_approved;
    case 'rejected':
      return _$credentialStatusEnum_rejected;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<CredentialStatusEnum> _$credentialStatusEnumValues =
    BuiltSet<CredentialStatusEnum>(const <CredentialStatusEnum>[
      _$credentialStatusEnum_pending,
      _$credentialStatusEnum_approved,
      _$credentialStatusEnum_rejected,
    ]);

Serializer<CredentialTypeEnum> _$credentialTypeEnumSerializer =
    _$CredentialTypeEnumSerializer();
Serializer<CredentialStatusEnum> _$credentialStatusEnumSerializer =
    _$CredentialStatusEnumSerializer();

class _$CredentialTypeEnumSerializer
    implements PrimitiveSerializer<CredentialTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'diploma': 'diploma',
    'councilCard': 'council_card',
    'specialtyCert': 'specialty_cert',
    'other': 'other',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'diploma': 'diploma',
    'council_card': 'councilCard',
    'specialty_cert': 'specialtyCert',
    'other': 'other',
  };

  @override
  final Iterable<Type> types = const <Type>[CredentialTypeEnum];
  @override
  final String wireName = 'CredentialTypeEnum';

  @override
  Object serialize(
    Serializers serializers,
    CredentialTypeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  CredentialTypeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => CredentialTypeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$CredentialStatusEnumSerializer
    implements PrimitiveSerializer<CredentialStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'pending',
    'approved': 'approved',
    'rejected': 'rejected',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending': 'pending',
    'approved': 'approved',
    'rejected': 'rejected',
  };

  @override
  final Iterable<Type> types = const <Type>[CredentialStatusEnum];
  @override
  final String wireName = 'CredentialStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    CredentialStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  CredentialStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => CredentialStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$Credential extends Credential {
  @override
  final String? id;
  @override
  final CredentialTypeEnum? type;
  @override
  final String? fileUrl;
  @override
  final int? issuedYear;
  @override
  final CredentialStatusEnum? status;
  @override
  final DateTime? reviewedAt;

  factory _$Credential([void Function(CredentialBuilder)? updates]) =>
      (CredentialBuilder()..update(updates))._build();

  _$Credential._({
    this.id,
    this.type,
    this.fileUrl,
    this.issuedYear,
    this.status,
    this.reviewedAt,
  }) : super._();
  @override
  Credential rebuild(void Function(CredentialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CredentialBuilder toBuilder() => CredentialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Credential &&
        id == other.id &&
        type == other.type &&
        fileUrl == other.fileUrl &&
        issuedYear == other.issuedYear &&
        status == other.status &&
        reviewedAt == other.reviewedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, fileUrl.hashCode);
    _$hash = $jc(_$hash, issuedYear.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, reviewedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Credential')
          ..add('id', id)
          ..add('type', type)
          ..add('fileUrl', fileUrl)
          ..add('issuedYear', issuedYear)
          ..add('status', status)
          ..add('reviewedAt', reviewedAt))
        .toString();
  }
}

class CredentialBuilder implements Builder<Credential, CredentialBuilder> {
  _$Credential? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  CredentialTypeEnum? _type;
  CredentialTypeEnum? get type => _$this._type;
  set type(CredentialTypeEnum? type) => _$this._type = type;

  String? _fileUrl;
  String? get fileUrl => _$this._fileUrl;
  set fileUrl(String? fileUrl) => _$this._fileUrl = fileUrl;

  int? _issuedYear;
  int? get issuedYear => _$this._issuedYear;
  set issuedYear(int? issuedYear) => _$this._issuedYear = issuedYear;

  CredentialStatusEnum? _status;
  CredentialStatusEnum? get status => _$this._status;
  set status(CredentialStatusEnum? status) => _$this._status = status;

  DateTime? _reviewedAt;
  DateTime? get reviewedAt => _$this._reviewedAt;
  set reviewedAt(DateTime? reviewedAt) => _$this._reviewedAt = reviewedAt;

  CredentialBuilder() {
    Credential._defaults(this);
  }

  CredentialBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _fileUrl = $v.fileUrl;
      _issuedYear = $v.issuedYear;
      _status = $v.status;
      _reviewedAt = $v.reviewedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Credential other) {
    _$v = other as _$Credential;
  }

  @override
  void update(void Function(CredentialBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Credential build() => _build();

  _$Credential _build() {
    final _$result =
        _$v ??
        _$Credential._(
          id: id,
          type: type,
          fileUrl: fileUrl,
          issuedYear: issuedYear,
          status: status,
          reviewedAt: reviewedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
