// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_residency_mode.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DataResidencyMode _$server = const DataResidencyMode._('server');
const DataResidencyMode _$deviceOnly = const DataResidencyMode._('deviceOnly');

DataResidencyMode _$valueOf(String name) {
  switch (name) {
    case 'server':
      return _$server;
    case 'deviceOnly':
      return _$deviceOnly;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DataResidencyMode> _$values = BuiltSet<DataResidencyMode>(
  const <DataResidencyMode>[_$server, _$deviceOnly],
);

class _$DataResidencyModeMeta {
  const _$DataResidencyModeMeta();
  DataResidencyMode get server => _$server;
  DataResidencyMode get deviceOnly => _$deviceOnly;
  DataResidencyMode valueOf(String name) => _$valueOf(name);
  BuiltSet<DataResidencyMode> get values => _$values;
}

mixin _$DataResidencyModeMixin {
  // ignore: non_constant_identifier_names
  _$DataResidencyModeMeta get DataResidencyMode =>
      const _$DataResidencyModeMeta();
}

Serializer<DataResidencyMode> _$dataResidencyModeSerializer =
    _$DataResidencyModeSerializer();

class _$DataResidencyModeSerializer
    implements PrimitiveSerializer<DataResidencyMode> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'server': 'server',
    'deviceOnly': 'device_only',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'server': 'server',
    'device_only': 'deviceOnly',
  };

  @override
  final Iterable<Type> types = const <Type>[DataResidencyMode];
  @override
  final String wireName = 'DataResidencyMode';

  @override
  Object serialize(
    Serializers serializers,
    DataResidencyMode object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  DataResidencyMode deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => DataResidencyMode.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
