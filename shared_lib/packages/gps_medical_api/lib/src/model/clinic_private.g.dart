// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_private.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicPrivateConfirmationPolicyEnum
_$clinicPrivateConfirmationPolicyEnum_auto =
    const ClinicPrivateConfirmationPolicyEnum._('auto');
const ClinicPrivateConfirmationPolicyEnum
_$clinicPrivateConfirmationPolicyEnum_manual =
    const ClinicPrivateConfirmationPolicyEnum._('manual');

ClinicPrivateConfirmationPolicyEnum
_$clinicPrivateConfirmationPolicyEnumValueOf(String name) {
  switch (name) {
    case 'auto':
      return _$clinicPrivateConfirmationPolicyEnum_auto;
    case 'manual':
      return _$clinicPrivateConfirmationPolicyEnum_manual;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicPrivateConfirmationPolicyEnum>
_$clinicPrivateConfirmationPolicyEnumValues =
    BuiltSet<ClinicPrivateConfirmationPolicyEnum>(
      const <ClinicPrivateConfirmationPolicyEnum>[
        _$clinicPrivateConfirmationPolicyEnum_auto,
        _$clinicPrivateConfirmationPolicyEnum_manual,
      ],
    );

Serializer<ClinicPrivateConfirmationPolicyEnum>
_$clinicPrivateConfirmationPolicyEnumSerializer =
    _$ClinicPrivateConfirmationPolicyEnumSerializer();

class _$ClinicPrivateConfirmationPolicyEnumSerializer
    implements PrimitiveSerializer<ClinicPrivateConfirmationPolicyEnum> {
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
    ClinicPrivateConfirmationPolicyEnum,
  ];
  @override
  final String wireName = 'ClinicPrivateConfirmationPolicyEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicPrivateConfirmationPolicyEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicPrivateConfirmationPolicyEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicPrivateConfirmationPolicyEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ClinicPrivate extends ClinicPrivate {
  @override
  final String? legalName;
  @override
  final String? registreCommerce;
  @override
  final int? bookingWindowDays;
  @override
  final String? agrementSante;
  @override
  final ClinicVerificationStatus? verificationStatus;
  @override
  final ClinicPrivateConfirmationPolicyEnum? confirmationPolicy;
  @override
  final BuiltList<ClinicCredential>? credentials;
  @override
  final String? ownerUserId;
  @override
  final String? email;
  @override
  final ClinicStatus? status;
  @override
  final String? verificationComment;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final Address? address;
  @override
  final String? countryCode;
  @override
  final bool? verified;
  @override
  final double? ratingAverage;
  @override
  final int? ratingCount;
  @override
  final bool? offersTelehealth;
  @override
  final BuiltList<ClinicServiceTeaser>? serviceTeasers;

  factory _$ClinicPrivate([void Function(ClinicPrivateBuilder)? updates]) =>
      (ClinicPrivateBuilder()..update(updates))._build();

  _$ClinicPrivate._({
    this.legalName,
    this.registreCommerce,
    this.bookingWindowDays,
    this.agrementSante,
    this.verificationStatus,
    this.confirmationPolicy,
    this.credentials,
    this.ownerUserId,
    this.email,
    this.status,
    this.verificationComment,
    this.id,
    this.name,
    this.description,
    this.address,
    this.countryCode,
    this.verified,
    this.ratingAverage,
    this.ratingCount,
    this.offersTelehealth,
    this.serviceTeasers,
  }) : super._();
  @override
  ClinicPrivate rebuild(void Function(ClinicPrivateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClinicPrivateBuilder toBuilder() => ClinicPrivateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicPrivate &&
        legalName == other.legalName &&
        registreCommerce == other.registreCommerce &&
        bookingWindowDays == other.bookingWindowDays &&
        agrementSante == other.agrementSante &&
        verificationStatus == other.verificationStatus &&
        confirmationPolicy == other.confirmationPolicy &&
        credentials == other.credentials &&
        ownerUserId == other.ownerUserId &&
        email == other.email &&
        status == other.status &&
        verificationComment == other.verificationComment &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        address == other.address &&
        countryCode == other.countryCode &&
        verified == other.verified &&
        ratingAverage == other.ratingAverage &&
        ratingCount == other.ratingCount &&
        offersTelehealth == other.offersTelehealth &&
        serviceTeasers == other.serviceTeasers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, legalName.hashCode);
    _$hash = $jc(_$hash, registreCommerce.hashCode);
    _$hash = $jc(_$hash, bookingWindowDays.hashCode);
    _$hash = $jc(_$hash, agrementSante.hashCode);
    _$hash = $jc(_$hash, verificationStatus.hashCode);
    _$hash = $jc(_$hash, confirmationPolicy.hashCode);
    _$hash = $jc(_$hash, credentials.hashCode);
    _$hash = $jc(_$hash, ownerUserId.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, verificationComment.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, countryCode.hashCode);
    _$hash = $jc(_$hash, verified.hashCode);
    _$hash = $jc(_$hash, ratingAverage.hashCode);
    _$hash = $jc(_$hash, ratingCount.hashCode);
    _$hash = $jc(_$hash, offersTelehealth.hashCode);
    _$hash = $jc(_$hash, serviceTeasers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicPrivate')
          ..add('legalName', legalName)
          ..add('registreCommerce', registreCommerce)
          ..add('bookingWindowDays', bookingWindowDays)
          ..add('agrementSante', agrementSante)
          ..add('verificationStatus', verificationStatus)
          ..add('confirmationPolicy', confirmationPolicy)
          ..add('credentials', credentials)
          ..add('ownerUserId', ownerUserId)
          ..add('email', email)
          ..add('status', status)
          ..add('verificationComment', verificationComment)
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('address', address)
          ..add('countryCode', countryCode)
          ..add('verified', verified)
          ..add('ratingAverage', ratingAverage)
          ..add('ratingCount', ratingCount)
          ..add('offersTelehealth', offersTelehealth)
          ..add('serviceTeasers', serviceTeasers))
        .toString();
  }
}

class ClinicPrivateBuilder
    implements Builder<ClinicPrivate, ClinicPrivateBuilder>, ClinicBuilder {
  _$ClinicPrivate? _$v;

  String? _legalName;
  String? get legalName => _$this._legalName;
  set legalName(covariant String? legalName) => _$this._legalName = legalName;

  String? _registreCommerce;
  String? get registreCommerce => _$this._registreCommerce;
  set registreCommerce(covariant String? registreCommerce) =>
      _$this._registreCommerce = registreCommerce;

  int? _bookingWindowDays;
  int? get bookingWindowDays => _$this._bookingWindowDays;
  set bookingWindowDays(covariant int? bookingWindowDays) =>
      _$this._bookingWindowDays = bookingWindowDays;

  String? _agrementSante;
  String? get agrementSante => _$this._agrementSante;
  set agrementSante(covariant String? agrementSante) =>
      _$this._agrementSante = agrementSante;

  ClinicVerificationStatus? _verificationStatus;
  ClinicVerificationStatus? get verificationStatus =>
      _$this._verificationStatus;
  set verificationStatus(
    covariant ClinicVerificationStatus? verificationStatus,
  ) => _$this._verificationStatus = verificationStatus;

  ClinicPrivateConfirmationPolicyEnum? _confirmationPolicy;
  ClinicPrivateConfirmationPolicyEnum? get confirmationPolicy =>
      _$this._confirmationPolicy;
  set confirmationPolicy(
    covariant ClinicPrivateConfirmationPolicyEnum? confirmationPolicy,
  ) => _$this._confirmationPolicy = confirmationPolicy;

  ListBuilder<ClinicCredential>? _credentials;
  ListBuilder<ClinicCredential> get credentials =>
      _$this._credentials ??= ListBuilder<ClinicCredential>();
  set credentials(covariant ListBuilder<ClinicCredential>? credentials) =>
      _$this._credentials = credentials;

  String? _ownerUserId;
  String? get ownerUserId => _$this._ownerUserId;
  set ownerUserId(covariant String? ownerUserId) =>
      _$this._ownerUserId = ownerUserId;

  String? _email;
  String? get email => _$this._email;
  set email(covariant String? email) => _$this._email = email;

  ClinicStatus? _status;
  ClinicStatus? get status => _$this._status;
  set status(covariant ClinicStatus? status) => _$this._status = status;

  String? _verificationComment;
  String? get verificationComment => _$this._verificationComment;
  set verificationComment(covariant String? verificationComment) =>
      _$this._verificationComment = verificationComment;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  AddressBuilder? _address;
  AddressBuilder get address => _$this._address ??= AddressBuilder();
  set address(covariant AddressBuilder? address) => _$this._address = address;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(covariant String? countryCode) =>
      _$this._countryCode = countryCode;

  bool? _verified;
  bool? get verified => _$this._verified;
  set verified(covariant bool? verified) => _$this._verified = verified;

  double? _ratingAverage;
  double? get ratingAverage => _$this._ratingAverage;
  set ratingAverage(covariant double? ratingAverage) =>
      _$this._ratingAverage = ratingAverage;

  int? _ratingCount;
  int? get ratingCount => _$this._ratingCount;
  set ratingCount(covariant int? ratingCount) =>
      _$this._ratingCount = ratingCount;

  bool? _offersTelehealth;
  bool? get offersTelehealth => _$this._offersTelehealth;
  set offersTelehealth(covariant bool? offersTelehealth) =>
      _$this._offersTelehealth = offersTelehealth;

  ListBuilder<ClinicServiceTeaser>? _serviceTeasers;
  ListBuilder<ClinicServiceTeaser> get serviceTeasers =>
      _$this._serviceTeasers ??= ListBuilder<ClinicServiceTeaser>();
  set serviceTeasers(
    covariant ListBuilder<ClinicServiceTeaser>? serviceTeasers,
  ) => _$this._serviceTeasers = serviceTeasers;

  ClinicPrivateBuilder() {
    ClinicPrivate._defaults(this);
  }

  ClinicPrivateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _legalName = $v.legalName;
      _registreCommerce = $v.registreCommerce;
      _bookingWindowDays = $v.bookingWindowDays;
      _agrementSante = $v.agrementSante;
      _verificationStatus = $v.verificationStatus;
      _confirmationPolicy = $v.confirmationPolicy;
      _credentials = $v.credentials?.toBuilder();
      _ownerUserId = $v.ownerUserId;
      _email = $v.email;
      _status = $v.status;
      _verificationComment = $v.verificationComment;
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _address = $v.address?.toBuilder();
      _countryCode = $v.countryCode;
      _verified = $v.verified;
      _ratingAverage = $v.ratingAverage;
      _ratingCount = $v.ratingCount;
      _offersTelehealth = $v.offersTelehealth;
      _serviceTeasers = $v.serviceTeasers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ClinicPrivate other) {
    _$v = other as _$ClinicPrivate;
  }

  @override
  void update(void Function(ClinicPrivateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicPrivate build() => _build();

  _$ClinicPrivate _build() {
    _$ClinicPrivate _$result;
    try {
      _$result =
          _$v ??
          _$ClinicPrivate._(
            legalName: legalName,
            registreCommerce: registreCommerce,
            bookingWindowDays: bookingWindowDays,
            agrementSante: agrementSante,
            verificationStatus: verificationStatus,
            confirmationPolicy: confirmationPolicy,
            credentials: _credentials?.build(),
            ownerUserId: ownerUserId,
            email: email,
            status: status,
            verificationComment: verificationComment,
            id: id,
            name: name,
            description: description,
            address: _address?.build(),
            countryCode: countryCode,
            verified: verified,
            ratingAverage: ratingAverage,
            ratingCount: ratingCount,
            offersTelehealth: offersTelehealth,
            serviceTeasers: _serviceTeasers?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'credentials';
        _credentials?.build();

        _$failedField = 'address';
        _address?.build();

        _$failedField = 'serviceTeasers';
        _serviceTeasers?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ClinicPrivate',
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
