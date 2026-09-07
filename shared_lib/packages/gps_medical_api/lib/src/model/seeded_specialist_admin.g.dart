// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seeded_specialist_admin.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SeededSpecialistAdminSource_Enum _$seededSpecialistAdminSourceEnum_osm =
    const SeededSpecialistAdminSource_Enum._('osm');

SeededSpecialistAdminSource_Enum _$seededSpecialistAdminSourceEnumValueOf(
  String name,
) {
  switch (name) {
    case 'osm':
      return _$seededSpecialistAdminSourceEnum_osm;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<SeededSpecialistAdminSource_Enum>
_$seededSpecialistAdminSourceEnumValues =
    BuiltSet<SeededSpecialistAdminSource_Enum>(
      const <SeededSpecialistAdminSource_Enum>[
        _$seededSpecialistAdminSourceEnum_osm,
      ],
    );

Serializer<SeededSpecialistAdminSource_Enum>
_$seededSpecialistAdminSourceEnumSerializer =
    _$SeededSpecialistAdminSource_EnumSerializer();

class _$SeededSpecialistAdminSource_EnumSerializer
    implements PrimitiveSerializer<SeededSpecialistAdminSource_Enum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'osm': 'osm',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'osm': 'osm',
  };

  @override
  final Iterable<Type> types = const <Type>[SeededSpecialistAdminSource_Enum];
  @override
  final String wireName = 'SeededSpecialistAdminSource_Enum';

  @override
  Object serialize(
    Serializers serializers,
    SeededSpecialistAdminSource_Enum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  SeededSpecialistAdminSource_Enum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => SeededSpecialistAdminSource_Enum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$SeededSpecialistAdmin extends SeededSpecialistAdmin {
  @override
  final String specialistId;
  @override
  final String userId;
  @override
  final String fullName;
  @override
  final String? specialtyCode;
  @override
  final String? wilayaCode;
  @override
  final String? wilayaName;
  @override
  final CountryCode? country;
  @override
  final SeededSpecialistClaimStatus claimStatus;
  @override
  final String? verificationStatus;
  @override
  final bool verified;
  @override
  final SeededSpecialistAdminSource_Enum source_;
  @override
  final String? sourceAttribution;
  @override
  final DateTime? createdAt;

  factory _$SeededSpecialistAdmin([
    void Function(SeededSpecialistAdminBuilder)? updates,
  ]) => (SeededSpecialistAdminBuilder()..update(updates))._build();

  _$SeededSpecialistAdmin._({
    required this.specialistId,
    required this.userId,
    required this.fullName,
    this.specialtyCode,
    this.wilayaCode,
    this.wilayaName,
    this.country,
    required this.claimStatus,
    this.verificationStatus,
    required this.verified,
    required this.source_,
    this.sourceAttribution,
    this.createdAt,
  }) : super._();
  @override
  SeededSpecialistAdmin rebuild(
    void Function(SeededSpecialistAdminBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  SeededSpecialistAdminBuilder toBuilder() =>
      SeededSpecialistAdminBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SeededSpecialistAdmin &&
        specialistId == other.specialistId &&
        userId == other.userId &&
        fullName == other.fullName &&
        specialtyCode == other.specialtyCode &&
        wilayaCode == other.wilayaCode &&
        wilayaName == other.wilayaName &&
        country == other.country &&
        claimStatus == other.claimStatus &&
        verificationStatus == other.verificationStatus &&
        verified == other.verified &&
        source_ == other.source_ &&
        sourceAttribution == other.sourceAttribution &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, specialistId.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, specialtyCode.hashCode);
    _$hash = $jc(_$hash, wilayaCode.hashCode);
    _$hash = $jc(_$hash, wilayaName.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, claimStatus.hashCode);
    _$hash = $jc(_$hash, verificationStatus.hashCode);
    _$hash = $jc(_$hash, verified.hashCode);
    _$hash = $jc(_$hash, source_.hashCode);
    _$hash = $jc(_$hash, sourceAttribution.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SeededSpecialistAdmin')
          ..add('specialistId', specialistId)
          ..add('userId', userId)
          ..add('fullName', fullName)
          ..add('specialtyCode', specialtyCode)
          ..add('wilayaCode', wilayaCode)
          ..add('wilayaName', wilayaName)
          ..add('country', country)
          ..add('claimStatus', claimStatus)
          ..add('verificationStatus', verificationStatus)
          ..add('verified', verified)
          ..add('source_', source_)
          ..add('sourceAttribution', sourceAttribution)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class SeededSpecialistAdminBuilder
    implements Builder<SeededSpecialistAdmin, SeededSpecialistAdminBuilder> {
  _$SeededSpecialistAdmin? _$v;

  String? _specialistId;
  String? get specialistId => _$this._specialistId;
  set specialistId(String? specialistId) => _$this._specialistId = specialistId;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _specialtyCode;
  String? get specialtyCode => _$this._specialtyCode;
  set specialtyCode(String? specialtyCode) =>
      _$this._specialtyCode = specialtyCode;

  String? _wilayaCode;
  String? get wilayaCode => _$this._wilayaCode;
  set wilayaCode(String? wilayaCode) => _$this._wilayaCode = wilayaCode;

  String? _wilayaName;
  String? get wilayaName => _$this._wilayaName;
  set wilayaName(String? wilayaName) => _$this._wilayaName = wilayaName;

  CountryCode? _country;
  CountryCode? get country => _$this._country;
  set country(CountryCode? country) => _$this._country = country;

  SeededSpecialistClaimStatus? _claimStatus;
  SeededSpecialistClaimStatus? get claimStatus => _$this._claimStatus;
  set claimStatus(SeededSpecialistClaimStatus? claimStatus) =>
      _$this._claimStatus = claimStatus;

  String? _verificationStatus;
  String? get verificationStatus => _$this._verificationStatus;
  set verificationStatus(String? verificationStatus) =>
      _$this._verificationStatus = verificationStatus;

  bool? _verified;
  bool? get verified => _$this._verified;
  set verified(bool? verified) => _$this._verified = verified;

  SeededSpecialistAdminSource_Enum? _source_;
  SeededSpecialistAdminSource_Enum? get source_ => _$this._source_;
  set source_(SeededSpecialistAdminSource_Enum? source_) =>
      _$this._source_ = source_;

  String? _sourceAttribution;
  String? get sourceAttribution => _$this._sourceAttribution;
  set sourceAttribution(String? sourceAttribution) =>
      _$this._sourceAttribution = sourceAttribution;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  SeededSpecialistAdminBuilder() {
    SeededSpecialistAdmin._defaults(this);
  }

  SeededSpecialistAdminBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _specialistId = $v.specialistId;
      _userId = $v.userId;
      _fullName = $v.fullName;
      _specialtyCode = $v.specialtyCode;
      _wilayaCode = $v.wilayaCode;
      _wilayaName = $v.wilayaName;
      _country = $v.country;
      _claimStatus = $v.claimStatus;
      _verificationStatus = $v.verificationStatus;
      _verified = $v.verified;
      _source_ = $v.source_;
      _sourceAttribution = $v.sourceAttribution;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SeededSpecialistAdmin other) {
    _$v = other as _$SeededSpecialistAdmin;
  }

  @override
  void update(void Function(SeededSpecialistAdminBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SeededSpecialistAdmin build() => _build();

  _$SeededSpecialistAdmin _build() {
    final _$result =
        _$v ??
        _$SeededSpecialistAdmin._(
          specialistId: BuiltValueNullFieldError.checkNotNull(
            specialistId,
            r'SeededSpecialistAdmin',
            'specialistId',
          ),
          userId: BuiltValueNullFieldError.checkNotNull(
            userId,
            r'SeededSpecialistAdmin',
            'userId',
          ),
          fullName: BuiltValueNullFieldError.checkNotNull(
            fullName,
            r'SeededSpecialistAdmin',
            'fullName',
          ),
          specialtyCode: specialtyCode,
          wilayaCode: wilayaCode,
          wilayaName: wilayaName,
          country: country,
          claimStatus: BuiltValueNullFieldError.checkNotNull(
            claimStatus,
            r'SeededSpecialistAdmin',
            'claimStatus',
          ),
          verificationStatus: verificationStatus,
          verified: BuiltValueNullFieldError.checkNotNull(
            verified,
            r'SeededSpecialistAdmin',
            'verified',
          ),
          source_: BuiltValueNullFieldError.checkNotNull(
            source_,
            r'SeededSpecialistAdmin',
            'source_',
          ),
          sourceAttribution: sourceAttribution,
          createdAt: createdAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
