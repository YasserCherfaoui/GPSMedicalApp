// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_credential.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicCredentialTypeEnum _$clinicCredentialTypeEnum_registreCommerce =
    const ClinicCredentialTypeEnum._('registreCommerce');
const ClinicCredentialTypeEnum _$clinicCredentialTypeEnum_agrementSante =
    const ClinicCredentialTypeEnum._('agrementSante');
const ClinicCredentialTypeEnum _$clinicCredentialTypeEnum_other =
    const ClinicCredentialTypeEnum._('other');

ClinicCredentialTypeEnum _$clinicCredentialTypeEnumValueOf(String name) {
  switch (name) {
    case 'registreCommerce':
      return _$clinicCredentialTypeEnum_registreCommerce;
    case 'agrementSante':
      return _$clinicCredentialTypeEnum_agrementSante;
    case 'other':
      return _$clinicCredentialTypeEnum_other;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicCredentialTypeEnum> _$clinicCredentialTypeEnumValues =
    BuiltSet<ClinicCredentialTypeEnum>(const <ClinicCredentialTypeEnum>[
      _$clinicCredentialTypeEnum_registreCommerce,
      _$clinicCredentialTypeEnum_agrementSante,
      _$clinicCredentialTypeEnum_other,
    ]);

const ClinicCredentialStatusEnum _$clinicCredentialStatusEnum_pending =
    const ClinicCredentialStatusEnum._('pending');
const ClinicCredentialStatusEnum _$clinicCredentialStatusEnum_approved =
    const ClinicCredentialStatusEnum._('approved');
const ClinicCredentialStatusEnum _$clinicCredentialStatusEnum_rejected =
    const ClinicCredentialStatusEnum._('rejected');

ClinicCredentialStatusEnum _$clinicCredentialStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$clinicCredentialStatusEnum_pending;
    case 'approved':
      return _$clinicCredentialStatusEnum_approved;
    case 'rejected':
      return _$clinicCredentialStatusEnum_rejected;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicCredentialStatusEnum> _$clinicCredentialStatusEnumValues =
    BuiltSet<ClinicCredentialStatusEnum>(const <ClinicCredentialStatusEnum>[
      _$clinicCredentialStatusEnum_pending,
      _$clinicCredentialStatusEnum_approved,
      _$clinicCredentialStatusEnum_rejected,
    ]);

Serializer<ClinicCredentialTypeEnum> _$clinicCredentialTypeEnumSerializer =
    _$ClinicCredentialTypeEnumSerializer();
Serializer<ClinicCredentialStatusEnum> _$clinicCredentialStatusEnumSerializer =
    _$ClinicCredentialStatusEnumSerializer();

class _$ClinicCredentialTypeEnumSerializer
    implements PrimitiveSerializer<ClinicCredentialTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'registreCommerce': 'registre_commerce',
    'agrementSante': 'agrement_sante',
    'other': 'other',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'registre_commerce': 'registreCommerce',
    'agrement_sante': 'agrementSante',
    'other': 'other',
  };

  @override
  final Iterable<Type> types = const <Type>[ClinicCredentialTypeEnum];
  @override
  final String wireName = 'ClinicCredentialTypeEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicCredentialTypeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicCredentialTypeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicCredentialTypeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ClinicCredentialStatusEnumSerializer
    implements PrimitiveSerializer<ClinicCredentialStatusEnum> {
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
  final Iterable<Type> types = const <Type>[ClinicCredentialStatusEnum];
  @override
  final String wireName = 'ClinicCredentialStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicCredentialStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicCredentialStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicCredentialStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ClinicCredential extends ClinicCredential {
  @override
  final String? id;
  @override
  final ClinicCredentialTypeEnum? type;
  @override
  final String? fileUrl;
  @override
  final int? issuedYear;
  @override
  final ClinicCredentialStatusEnum? status;
  @override
  final DateTime? reviewedAt;

  factory _$ClinicCredential([
    void Function(ClinicCredentialBuilder)? updates,
  ]) => (ClinicCredentialBuilder()..update(updates))._build();

  _$ClinicCredential._({
    this.id,
    this.type,
    this.fileUrl,
    this.issuedYear,
    this.status,
    this.reviewedAt,
  }) : super._();
  @override
  ClinicCredential rebuild(void Function(ClinicCredentialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClinicCredentialBuilder toBuilder() =>
      ClinicCredentialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicCredential &&
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
    return (newBuiltValueToStringHelper(r'ClinicCredential')
          ..add('id', id)
          ..add('type', type)
          ..add('fileUrl', fileUrl)
          ..add('issuedYear', issuedYear)
          ..add('status', status)
          ..add('reviewedAt', reviewedAt))
        .toString();
  }
}

class ClinicCredentialBuilder
    implements Builder<ClinicCredential, ClinicCredentialBuilder> {
  _$ClinicCredential? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ClinicCredentialTypeEnum? _type;
  ClinicCredentialTypeEnum? get type => _$this._type;
  set type(ClinicCredentialTypeEnum? type) => _$this._type = type;

  String? _fileUrl;
  String? get fileUrl => _$this._fileUrl;
  set fileUrl(String? fileUrl) => _$this._fileUrl = fileUrl;

  int? _issuedYear;
  int? get issuedYear => _$this._issuedYear;
  set issuedYear(int? issuedYear) => _$this._issuedYear = issuedYear;

  ClinicCredentialStatusEnum? _status;
  ClinicCredentialStatusEnum? get status => _$this._status;
  set status(ClinicCredentialStatusEnum? status) => _$this._status = status;

  DateTime? _reviewedAt;
  DateTime? get reviewedAt => _$this._reviewedAt;
  set reviewedAt(DateTime? reviewedAt) => _$this._reviewedAt = reviewedAt;

  ClinicCredentialBuilder() {
    ClinicCredential._defaults(this);
  }

  ClinicCredentialBuilder get _$this {
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
  void replace(ClinicCredential other) {
    _$v = other as _$ClinicCredential;
  }

  @override
  void update(void Function(ClinicCredentialBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicCredential build() => _build();

  _$ClinicCredential _build() {
    final _$result =
        _$v ??
        _$ClinicCredential._(
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
