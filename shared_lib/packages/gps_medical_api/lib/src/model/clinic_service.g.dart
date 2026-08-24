// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_service.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicServiceDurationMinutesEnum
_$clinicServiceDurationMinutesEnum_number10 =
    const ClinicServiceDurationMinutesEnum._('number10');
const ClinicServiceDurationMinutesEnum
_$clinicServiceDurationMinutesEnum_number15 =
    const ClinicServiceDurationMinutesEnum._('number15');
const ClinicServiceDurationMinutesEnum
_$clinicServiceDurationMinutesEnum_number20 =
    const ClinicServiceDurationMinutesEnum._('number20');
const ClinicServiceDurationMinutesEnum
_$clinicServiceDurationMinutesEnum_number30 =
    const ClinicServiceDurationMinutesEnum._('number30');
const ClinicServiceDurationMinutesEnum
_$clinicServiceDurationMinutesEnum_number45 =
    const ClinicServiceDurationMinutesEnum._('number45');
const ClinicServiceDurationMinutesEnum
_$clinicServiceDurationMinutesEnum_number60 =
    const ClinicServiceDurationMinutesEnum._('number60');

ClinicServiceDurationMinutesEnum _$clinicServiceDurationMinutesEnumValueOf(
  String name,
) {
  switch (name) {
    case 'number10':
      return _$clinicServiceDurationMinutesEnum_number10;
    case 'number15':
      return _$clinicServiceDurationMinutesEnum_number15;
    case 'number20':
      return _$clinicServiceDurationMinutesEnum_number20;
    case 'number30':
      return _$clinicServiceDurationMinutesEnum_number30;
    case 'number45':
      return _$clinicServiceDurationMinutesEnum_number45;
    case 'number60':
      return _$clinicServiceDurationMinutesEnum_number60;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicServiceDurationMinutesEnum>
_$clinicServiceDurationMinutesEnumValues =
    BuiltSet<ClinicServiceDurationMinutesEnum>(
      const <ClinicServiceDurationMinutesEnum>[
        _$clinicServiceDurationMinutesEnum_number10,
        _$clinicServiceDurationMinutesEnum_number15,
        _$clinicServiceDurationMinutesEnum_number20,
        _$clinicServiceDurationMinutesEnum_number30,
        _$clinicServiceDurationMinutesEnum_number45,
        _$clinicServiceDurationMinutesEnum_number60,
      ],
    );

Serializer<ClinicServiceDurationMinutesEnum>
_$clinicServiceDurationMinutesEnumSerializer =
    _$ClinicServiceDurationMinutesEnumSerializer();

class _$ClinicServiceDurationMinutesEnumSerializer
    implements PrimitiveSerializer<ClinicServiceDurationMinutesEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'number10': 10,
    'number15': 15,
    'number20': 20,
    'number30': 30,
    'number45': 45,
    'number60': 60,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    10: 'number10',
    15: 'number15',
    20: 'number20',
    30: 'number30',
    45: 'number45',
    60: 'number60',
  };

  @override
  final Iterable<Type> types = const <Type>[ClinicServiceDurationMinutesEnum];
  @override
  final String wireName = 'ClinicServiceDurationMinutesEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicServiceDurationMinutesEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicServiceDurationMinutesEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicServiceDurationMinutesEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ClinicService extends ClinicService {
  @override
  final String? id;
  @override
  final String? clinicId;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final ClinicServiceDurationMinutesEnum? durationMinutes;
  @override
  final int? priceAmount;
  @override
  final CurrencyCode? currency;
  @override
  final bool? offersTelehealth;
  @override
  final bool? acceptsCnas;
  @override
  final bool? acceptsCasnos;
  @override
  final bool? active;

  factory _$ClinicService([void Function(ClinicServiceBuilder)? updates]) =>
      (ClinicServiceBuilder()..update(updates))._build();

  _$ClinicService._({
    this.id,
    this.clinicId,
    this.name,
    this.description,
    this.durationMinutes,
    this.priceAmount,
    this.currency,
    this.offersTelehealth,
    this.acceptsCnas,
    this.acceptsCasnos,
    this.active,
  }) : super._();
  @override
  ClinicService rebuild(void Function(ClinicServiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClinicServiceBuilder toBuilder() => ClinicServiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicService &&
        id == other.id &&
        clinicId == other.clinicId &&
        name == other.name &&
        description == other.description &&
        durationMinutes == other.durationMinutes &&
        priceAmount == other.priceAmount &&
        currency == other.currency &&
        offersTelehealth == other.offersTelehealth &&
        acceptsCnas == other.acceptsCnas &&
        acceptsCasnos == other.acceptsCasnos &&
        active == other.active;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, clinicId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, durationMinutes.hashCode);
    _$hash = $jc(_$hash, priceAmount.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jc(_$hash, offersTelehealth.hashCode);
    _$hash = $jc(_$hash, acceptsCnas.hashCode);
    _$hash = $jc(_$hash, acceptsCasnos.hashCode);
    _$hash = $jc(_$hash, active.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicService')
          ..add('id', id)
          ..add('clinicId', clinicId)
          ..add('name', name)
          ..add('description', description)
          ..add('durationMinutes', durationMinutes)
          ..add('priceAmount', priceAmount)
          ..add('currency', currency)
          ..add('offersTelehealth', offersTelehealth)
          ..add('acceptsCnas', acceptsCnas)
          ..add('acceptsCasnos', acceptsCasnos)
          ..add('active', active))
        .toString();
  }
}

class ClinicServiceBuilder
    implements Builder<ClinicService, ClinicServiceBuilder> {
  _$ClinicService? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _clinicId;
  String? get clinicId => _$this._clinicId;
  set clinicId(String? clinicId) => _$this._clinicId = clinicId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ClinicServiceDurationMinutesEnum? _durationMinutes;
  ClinicServiceDurationMinutesEnum? get durationMinutes =>
      _$this._durationMinutes;
  set durationMinutes(ClinicServiceDurationMinutesEnum? durationMinutes) =>
      _$this._durationMinutes = durationMinutes;

  int? _priceAmount;
  int? get priceAmount => _$this._priceAmount;
  set priceAmount(int? priceAmount) => _$this._priceAmount = priceAmount;

  CurrencyCode? _currency;
  CurrencyCode? get currency => _$this._currency;
  set currency(CurrencyCode? currency) => _$this._currency = currency;

  bool? _offersTelehealth;
  bool? get offersTelehealth => _$this._offersTelehealth;
  set offersTelehealth(bool? offersTelehealth) =>
      _$this._offersTelehealth = offersTelehealth;

  bool? _acceptsCnas;
  bool? get acceptsCnas => _$this._acceptsCnas;
  set acceptsCnas(bool? acceptsCnas) => _$this._acceptsCnas = acceptsCnas;

  bool? _acceptsCasnos;
  bool? get acceptsCasnos => _$this._acceptsCasnos;
  set acceptsCasnos(bool? acceptsCasnos) =>
      _$this._acceptsCasnos = acceptsCasnos;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  ClinicServiceBuilder() {
    ClinicService._defaults(this);
  }

  ClinicServiceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _clinicId = $v.clinicId;
      _name = $v.name;
      _description = $v.description;
      _durationMinutes = $v.durationMinutes;
      _priceAmount = $v.priceAmount;
      _currency = $v.currency;
      _offersTelehealth = $v.offersTelehealth;
      _acceptsCnas = $v.acceptsCnas;
      _acceptsCasnos = $v.acceptsCasnos;
      _active = $v.active;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicService other) {
    _$v = other as _$ClinicService;
  }

  @override
  void update(void Function(ClinicServiceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicService build() => _build();

  _$ClinicService _build() {
    final _$result =
        _$v ??
        _$ClinicService._(
          id: id,
          clinicId: clinicId,
          name: name,
          description: description,
          durationMinutes: durationMinutes,
          priceAmount: priceAmount,
          currency: currency,
          offersTelehealth: offersTelehealth,
          acceptsCnas: acceptsCnas,
          acceptsCasnos: acceptsCasnos,
          active: active,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
