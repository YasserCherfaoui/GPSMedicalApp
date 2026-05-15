// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DoctorUpdateLanguagesEnum _$doctorUpdateLanguagesEnum_ar =
    const DoctorUpdateLanguagesEnum._('ar');
const DoctorUpdateLanguagesEnum _$doctorUpdateLanguagesEnum_fr =
    const DoctorUpdateLanguagesEnum._('fr');
const DoctorUpdateLanguagesEnum _$doctorUpdateLanguagesEnum_en =
    const DoctorUpdateLanguagesEnum._('en');
const DoctorUpdateLanguagesEnum _$doctorUpdateLanguagesEnum_ber =
    const DoctorUpdateLanguagesEnum._('ber');

DoctorUpdateLanguagesEnum _$doctorUpdateLanguagesEnumValueOf(String name) {
  switch (name) {
    case 'ar':
      return _$doctorUpdateLanguagesEnum_ar;
    case 'fr':
      return _$doctorUpdateLanguagesEnum_fr;
    case 'en':
      return _$doctorUpdateLanguagesEnum_en;
    case 'ber':
      return _$doctorUpdateLanguagesEnum_ber;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DoctorUpdateLanguagesEnum> _$doctorUpdateLanguagesEnumValues =
    BuiltSet<DoctorUpdateLanguagesEnum>(const <DoctorUpdateLanguagesEnum>[
      _$doctorUpdateLanguagesEnum_ar,
      _$doctorUpdateLanguagesEnum_fr,
      _$doctorUpdateLanguagesEnum_en,
      _$doctorUpdateLanguagesEnum_ber,
    ]);

const DoctorUpdateConfirmationPolicyEnum
_$doctorUpdateConfirmationPolicyEnum_auto =
    const DoctorUpdateConfirmationPolicyEnum._('auto');
const DoctorUpdateConfirmationPolicyEnum
_$doctorUpdateConfirmationPolicyEnum_manual =
    const DoctorUpdateConfirmationPolicyEnum._('manual');

DoctorUpdateConfirmationPolicyEnum _$doctorUpdateConfirmationPolicyEnumValueOf(
  String name,
) {
  switch (name) {
    case 'auto':
      return _$doctorUpdateConfirmationPolicyEnum_auto;
    case 'manual':
      return _$doctorUpdateConfirmationPolicyEnum_manual;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DoctorUpdateConfirmationPolicyEnum>
_$doctorUpdateConfirmationPolicyEnumValues =
    BuiltSet<DoctorUpdateConfirmationPolicyEnum>(
      const <DoctorUpdateConfirmationPolicyEnum>[
        _$doctorUpdateConfirmationPolicyEnum_auto,
        _$doctorUpdateConfirmationPolicyEnum_manual,
      ],
    );

Serializer<DoctorUpdateLanguagesEnum> _$doctorUpdateLanguagesEnumSerializer =
    _$DoctorUpdateLanguagesEnumSerializer();
Serializer<DoctorUpdateConfirmationPolicyEnum>
_$doctorUpdateConfirmationPolicyEnumSerializer =
    _$DoctorUpdateConfirmationPolicyEnumSerializer();

class _$DoctorUpdateLanguagesEnumSerializer
    implements PrimitiveSerializer<DoctorUpdateLanguagesEnum> {
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
  final Iterable<Type> types = const <Type>[DoctorUpdateLanguagesEnum];
  @override
  final String wireName = 'DoctorUpdateLanguagesEnum';

  @override
  Object serialize(
    Serializers serializers,
    DoctorUpdateLanguagesEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  DoctorUpdateLanguagesEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => DoctorUpdateLanguagesEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$DoctorUpdateConfirmationPolicyEnumSerializer
    implements PrimitiveSerializer<DoctorUpdateConfirmationPolicyEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'auto': 'auto',
    'manual': 'manual',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'auto': 'auto',
    'manual': 'manual',
  };

  @override
  final Iterable<Type> types = const <Type>[DoctorUpdateConfirmationPolicyEnum];
  @override
  final String wireName = 'DoctorUpdateConfirmationPolicyEnum';

  @override
  Object serialize(
    Serializers serializers,
    DoctorUpdateConfirmationPolicyEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  DoctorUpdateConfirmationPolicyEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => DoctorUpdateConfirmationPolicyEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$DoctorUpdate extends DoctorUpdate {
  @override
  final String? bio;
  @override
  final String? photoUrl;
  @override
  final BuiltList<DoctorUpdateLanguagesEnum>? languages;
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
  final DoctorUpdateConfirmationPolicyEnum? confirmationPolicy;
  @override
  final int? bookingWindowDays;
  @override
  final BuiltList<String>? specialtyIds;

  factory _$DoctorUpdate([void Function(DoctorUpdateBuilder)? updates]) =>
      (DoctorUpdateBuilder()..update(updates))._build();

  _$DoctorUpdate._({
    this.bio,
    this.photoUrl,
    this.languages,
    this.consultationFeeDzd,
    this.acceptsCnas,
    this.acceptsCasnos,
    this.offersTelehealth,
    this.practiceAddress,
    this.confirmationPolicy,
    this.bookingWindowDays,
    this.specialtyIds,
  }) : super._();
  @override
  DoctorUpdate rebuild(void Function(DoctorUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorUpdateBuilder toBuilder() => DoctorUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorUpdate &&
        bio == other.bio &&
        photoUrl == other.photoUrl &&
        languages == other.languages &&
        consultationFeeDzd == other.consultationFeeDzd &&
        acceptsCnas == other.acceptsCnas &&
        acceptsCasnos == other.acceptsCasnos &&
        offersTelehealth == other.offersTelehealth &&
        practiceAddress == other.practiceAddress &&
        confirmationPolicy == other.confirmationPolicy &&
        bookingWindowDays == other.bookingWindowDays &&
        specialtyIds == other.specialtyIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, bio.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, languages.hashCode);
    _$hash = $jc(_$hash, consultationFeeDzd.hashCode);
    _$hash = $jc(_$hash, acceptsCnas.hashCode);
    _$hash = $jc(_$hash, acceptsCasnos.hashCode);
    _$hash = $jc(_$hash, offersTelehealth.hashCode);
    _$hash = $jc(_$hash, practiceAddress.hashCode);
    _$hash = $jc(_$hash, confirmationPolicy.hashCode);
    _$hash = $jc(_$hash, bookingWindowDays.hashCode);
    _$hash = $jc(_$hash, specialtyIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoctorUpdate')
          ..add('bio', bio)
          ..add('photoUrl', photoUrl)
          ..add('languages', languages)
          ..add('consultationFeeDzd', consultationFeeDzd)
          ..add('acceptsCnas', acceptsCnas)
          ..add('acceptsCasnos', acceptsCasnos)
          ..add('offersTelehealth', offersTelehealth)
          ..add('practiceAddress', practiceAddress)
          ..add('confirmationPolicy', confirmationPolicy)
          ..add('bookingWindowDays', bookingWindowDays)
          ..add('specialtyIds', specialtyIds))
        .toString();
  }
}

class DoctorUpdateBuilder
    implements Builder<DoctorUpdate, DoctorUpdateBuilder> {
  _$DoctorUpdate? _$v;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  ListBuilder<DoctorUpdateLanguagesEnum>? _languages;
  ListBuilder<DoctorUpdateLanguagesEnum> get languages =>
      _$this._languages ??= ListBuilder<DoctorUpdateLanguagesEnum>();
  set languages(ListBuilder<DoctorUpdateLanguagesEnum>? languages) =>
      _$this._languages = languages;

  int? _consultationFeeDzd;
  int? get consultationFeeDzd => _$this._consultationFeeDzd;
  set consultationFeeDzd(int? consultationFeeDzd) =>
      _$this._consultationFeeDzd = consultationFeeDzd;

  bool? _acceptsCnas;
  bool? get acceptsCnas => _$this._acceptsCnas;
  set acceptsCnas(bool? acceptsCnas) => _$this._acceptsCnas = acceptsCnas;

  bool? _acceptsCasnos;
  bool? get acceptsCasnos => _$this._acceptsCasnos;
  set acceptsCasnos(bool? acceptsCasnos) =>
      _$this._acceptsCasnos = acceptsCasnos;

  bool? _offersTelehealth;
  bool? get offersTelehealth => _$this._offersTelehealth;
  set offersTelehealth(bool? offersTelehealth) =>
      _$this._offersTelehealth = offersTelehealth;

  AddressBuilder? _practiceAddress;
  AddressBuilder get practiceAddress =>
      _$this._practiceAddress ??= AddressBuilder();
  set practiceAddress(AddressBuilder? practiceAddress) =>
      _$this._practiceAddress = practiceAddress;

  DoctorUpdateConfirmationPolicyEnum? _confirmationPolicy;
  DoctorUpdateConfirmationPolicyEnum? get confirmationPolicy =>
      _$this._confirmationPolicy;
  set confirmationPolicy(
    DoctorUpdateConfirmationPolicyEnum? confirmationPolicy,
  ) => _$this._confirmationPolicy = confirmationPolicy;

  int? _bookingWindowDays;
  int? get bookingWindowDays => _$this._bookingWindowDays;
  set bookingWindowDays(int? bookingWindowDays) =>
      _$this._bookingWindowDays = bookingWindowDays;

  ListBuilder<String>? _specialtyIds;
  ListBuilder<String> get specialtyIds =>
      _$this._specialtyIds ??= ListBuilder<String>();
  set specialtyIds(ListBuilder<String>? specialtyIds) =>
      _$this._specialtyIds = specialtyIds;

  DoctorUpdateBuilder() {
    DoctorUpdate._defaults(this);
  }

  DoctorUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bio = $v.bio;
      _photoUrl = $v.photoUrl;
      _languages = $v.languages?.toBuilder();
      _consultationFeeDzd = $v.consultationFeeDzd;
      _acceptsCnas = $v.acceptsCnas;
      _acceptsCasnos = $v.acceptsCasnos;
      _offersTelehealth = $v.offersTelehealth;
      _practiceAddress = $v.practiceAddress?.toBuilder();
      _confirmationPolicy = $v.confirmationPolicy;
      _bookingWindowDays = $v.bookingWindowDays;
      _specialtyIds = $v.specialtyIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorUpdate other) {
    _$v = other as _$DoctorUpdate;
  }

  @override
  void update(void Function(DoctorUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DoctorUpdate build() => _build();

  _$DoctorUpdate _build() {
    _$DoctorUpdate _$result;
    try {
      _$result =
          _$v ??
          _$DoctorUpdate._(
            bio: bio,
            photoUrl: photoUrl,
            languages: _languages?.build(),
            consultationFeeDzd: consultationFeeDzd,
            acceptsCnas: acceptsCnas,
            acceptsCasnos: acceptsCasnos,
            offersTelehealth: offersTelehealth,
            practiceAddress: _practiceAddress?.build(),
            confirmationPolicy: confirmationPolicy,
            bookingWindowDays: bookingWindowDays,
            specialtyIds: _specialtyIds?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'languages';
        _languages?.build();

        _$failedField = 'practiceAddress';
        _practiceAddress?.build();

        _$failedField = 'specialtyIds';
        _specialtyIds?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'DoctorUpdate',
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
