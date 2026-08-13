// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_update_insurance.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PatientUpdateInsuranceProviderEnum
_$patientUpdateInsuranceProviderEnum_cnas =
    const PatientUpdateInsuranceProviderEnum._('cnas');
const PatientUpdateInsuranceProviderEnum
_$patientUpdateInsuranceProviderEnum_casnos =
    const PatientUpdateInsuranceProviderEnum._('casnos');
const PatientUpdateInsuranceProviderEnum
_$patientUpdateInsuranceProviderEnum_none =
    const PatientUpdateInsuranceProviderEnum._('none');
const PatientUpdateInsuranceProviderEnum
_$patientUpdateInsuranceProviderEnum_private =
    const PatientUpdateInsuranceProviderEnum._('private');

PatientUpdateInsuranceProviderEnum _$patientUpdateInsuranceProviderEnumValueOf(
  String name,
) {
  switch (name) {
    case 'cnas':
      return _$patientUpdateInsuranceProviderEnum_cnas;
    case 'casnos':
      return _$patientUpdateInsuranceProviderEnum_casnos;
    case 'none':
      return _$patientUpdateInsuranceProviderEnum_none;
    case 'private':
      return _$patientUpdateInsuranceProviderEnum_private;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<PatientUpdateInsuranceProviderEnum>
_$patientUpdateInsuranceProviderEnumValues =
    BuiltSet<PatientUpdateInsuranceProviderEnum>(
      const <PatientUpdateInsuranceProviderEnum>[
        _$patientUpdateInsuranceProviderEnum_cnas,
        _$patientUpdateInsuranceProviderEnum_casnos,
        _$patientUpdateInsuranceProviderEnum_none,
        _$patientUpdateInsuranceProviderEnum_private,
      ],
    );

Serializer<PatientUpdateInsuranceProviderEnum>
_$patientUpdateInsuranceProviderEnumSerializer =
    _$PatientUpdateInsuranceProviderEnumSerializer();

class _$PatientUpdateInsuranceProviderEnumSerializer
    implements PrimitiveSerializer<PatientUpdateInsuranceProviderEnum> {
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
  final Iterable<Type> types = const <Type>[PatientUpdateInsuranceProviderEnum];
  @override
  final String wireName = 'PatientUpdateInsuranceProviderEnum';

  @override
  Object serialize(
    Serializers serializers,
    PatientUpdateInsuranceProviderEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  PatientUpdateInsuranceProviderEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => PatientUpdateInsuranceProviderEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$PatientUpdateInsurance extends PatientUpdateInsurance {
  @override
  final PatientUpdateInsuranceProviderEnum? provider;
  @override
  final String? number;

  factory _$PatientUpdateInsurance([
    void Function(PatientUpdateInsuranceBuilder)? updates,
  ]) => (PatientUpdateInsuranceBuilder()..update(updates))._build();

  _$PatientUpdateInsurance._({this.provider, this.number}) : super._();
  @override
  PatientUpdateInsurance rebuild(
    void Function(PatientUpdateInsuranceBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PatientUpdateInsuranceBuilder toBuilder() =>
      PatientUpdateInsuranceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatientUpdateInsurance &&
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
    return (newBuiltValueToStringHelper(r'PatientUpdateInsurance')
          ..add('provider', provider)
          ..add('number', number))
        .toString();
  }
}

class PatientUpdateInsuranceBuilder
    implements Builder<PatientUpdateInsurance, PatientUpdateInsuranceBuilder> {
  _$PatientUpdateInsurance? _$v;

  PatientUpdateInsuranceProviderEnum? _provider;
  PatientUpdateInsuranceProviderEnum? get provider => _$this._provider;
  set provider(PatientUpdateInsuranceProviderEnum? provider) =>
      _$this._provider = provider;

  String? _number;
  String? get number => _$this._number;
  set number(String? number) => _$this._number = number;

  PatientUpdateInsuranceBuilder() {
    PatientUpdateInsurance._defaults(this);
  }

  PatientUpdateInsuranceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _provider = $v.provider;
      _number = $v.number;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatientUpdateInsurance other) {
    _$v = other as _$PatientUpdateInsurance;
  }

  @override
  void update(void Function(PatientUpdateInsuranceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PatientUpdateInsurance build() => _build();

  _$PatientUpdateInsurance _build() {
    final _$result =
        _$v ?? _$PatientUpdateInsurance._(provider: provider, number: number);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
