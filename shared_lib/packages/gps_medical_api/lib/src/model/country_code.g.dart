// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_code.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CountryCode _$DZ = const CountryCode._('DZ');
const CountryCode _$TN = const CountryCode._('TN');

CountryCode _$valueOf(String name) {
  switch (name) {
    case 'DZ':
      return _$DZ;
    case 'TN':
      return _$TN;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<CountryCode> _$values = BuiltSet<CountryCode>(
  const <CountryCode>[_$DZ, _$TN],
);

class _$CountryCodeMeta {
  const _$CountryCodeMeta();
  CountryCode get DZ => _$DZ;
  CountryCode get TN => _$TN;
  CountryCode valueOf(String name) => _$valueOf(name);
  BuiltSet<CountryCode> get values => _$values;
}

mixin _$CountryCodeMixin {
  // ignore: non_constant_identifier_names
  _$CountryCodeMeta get CountryCode => const _$CountryCodeMeta();
}

Serializer<CountryCode> _$countryCodeSerializer = _$CountryCodeSerializer();

class _$CountryCodeSerializer implements PrimitiveSerializer<CountryCode> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'DZ': 'DZ',
    'TN': 'TN',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'DZ': 'DZ',
    'TN': 'TN',
  };

  @override
  final Iterable<Type> types = const <Type>[CountryCode];
  @override
  final String wireName = 'CountryCode';

  @override
  Object serialize(
    Serializers serializers,
    CountryCode object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  CountryCode deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => CountryCode.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
