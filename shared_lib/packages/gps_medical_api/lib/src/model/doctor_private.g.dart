// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_private.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DoctorPrivateGenderEnum _$doctorPrivateGenderEnum_male =
    const DoctorPrivateGenderEnum._('male');
const DoctorPrivateGenderEnum _$doctorPrivateGenderEnum_female =
    const DoctorPrivateGenderEnum._('female');

DoctorPrivateGenderEnum _$doctorPrivateGenderEnumValueOf(String name) {
  switch (name) {
    case 'male':
      return _$doctorPrivateGenderEnum_male;
    case 'female':
      return _$doctorPrivateGenderEnum_female;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DoctorPrivateGenderEnum> _$doctorPrivateGenderEnumValues =
    BuiltSet<DoctorPrivateGenderEnum>(const <DoctorPrivateGenderEnum>[
      _$doctorPrivateGenderEnum_male,
      _$doctorPrivateGenderEnum_female,
    ]);

const DoctorPrivateLanguagesEnum _$doctorPrivateLanguagesEnum_ar =
    const DoctorPrivateLanguagesEnum._('ar');
const DoctorPrivateLanguagesEnum _$doctorPrivateLanguagesEnum_fr =
    const DoctorPrivateLanguagesEnum._('fr');
const DoctorPrivateLanguagesEnum _$doctorPrivateLanguagesEnum_en =
    const DoctorPrivateLanguagesEnum._('en');
const DoctorPrivateLanguagesEnum _$doctorPrivateLanguagesEnum_ber =
    const DoctorPrivateLanguagesEnum._('ber');

DoctorPrivateLanguagesEnum _$doctorPrivateLanguagesEnumValueOf(String name) {
  switch (name) {
    case 'ar':
      return _$doctorPrivateLanguagesEnum_ar;
    case 'fr':
      return _$doctorPrivateLanguagesEnum_fr;
    case 'en':
      return _$doctorPrivateLanguagesEnum_en;
    case 'ber':
      return _$doctorPrivateLanguagesEnum_ber;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DoctorPrivateLanguagesEnum> _$doctorPrivateLanguagesEnumValues =
    BuiltSet<DoctorPrivateLanguagesEnum>(const <DoctorPrivateLanguagesEnum>[
      _$doctorPrivateLanguagesEnum_ar,
      _$doctorPrivateLanguagesEnum_fr,
      _$doctorPrivateLanguagesEnum_en,
      _$doctorPrivateLanguagesEnum_ber,
    ]);

const DoctorPrivateVerificationStatusEnum
_$doctorPrivateVerificationStatusEnum_pending =
    const DoctorPrivateVerificationStatusEnum._('pending');
const DoctorPrivateVerificationStatusEnum
_$doctorPrivateVerificationStatusEnum_inReview =
    const DoctorPrivateVerificationStatusEnum._('inReview');
const DoctorPrivateVerificationStatusEnum
_$doctorPrivateVerificationStatusEnum_approved =
    const DoctorPrivateVerificationStatusEnum._('approved');
const DoctorPrivateVerificationStatusEnum
_$doctorPrivateVerificationStatusEnum_rejected =
    const DoctorPrivateVerificationStatusEnum._('rejected');

DoctorPrivateVerificationStatusEnum
_$doctorPrivateVerificationStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$doctorPrivateVerificationStatusEnum_pending;
    case 'inReview':
      return _$doctorPrivateVerificationStatusEnum_inReview;
    case 'approved':
      return _$doctorPrivateVerificationStatusEnum_approved;
    case 'rejected':
      return _$doctorPrivateVerificationStatusEnum_rejected;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DoctorPrivateVerificationStatusEnum>
_$doctorPrivateVerificationStatusEnumValues =
    BuiltSet<DoctorPrivateVerificationStatusEnum>(
      const <DoctorPrivateVerificationStatusEnum>[
        _$doctorPrivateVerificationStatusEnum_pending,
        _$doctorPrivateVerificationStatusEnum_inReview,
        _$doctorPrivateVerificationStatusEnum_approved,
        _$doctorPrivateVerificationStatusEnum_rejected,
      ],
    );

const DoctorPrivateConfirmationPolicyEnum
_$doctorPrivateConfirmationPolicyEnum_auto =
    const DoctorPrivateConfirmationPolicyEnum._('auto');
const DoctorPrivateConfirmationPolicyEnum
_$doctorPrivateConfirmationPolicyEnum_manual =
    const DoctorPrivateConfirmationPolicyEnum._('manual');

DoctorPrivateConfirmationPolicyEnum
_$doctorPrivateConfirmationPolicyEnumValueOf(String name) {
  switch (name) {
    case 'auto':
      return _$doctorPrivateConfirmationPolicyEnum_auto;
    case 'manual':
      return _$doctorPrivateConfirmationPolicyEnum_manual;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DoctorPrivateConfirmationPolicyEnum>
_$doctorPrivateConfirmationPolicyEnumValues =
    BuiltSet<DoctorPrivateConfirmationPolicyEnum>(
      const <DoctorPrivateConfirmationPolicyEnum>[
        _$doctorPrivateConfirmationPolicyEnum_auto,
        _$doctorPrivateConfirmationPolicyEnum_manual,
      ],
    );

Serializer<DoctorPrivateGenderEnum> _$doctorPrivateGenderEnumSerializer =
    _$DoctorPrivateGenderEnumSerializer();
Serializer<DoctorPrivateLanguagesEnum> _$doctorPrivateLanguagesEnumSerializer =
    _$DoctorPrivateLanguagesEnumSerializer();
Serializer<DoctorPrivateVerificationStatusEnum>
_$doctorPrivateVerificationStatusEnumSerializer =
    _$DoctorPrivateVerificationStatusEnumSerializer();
Serializer<DoctorPrivateConfirmationPolicyEnum>
_$doctorPrivateConfirmationPolicyEnumSerializer =
    _$DoctorPrivateConfirmationPolicyEnumSerializer();

class _$DoctorPrivateGenderEnumSerializer
    implements PrimitiveSerializer<DoctorPrivateGenderEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'male': 'male',
    'female': 'female',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'male': 'male',
    'female': 'female',
  };

  @override
  final Iterable<Type> types = const <Type>[DoctorPrivateGenderEnum];
  @override
  final String wireName = 'DoctorPrivateGenderEnum';

  @override
  Object serialize(
    Serializers serializers,
    DoctorPrivateGenderEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  DoctorPrivateGenderEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => DoctorPrivateGenderEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$DoctorPrivateLanguagesEnumSerializer
    implements PrimitiveSerializer<DoctorPrivateLanguagesEnum> {
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
  final Iterable<Type> types = const <Type>[DoctorPrivateLanguagesEnum];
  @override
  final String wireName = 'DoctorPrivateLanguagesEnum';

  @override
  Object serialize(
    Serializers serializers,
    DoctorPrivateLanguagesEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  DoctorPrivateLanguagesEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => DoctorPrivateLanguagesEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$DoctorPrivateVerificationStatusEnumSerializer
    implements PrimitiveSerializer<DoctorPrivateVerificationStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'pending',
    'inReview': 'in_review',
    'approved': 'approved',
    'rejected': 'rejected',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending': 'pending',
    'in_review': 'inReview',
    'approved': 'approved',
    'rejected': 'rejected',
  };

  @override
  final Iterable<Type> types = const <Type>[
    DoctorPrivateVerificationStatusEnum,
  ];
  @override
  final String wireName = 'DoctorPrivateVerificationStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    DoctorPrivateVerificationStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  DoctorPrivateVerificationStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => DoctorPrivateVerificationStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$DoctorPrivateConfirmationPolicyEnumSerializer
    implements PrimitiveSerializer<DoctorPrivateConfirmationPolicyEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'auto': 'auto',
    'manual': 'manual',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'auto': 'auto',
    'manual': 'manual',
  };

  @override
  final Iterable<Type> types = const <Type>[
    DoctorPrivateConfirmationPolicyEnum,
  ];
  @override
  final String wireName = 'DoctorPrivateConfirmationPolicyEnum';

  @override
  Object serialize(
    Serializers serializers,
    DoctorPrivateConfirmationPolicyEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  DoctorPrivateConfirmationPolicyEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => DoctorPrivateConfirmationPolicyEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$DoctorPrivate extends DoctorPrivate {
  @override
  final int? bookingWindowDays;
  @override
  final String? phone;
  @override
  final DoctorPrivateVerificationStatusEnum? verificationStatus;
  @override
  final BuiltList<Credential>? credentials;
  @override
  final DoctorPrivateConfirmationPolicyEnum? confirmationPolicy;
  @override
  final String? councilNumber;
  @override
  final String? email;
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

  factory _$DoctorPrivate([void Function(DoctorPrivateBuilder)? updates]) =>
      (DoctorPrivateBuilder()..update(updates))._build();

  _$DoctorPrivate._({
    this.bookingWindowDays,
    this.phone,
    this.verificationStatus,
    this.credentials,
    this.confirmationPolicy,
    this.councilNumber,
    this.email,
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
  DoctorPrivate rebuild(void Function(DoctorPrivateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorPrivateBuilder toBuilder() => DoctorPrivateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorPrivate &&
        bookingWindowDays == other.bookingWindowDays &&
        phone == other.phone &&
        verificationStatus == other.verificationStatus &&
        credentials == other.credentials &&
        confirmationPolicy == other.confirmationPolicy &&
        councilNumber == other.councilNumber &&
        email == other.email &&
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
    _$hash = $jc(_$hash, bookingWindowDays.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, verificationStatus.hashCode);
    _$hash = $jc(_$hash, credentials.hashCode);
    _$hash = $jc(_$hash, confirmationPolicy.hashCode);
    _$hash = $jc(_$hash, councilNumber.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
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
    return (newBuiltValueToStringHelper(r'DoctorPrivate')
          ..add('bookingWindowDays', bookingWindowDays)
          ..add('phone', phone)
          ..add('verificationStatus', verificationStatus)
          ..add('credentials', credentials)
          ..add('confirmationPolicy', confirmationPolicy)
          ..add('councilNumber', councilNumber)
          ..add('email', email)
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

class DoctorPrivateBuilder
    implements Builder<DoctorPrivate, DoctorPrivateBuilder>, DoctorBuilder {
  _$DoctorPrivate? _$v;

  int? _bookingWindowDays;
  int? get bookingWindowDays => _$this._bookingWindowDays;
  set bookingWindowDays(covariant int? bookingWindowDays) =>
      _$this._bookingWindowDays = bookingWindowDays;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(covariant String? phone) => _$this._phone = phone;

  DoctorPrivateVerificationStatusEnum? _verificationStatus;
  DoctorPrivateVerificationStatusEnum? get verificationStatus =>
      _$this._verificationStatus;
  set verificationStatus(
    covariant DoctorPrivateVerificationStatusEnum? verificationStatus,
  ) => _$this._verificationStatus = verificationStatus;

  ListBuilder<Credential>? _credentials;
  ListBuilder<Credential> get credentials =>
      _$this._credentials ??= ListBuilder<Credential>();
  set credentials(covariant ListBuilder<Credential>? credentials) =>
      _$this._credentials = credentials;

  DoctorPrivateConfirmationPolicyEnum? _confirmationPolicy;
  DoctorPrivateConfirmationPolicyEnum? get confirmationPolicy =>
      _$this._confirmationPolicy;
  set confirmationPolicy(
    covariant DoctorPrivateConfirmationPolicyEnum? confirmationPolicy,
  ) => _$this._confirmationPolicy = confirmationPolicy;

  String? _councilNumber;
  String? get councilNumber => _$this._councilNumber;
  set councilNumber(covariant String? councilNumber) =>
      _$this._councilNumber = councilNumber;

  String? _email;
  String? get email => _$this._email;
  set email(covariant String? email) => _$this._email = email;

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

  DoctorPrivateBuilder() {
    DoctorPrivate._defaults(this);
  }

  DoctorPrivateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bookingWindowDays = $v.bookingWindowDays;
      _phone = $v.phone;
      _verificationStatus = $v.verificationStatus;
      _credentials = $v.credentials?.toBuilder();
      _confirmationPolicy = $v.confirmationPolicy;
      _councilNumber = $v.councilNumber;
      _email = $v.email;
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
  void replace(covariant DoctorPrivate other) {
    _$v = other as _$DoctorPrivate;
  }

  @override
  void update(void Function(DoctorPrivateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DoctorPrivate build() => _build();

  _$DoctorPrivate _build() {
    _$DoctorPrivate _$result;
    try {
      _$result =
          _$v ??
          _$DoctorPrivate._(
            bookingWindowDays: bookingWindowDays,
            phone: phone,
            verificationStatus: verificationStatus,
            credentials: _credentials?.build(),
            confirmationPolicy: confirmationPolicy,
            councilNumber: councilNumber,
            email: email,
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
        _$failedField = 'credentials';
        _credentials?.build();

        _$failedField = 'specialties';
        _specialties?.build();
        _$failedField = 'languages';
        _languages?.build();

        _$failedField = 'practiceAddress';
        _practiceAddress?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'DoctorPrivate',
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
