// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_service_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicServiceCreateDurationMinutesEnum
_$clinicServiceCreateDurationMinutesEnum_number10 =
    const ClinicServiceCreateDurationMinutesEnum._('number10');
const ClinicServiceCreateDurationMinutesEnum
_$clinicServiceCreateDurationMinutesEnum_number15 =
    const ClinicServiceCreateDurationMinutesEnum._('number15');
const ClinicServiceCreateDurationMinutesEnum
_$clinicServiceCreateDurationMinutesEnum_number20 =
    const ClinicServiceCreateDurationMinutesEnum._('number20');
const ClinicServiceCreateDurationMinutesEnum
_$clinicServiceCreateDurationMinutesEnum_number30 =
    const ClinicServiceCreateDurationMinutesEnum._('number30');
const ClinicServiceCreateDurationMinutesEnum
_$clinicServiceCreateDurationMinutesEnum_number45 =
    const ClinicServiceCreateDurationMinutesEnum._('number45');
const ClinicServiceCreateDurationMinutesEnum
_$clinicServiceCreateDurationMinutesEnum_number60 =
    const ClinicServiceCreateDurationMinutesEnum._('number60');

ClinicServiceCreateDurationMinutesEnum
_$clinicServiceCreateDurationMinutesEnumValueOf(String name) {
  switch (name) {
    case 'number10':
      return _$clinicServiceCreateDurationMinutesEnum_number10;
    case 'number15':
      return _$clinicServiceCreateDurationMinutesEnum_number15;
    case 'number20':
      return _$clinicServiceCreateDurationMinutesEnum_number20;
    case 'number30':
      return _$clinicServiceCreateDurationMinutesEnum_number30;
    case 'number45':
      return _$clinicServiceCreateDurationMinutesEnum_number45;
    case 'number60':
      return _$clinicServiceCreateDurationMinutesEnum_number60;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicServiceCreateDurationMinutesEnum>
_$clinicServiceCreateDurationMinutesEnumValues =
    BuiltSet<ClinicServiceCreateDurationMinutesEnum>(
      const <ClinicServiceCreateDurationMinutesEnum>[
        _$clinicServiceCreateDurationMinutesEnum_number10,
        _$clinicServiceCreateDurationMinutesEnum_number15,
        _$clinicServiceCreateDurationMinutesEnum_number20,
        _$clinicServiceCreateDurationMinutesEnum_number30,
        _$clinicServiceCreateDurationMinutesEnum_number45,
        _$clinicServiceCreateDurationMinutesEnum_number60,
      ],
    );

Serializer<ClinicServiceCreateDurationMinutesEnum>
_$clinicServiceCreateDurationMinutesEnumSerializer =
    _$ClinicServiceCreateDurationMinutesEnumSerializer();

class _$ClinicServiceCreateDurationMinutesEnumSerializer
    implements PrimitiveSerializer<ClinicServiceCreateDurationMinutesEnum> {
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
    ClinicServiceCreateDurationMinutesEnum,
  ];
  @override
  final String wireName = 'ClinicServiceCreateDurationMinutesEnum';

  @override
  Object serialize(
    Serializers serializers,
    ClinicServiceCreateDurationMinutesEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicServiceCreateDurationMinutesEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicServiceCreateDurationMinutesEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ClinicServiceCreate extends ClinicServiceCreate {
  @override
  final String name;
  @override
  final String? description;
  @override
  final ClinicServiceCreateDurationMinutesEnum durationMinutes;
  @override
  final int priceAmount;
  @override
  final CurrencyCode currency;
  @override
  final bool? offersTelehealth;
  @override
  final bool? acceptsCnas;
  @override
  final bool? acceptsCasnos;

  factory _$ClinicServiceCreate([
    void Function(ClinicServiceCreateBuilder)? updates,
  ]) => (ClinicServiceCreateBuilder()..update(updates))._build();

  _$ClinicServiceCreate._({
    required this.name,
    this.description,
    required this.durationMinutes,
    required this.priceAmount,
    required this.currency,
    this.offersTelehealth,
    this.acceptsCnas,
    this.acceptsCasnos,
  }) : super._();
  @override
  ClinicServiceCreate rebuild(
    void Function(ClinicServiceCreateBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ClinicServiceCreateBuilder toBuilder() =>
      ClinicServiceCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicServiceCreate &&
        name == other.name &&
        description == other.description &&
        durationMinutes == other.durationMinutes &&
        priceAmount == other.priceAmount &&
        currency == other.currency &&
        offersTelehealth == other.offersTelehealth &&
        acceptsCnas == other.acceptsCnas &&
        acceptsCasnos == other.acceptsCasnos;
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
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicServiceCreate')
          ..add('name', name)
          ..add('description', description)
          ..add('durationMinutes', durationMinutes)
          ..add('priceAmount', priceAmount)
          ..add('currency', currency)
          ..add('offersTelehealth', offersTelehealth)
          ..add('acceptsCnas', acceptsCnas)
          ..add('acceptsCasnos', acceptsCasnos))
        .toString();
  }
}

class ClinicServiceCreateBuilder
    implements Builder<ClinicServiceCreate, ClinicServiceCreateBuilder> {
  _$ClinicServiceCreate? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ClinicServiceCreateDurationMinutesEnum? _durationMinutes;
  ClinicServiceCreateDurationMinutesEnum? get durationMinutes =>
      _$this._durationMinutes;
  set durationMinutes(
    ClinicServiceCreateDurationMinutesEnum? durationMinutes,
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

  ClinicServiceCreateBuilder() {
    ClinicServiceCreate._defaults(this);
  }

  ClinicServiceCreateBuilder get _$this {
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
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicServiceCreate other) {
    _$v = other as _$ClinicServiceCreate;
  }

  @override
  void update(void Function(ClinicServiceCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicServiceCreate build() => _build();

  _$ClinicServiceCreate _build() {
    final _$result =
        _$v ??
        _$ClinicServiceCreate._(
          name: BuiltValueNullFieldError.checkNotNull(
            name,
            r'ClinicServiceCreate',
            'name',
          ),
          description: description,
          durationMinutes: BuiltValueNullFieldError.checkNotNull(
            durationMinutes,
            r'ClinicServiceCreate',
            'durationMinutes',
          ),
          priceAmount: BuiltValueNullFieldError.checkNotNull(
            priceAmount,
            r'ClinicServiceCreate',
            'priceAmount',
          ),
          currency: BuiltValueNullFieldError.checkNotNull(
            currency,
            r'ClinicServiceCreate',
            'currency',
          ),
          offersTelehealth: offersTelehealth,
          acceptsCnas: acceptsCnas,
          acceptsCasnos: acceptsCasnos,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
