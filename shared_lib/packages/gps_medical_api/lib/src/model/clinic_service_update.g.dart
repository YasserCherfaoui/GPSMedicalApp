// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_service_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicServiceUpdateDurationMinutesEnum
_$clinicServiceUpdateDurationMinutesEnum_number10 =
    const ClinicServiceUpdateDurationMinutesEnum._('number10');
const ClinicServiceUpdateDurationMinutesEnum
_$clinicServiceUpdateDurationMinutesEnum_number15 =
    const ClinicServiceUpdateDurationMinutesEnum._('number15');
const ClinicServiceUpdateDurationMinutesEnum
_$clinicServiceUpdateDurationMinutesEnum_number20 =
    const ClinicServiceUpdateDurationMinutesEnum._('number20');
const ClinicServiceUpdateDurationMinutesEnum
_$clinicServiceUpdateDurationMinutesEnum_number30 =
    const ClinicServiceUpdateDurationMinutesEnum._('number30');
const ClinicServiceUpdateDurationMinutesEnum
_$clinicServiceUpdateDurationMinutesEnum_number45 =
    const ClinicServiceUpdateDurationMinutesEnum._('number45');
const ClinicServiceUpdateDurationMinutesEnum
_$clinicServiceUpdateDurationMinutesEnum_number60 =
    const ClinicServiceUpdateDurationMinutesEnum._('number60');

ClinicServiceUpdateDurationMinutesEnum
_$clinicServiceUpdateDurationMinutesEnumValueOf(String name) {
  switch (name) {
    case 'number10':
      return _$clinicServiceUpdateDurationMinutesEnum_number10;
    case 'number15':
      return _$clinicServiceUpdateDurationMinutesEnum_number15;
    case 'number20':
      return _$clinicServiceUpdateDurationMinutesEnum_number20;
    case 'number30':
      return _$clinicServiceUpdateDurationMinutesEnum_number30;
    case 'number45':
      return _$clinicServiceUpdateDurationMinutesEnum_number45;
    case 'number60':
      return _$clinicServiceUpdateDurationMinutesEnum_number60;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicServiceUpdateDurationMinutesEnum>
_$clinicServiceUpdateDurationMinutesEnumValues =
    BuiltSet<ClinicServiceUpdateDurationMinutesEnum>(
      const <ClinicServiceUpdateDurationMinutesEnum>[
        _$clinicServiceUpdateDurationMinutesEnum_number10,
        _$clinicServiceUpdateDurationMinutesEnum_number15,
        _$clinicServiceUpdateDurationMinutesEnum_number20,
        _$clinicServiceUpdateDurationMinutesEnum_number30,
        _$clinicServiceUpdateDurationMinutesEnum_number45,
        _$clinicServiceUpdateDurationMinutesEnum_number60,
      ],
    );

Serializer<ClinicServiceUpdateDurationMinutesEnum>
_$clinicServiceUpdateDurationMinutesEnumSerializer =
    _$ClinicServiceUpdateDurationMinutesEnumSerializer();

class _$ClinicServiceUpdateDurationMinutesEnumSerializer
    implements PrimitiveSerializer<ClinicServiceUpdateDurationMinutesEnum> {
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
  final Iterable<Type> types = const <Type>[
    ClinicServiceUpdateDurationMinutesEnum,
  ];
  @override
  final String wireName = 'ClinicServiceUpdateDurationMinutesEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicServiceUpdateDurationMinutesEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicServiceUpdateDurationMinutesEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicServiceUpdateDurationMinutesEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ClinicServiceUpdate extends ClinicServiceUpdate {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final ClinicServiceUpdateDurationMinutesEnum? durationMinutes;
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

  factory _$ClinicServiceUpdate([
    void Function(ClinicServiceUpdateBuilder)? updates,
  ]) => (ClinicServiceUpdateBuilder()..update(updates))._build();

  _$ClinicServiceUpdate._({
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
  ClinicServiceUpdate rebuild(
    void Function(ClinicServiceUpdateBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ClinicServiceUpdateBuilder toBuilder() =>
      ClinicServiceUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicServiceUpdate &&
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
    return (newBuiltValueToStringHelper(r'ClinicServiceUpdate')
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

class ClinicServiceUpdateBuilder
    implements Builder<ClinicServiceUpdate, ClinicServiceUpdateBuilder> {
  _$ClinicServiceUpdate? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ClinicServiceUpdateDurationMinutesEnum? _durationMinutes;
  ClinicServiceUpdateDurationMinutesEnum? get durationMinutes =>
      _$this._durationMinutes;
  set durationMinutes(
    ClinicServiceUpdateDurationMinutesEnum? durationMinutes,
  ) => _$this._durationMinutes = durationMinutes;

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

  ClinicServiceUpdateBuilder() {
    ClinicServiceUpdate._defaults(this);
  }

  ClinicServiceUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
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
  void replace(ClinicServiceUpdate other) {
    _$v = other as _$ClinicServiceUpdate;
  }

  @override
  void update(void Function(ClinicServiceUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicServiceUpdate build() => _build();

  _$ClinicServiceUpdate _build() {
    final _$result =
        _$v ??
        _$ClinicServiceUpdate._(
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
