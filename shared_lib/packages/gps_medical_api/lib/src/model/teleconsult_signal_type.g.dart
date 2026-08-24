// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teleconsult_signal_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const TeleconsultSignalType _$offer = const TeleconsultSignalType._('offer');
const TeleconsultSignalType _$answer = const TeleconsultSignalType._('answer');
const TeleconsultSignalType _$iceCandidate = const TeleconsultSignalType._(
  'iceCandidate',
);
const TeleconsultSignalType _$hangup = const TeleconsultSignalType._('hangup');

TeleconsultSignalType _$valueOf(String name) {
  switch (name) {
    case 'offer':
      return _$offer;
    case 'answer':
      return _$answer;
    case 'iceCandidate':
      return _$iceCandidate;
    case 'hangup':
      return _$hangup;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<TeleconsultSignalType> _$values =
    BuiltSet<TeleconsultSignalType>(const <TeleconsultSignalType>[
      _$offer,
      _$answer,
      _$iceCandidate,
      _$hangup,
    ]);

class _$TeleconsultSignalTypeMeta {
  const _$TeleconsultSignalTypeMeta();
  TeleconsultSignalType get offer => _$offer;
  TeleconsultSignalType get answer => _$answer;
  TeleconsultSignalType get iceCandidate => _$iceCandidate;
  TeleconsultSignalType get hangup => _$hangup;
  TeleconsultSignalType valueOf(String name) => _$valueOf(name);
  BuiltSet<TeleconsultSignalType> get values => _$values;
}

mixin _$TeleconsultSignalTypeMixin {
  // ignore: non_constant_identifier_names
  _$TeleconsultSignalTypeMeta get TeleconsultSignalType =>
      const _$TeleconsultSignalTypeMeta();
}

Serializer<TeleconsultSignalType> _$teleconsultSignalTypeSerializer =
    _$TeleconsultSignalTypeSerializer();

class _$TeleconsultSignalTypeSerializer
    implements PrimitiveSerializer<TeleconsultSignalType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'offer': 'offer',
    'answer': 'answer',
    'iceCandidate': 'ice_candidate',
    'hangup': 'hangup',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'offer': 'offer',
    'answer': 'answer',
    'ice_candidate': 'iceCandidate',
    'hangup': 'hangup',
  };

  @override
  final Iterable<Type> types = const <Type>[TeleconsultSignalType];
  @override
  final String wireName = 'TeleconsultSignalType';

  @override
  Object serialize(
    Serializers serializers,
    TeleconsultSignalType object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  TeleconsultSignalType deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => TeleconsultSignalType.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
