// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_with_distance.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DoctorWithDistanceGenderEnum _$doctorWithDistanceGenderEnum_male =
    const DoctorWithDistanceGenderEnum._('male');
const DoctorWithDistanceGenderEnum _$doctorWithDistanceGenderEnum_female =
    const DoctorWithDistanceGenderEnum._('female');

DoctorWithDistanceGenderEnum _$doctorWithDistanceGenderEnumValueOf(
  String name,
) {
  switch (name) {
    case 'male':
      return _$doctorWithDistanceGenderEnum_male;
    case 'female':
      return _$doctorWithDistanceGenderEnum_female;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DoctorWithDistanceGenderEnum>
_$doctorWithDistanceGenderEnumValues = BuiltSet<DoctorWithDistanceGenderEnum>(
  const <DoctorWithDistanceGenderEnum>[
    _$doctorWithDistanceGenderEnum_male,
    _$doctorWithDistanceGenderEnum_female,
  ],
);

const DoctorWithDistanceLanguagesEnum _$doctorWithDistanceLanguagesEnum_ar =
    const DoctorWithDistanceLanguagesEnum._('ar');
const DoctorWithDistanceLanguagesEnum _$doctorWithDistanceLanguagesEnum_fr =
    const DoctorWithDistanceLanguagesEnum._('fr');
const DoctorWithDistanceLanguagesEnum _$doctorWithDistanceLanguagesEnum_en =
    const DoctorWithDistanceLanguagesEnum._('en');
const DoctorWithDistanceLanguagesEnum _$doctorWithDistanceLanguagesEnum_ber =
    const DoctorWithDistanceLanguagesEnum._('ber');

DoctorWithDistanceLanguagesEnum _$doctorWithDistanceLanguagesEnumValueOf(
  String name,
) {
  switch (name) {
    case 'ar':
      return _$doctorWithDistanceLanguagesEnum_ar;
    case 'fr':
      return _$doctorWithDistanceLanguagesEnum_fr;
    case 'en':
      return _$doctorWithDistanceLanguagesEnum_en;
    case 'ber':
      return _$doctorWithDistanceLanguagesEnum_ber;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DoctorWithDistanceLanguagesEnum>
_$doctorWithDistanceLanguagesEnumValues =
    BuiltSet<DoctorWithDistanceLanguagesEnum>(
      const <DoctorWithDistanceLanguagesEnum>[
        _$doctorWithDistanceLanguagesEnum_ar,
        _$doctorWithDistanceLanguagesEnum_fr,
        _$doctorWithDistanceLanguagesEnum_en,
        _$doctorWithDistanceLanguagesEnum_ber,
      ],
    );

Serializer<DoctorWithDistanceGenderEnum>
_$doctorWithDistanceGenderEnumSerializer =
    _$DoctorWithDistanceGenderEnumSerializer();
Serializer<DoctorWithDistanceLanguagesEnum>
_$doctorWithDistanceLanguagesEnumSerializer =
    _$DoctorWithDistanceLanguagesEnumSerializer();

class _$DoctorWithDistanceGenderEnumSerializer
    implements PrimitiveSerializer<DoctorWithDistanceGenderEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'male': 'male',
    'female': 'female',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'male': 'male',
    'female': 'female',
  };

  @override
  final Iterable<Type> types = const <Type>[DoctorWithDistanceGenderEnum];
  @override
  final String wireName = 'DoctorWithDistanceGenderEnum';

  @override
  Object serialize(
    Serializers serializers,
    DoctorWithDistanceGenderEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  DoctorWithDistanceGenderEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => DoctorWithDistanceGenderEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$DoctorWithDistanceLanguagesEnumSerializer
    implements PrimitiveSerializer<DoctorWithDistanceLanguagesEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'ar': 'ar',
    'fr': 'fr',
    'en': 'en',
    'ber': 'ber',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ar': 'ar',
    'fr': 'fr',
    'en': 'en',
    'ber': 'ber',
  };

  @override
  final Iterable<Type> types = const <Type>[DoctorWithDistanceLanguagesEnum];
  @override
  final String wireName = 'DoctorWithDistanceLanguagesEnum';

  @override
  Object serialize(
    Serializers serializers,
    DoctorWithDistanceLanguagesEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  DoctorWithDistanceLanguagesEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => DoctorWithDistanceLanguagesEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$DoctorWithDistance extends DoctorWithDistance {
  @override
  final double? distanceKm;
  @override
  final String? id;
  @override
  final String? fullName;
  @override
  final String? title;
  @override
  final DoctorGenderEnum? gender;
  @override
  final String? photoUrl;
  @override
  final String? bio;
  @override
  final BuiltList<Specialty>? specialties;
  @override
  final BuiltList<DoctorLanguagesEnum>? languages;
  @override
  final int? consultationFeeDzd;
  @override
  final bool? acceptsCnas;
  @override
  final bool? acceptsCasnos;
  @override
  final bool? offersTelehealth;
  @override
  final Address? practiceAddress;
  @override
  final double? ratingAverage;
  @override
  final int? ratingCount;
  @override
  final bool? verified;

  factory _$DoctorWithDistance([
    void Function(DoctorWithDistanceBuilder)? updates,
  ]) => (DoctorWithDistanceBuilder()..update(updates))._build();

  _$DoctorWithDistance._({
    this.distanceKm,
    this.id,
    this.fullName,
    this.title,
    this.gender,
    this.photoUrl,
    this.bio,
    this.specialties,
    this.languages,
    this.consultationFeeDzd,
    this.acceptsCnas,
    this.acceptsCasnos,
    this.offersTelehealth,
    this.practiceAddress,
    this.ratingAverage,
    this.ratingCount,
    this.verified,
  }) : super._();
  @override
  DoctorWithDistance rebuild(
    void Function(DoctorWithDistanceBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  DoctorWithDistanceBuilder toBuilder() =>
      DoctorWithDistanceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorWithDistance &&
        distanceKm == other.distanceKm &&
        id == other.id &&
        fullName == other.fullName &&
        title == other.title &&
        gender == other.gender &&
        photoUrl == other.photoUrl &&
        bio == other.bio &&
        specialties == other.specialties &&
        languages == other.languages &&
        consultationFeeDzd == other.consultationFeeDzd &&
        acceptsCnas == other.acceptsCnas &&
        acceptsCasnos == other.acceptsCasnos &&
        offersTelehealth == other.offersTelehealth &&
        practiceAddress == other.practiceAddress &&
        ratingAverage == other.ratingAverage &&
        ratingCount == other.ratingCount &&
        verified == other.verified;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, distanceKm.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, bio.hashCode);
    _$hash = $jc(_$hash, specialties.hashCode);
    _$hash = $jc(_$hash, languages.hashCode);
    _$hash = $jc(_$hash, consultationFeeDzd.hashCode);
    _$hash = $jc(_$hash, acceptsCnas.hashCode);
    _$hash = $jc(_$hash, acceptsCasnos.hashCode);
    _$hash = $jc(_$hash, offersTelehealth.hashCode);
    _$hash = $jc(_$hash, practiceAddress.hashCode);
    _$hash = $jc(_$hash, ratingAverage.hashCode);
    _$hash = $jc(_$hash, ratingCount.hashCode);
    _$hash = $jc(_$hash, verified.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoctorWithDistance')
          ..add('distanceKm', distanceKm)
          ..add('id', id)
          ..add('fullName', fullName)
          ..add('title', title)
          ..add('gender', gender)
          ..add('photoUrl', photoUrl)
          ..add('bio', bio)
          ..add('specialties', specialties)
          ..add('languages', languages)
          ..add('consultationFeeDzd', consultationFeeDzd)
          ..add('acceptsCnas', acceptsCnas)
          ..add('acceptsCasnos', acceptsCasnos)
          ..add('offersTelehealth', offersTelehealth)
          ..add('practiceAddress', practiceAddress)
          ..add('ratingAverage', ratingAverage)
          ..add('ratingCount', ratingCount)
          ..add('verified', verified))
        .toString();
  }
}

class DoctorWithDistanceBuilder
    implements
        Builder<DoctorWithDistance, DoctorWithDistanceBuilder>,
        DoctorBuilder {
  _$DoctorWithDistance? _$v;

  double? _distanceKm;
  double? get distanceKm => _$this._distanceKm;
  set distanceKm(covariant double? distanceKm) =>
      _$this._distanceKm = distanceKm;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(covariant String? fullName) => _$this._fullName = fullName;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  DoctorGenderEnum? _gender;
  DoctorGenderEnum? get gender => _$this._gender;
  set gender(covariant DoctorGenderEnum? gender) => _$this._gender = gender;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(covariant String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(covariant String? bio) => _$this._bio = bio;

  ListBuilder<Specialty>? _specialties;
  ListBuilder<Specialty> get specialties =>
      _$this._specialties ??= ListBuilder<Specialty>();
  set specialties(covariant ListBuilder<Specialty>? specialties) =>
      _$this._specialties = specialties;

  ListBuilder<DoctorLanguagesEnum>? _languages;
  ListBuilder<DoctorLanguagesEnum> get languages =>
      _$this._languages ??= ListBuilder<DoctorLanguagesEnum>();
  set languages(covariant ListBuilder<DoctorLanguagesEnum>? languages) =>
      _$this._languages = languages;

  int? _consultationFeeDzd;
  int? get consultationFeeDzd => _$this._consultationFeeDzd;
  set consultationFeeDzd(covariant int? consultationFeeDzd) =>
      _$this._consultationFeeDzd = consultationFeeDzd;

  bool? _acceptsCnas;
  bool? get acceptsCnas => _$this._acceptsCnas;
  set acceptsCnas(covariant bool? acceptsCnas) =>
      _$this._acceptsCnas = acceptsCnas;

  bool? _acceptsCasnos;
  bool? get acceptsCasnos => _$this._acceptsCasnos;
  set acceptsCasnos(covariant bool? acceptsCasnos) =>
      _$this._acceptsCasnos = acceptsCasnos;

  bool? _offersTelehealth;
  bool? get offersTelehealth => _$this._offersTelehealth;
  set offersTelehealth(covariant bool? offersTelehealth) =>
      _$this._offersTelehealth = offersTelehealth;

  AddressBuilder? _practiceAddress;
  AddressBuilder get practiceAddress =>
      _$this._practiceAddress ??= AddressBuilder();
  set practiceAddress(covariant AddressBuilder? practiceAddress) =>
      _$this._practiceAddress = practiceAddress;

  double? _ratingAverage;
  double? get ratingAverage => _$this._ratingAverage;
  set ratingAverage(covariant double? ratingAverage) =>
      _$this._ratingAverage = ratingAverage;

  int? _ratingCount;
  int? get ratingCount => _$this._ratingCount;
  set ratingCount(covariant int? ratingCount) =>
      _$this._ratingCount = ratingCount;

  bool? _verified;
  bool? get verified => _$this._verified;
  set verified(covariant bool? verified) => _$this._verified = verified;

  DoctorWithDistanceBuilder() {
    DoctorWithDistance._defaults(this);
  }

  DoctorWithDistanceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _distanceKm = $v.distanceKm;
      _id = $v.id;
      _fullName = $v.fullName;
      _title = $v.title;
      _gender = $v.gender;
      _photoUrl = $v.photoUrl;
      _bio = $v.bio;
      _specialties = $v.specialties?.toBuilder();
      _languages = $v.languages?.toBuilder();
      _consultationFeeDzd = $v.consultationFeeDzd;
      _acceptsCnas = $v.acceptsCnas;
      _acceptsCasnos = $v.acceptsCasnos;
      _offersTelehealth = $v.offersTelehealth;
      _practiceAddress = $v.practiceAddress?.toBuilder();
      _ratingAverage = $v.ratingAverage;
      _ratingCount = $v.ratingCount;
      _verified = $v.verified;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DoctorWithDistance other) {
    _$v = other as _$DoctorWithDistance;
  }

  @override
  void update(void Function(DoctorWithDistanceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DoctorWithDistance build() => _build();

  _$DoctorWithDistance _build() {
    _$DoctorWithDistance _$result;
    try {
      _$result =
          _$v ??
          _$DoctorWithDistance._(
            distanceKm: distanceKm,
            id: id,
            fullName: fullName,
            title: title,
            gender: gender,
            photoUrl: photoUrl,
            bio: bio,
            specialties: _specialties?.build(),
            languages: _languages?.build(),
            consultationFeeDzd: consultationFeeDzd,
            acceptsCnas: acceptsCnas,
            acceptsCasnos: acceptsCasnos,
            offersTelehealth: offersTelehealth,
            practiceAddress: _practiceAddress?.build(),
            ratingAverage: ratingAverage,
            ratingCount: ratingCount,
            verified: verified,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'specialties';
        _specialties?.build();
        _$failedField = 'languages';
        _languages?.build();

        _$failedField = 'practiceAddress';
        _practiceAddress?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'DoctorWithDistance',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
