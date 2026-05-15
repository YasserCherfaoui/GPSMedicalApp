// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_all_of_insurance.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PatientAllOfInsuranceProviderEnum
_$patientAllOfInsuranceProviderEnum_cnas =
    const PatientAllOfInsuranceProviderEnum._('cnas');
const PatientAllOfInsuranceProviderEnum
_$patientAllOfInsuranceProviderEnum_casnos =
    const PatientAllOfInsuranceProviderEnum._('casnos');
const PatientAllOfInsuranceProviderEnum
_$patientAllOfInsuranceProviderEnum_none =
    const PatientAllOfInsuranceProviderEnum._('none');
const PatientAllOfInsuranceProviderEnum
_$patientAllOfInsuranceProviderEnum_private =
    const PatientAllOfInsuranceProviderEnum._('private');

PatientAllOfInsuranceProviderEnum _$patientAllOfInsuranceProviderEnumValueOf(
  String name,
) {
  switch (name) {
    case 'cnas':
      return _$patientAllOfInsuranceProviderEnum_cnas;
    case 'casnos':
      return _$patientAllOfInsuranceProviderEnum_casnos;
    case 'none':
      return _$patientAllOfInsuranceProviderEnum_none;
    case 'private':
      return _$patientAllOfInsuranceProviderEnum_private;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<PatientAllOfInsuranceProviderEnum>
_$patientAllOfInsuranceProviderEnumValues =
    BuiltSet<PatientAllOfInsuranceProviderEnum>(
      const <PatientAllOfInsuranceProviderEnum>[
        _$patientAllOfInsuranceProviderEnum_cnas,
        _$patientAllOfInsuranceProviderEnum_casnos,
        _$patientAllOfInsuranceProviderEnum_none,
        _$patientAllOfInsuranceProviderEnum_private,
      ],
    );

Serializer<PatientAllOfInsuranceProviderEnum>
_$patientAllOfInsuranceProviderEnumSerializer =
    _$PatientAllOfInsuranceProviderEnumSerializer();

class _$PatientAllOfInsuranceProviderEnumSerializer
    implements PrimitiveSerializer<PatientAllOfInsuranceProviderEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'cnas': 'cnas',
    'casnos': 'casnos',
    'none': 'none',
    'private': 'private',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'cnas': 'cnas',
    'casnos': 'casnos',
    'none': 'none',
    'private': 'private',
  };

  @override
  final Iterable<Type> types = const <Type>[PatientAllOfInsuranceProviderEnum];
  @override
  final String wireName = 'PatientAllOfInsuranceProviderEnum';

  @override
  Object serialize(
    Serializers serializers,
    PatientAllOfInsuranceProviderEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  PatientAllOfInsuranceProviderEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => PatientAllOfInsuranceProviderEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$PatientAllOfInsurance extends PatientAllOfInsurance {
  @override
  final PatientAllOfInsuranceProviderEnum? provider;
  @override
  final String? number;

  factory _$PatientAllOfInsurance([
    void Function(PatientAllOfInsuranceBuilder)? updates,
  ]) => (PatientAllOfInsuranceBuilder()..update(updates))._build();

  _$PatientAllOfInsurance._({this.provider, this.number}) : super._();
  @override
  PatientAllOfInsurance rebuild(
    void Function(PatientAllOfInsuranceBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PatientAllOfInsuranceBuilder toBuilder() =>
      PatientAllOfInsuranceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatientAllOfInsurance &&
        provider == other.provider &&
        number == other.number;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, provider.hashCode);
    _$hash = $jc(_$hash, number.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PatientAllOfInsurance')
          ..add('provider', provider)
          ..add('number', number))
        .toString();
  }
}

class PatientAllOfInsuranceBuilder
    implements Builder<PatientAllOfInsurance, PatientAllOfInsuranceBuilder> {
  _$PatientAllOfInsurance? _$v;

  PatientAllOfInsuranceProviderEnum? _provider;
  PatientAllOfInsuranceProviderEnum? get provider => _$this._provider;
  set provider(PatientAllOfInsuranceProviderEnum? provider) =>
      _$this._provider = provider;

  String? _number;
  String? get number => _$this._number;
  set number(String? number) => _$this._number = number;

  PatientAllOfInsuranceBuilder() {
    PatientAllOfInsurance._defaults(this);
  }

  PatientAllOfInsuranceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _provider = $v.provider;
      _number = $v.number;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatientAllOfInsurance other) {
    _$v = other as _$PatientAllOfInsurance;
  }

  @override
  void update(void Function(PatientAllOfInsuranceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PatientAllOfInsurance build() => _build();

  _$PatientAllOfInsurance _build() {
    final _$result =
        _$v ?? _$PatientAllOfInsurance._(provider: provider, number: number);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
