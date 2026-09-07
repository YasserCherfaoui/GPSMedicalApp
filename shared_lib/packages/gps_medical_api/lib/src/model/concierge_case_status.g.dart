// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concierge_case_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ConciergeCaseStatus _$open = const ConciergeCaseStatus._('open');
const ConciergeCaseStatus _$active = const ConciergeCaseStatus._('active');
const ConciergeCaseStatus _$closed = const ConciergeCaseStatus._('closed');

ConciergeCaseStatus _$valueOf(String name) {
  switch (name) {
    case 'open':
      return _$open;
    case 'active':
      return _$active;
    case 'closed':
      return _$closed;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ConciergeCaseStatus> _$values = BuiltSet<ConciergeCaseStatus>(
  const <ConciergeCaseStatus>[_$open, _$active, _$closed],
);

class _$ConciergeCaseStatusMeta {
  const _$ConciergeCaseStatusMeta();
  ConciergeCaseStatus get open => _$open;
  ConciergeCaseStatus get active => _$active;
  ConciergeCaseStatus get closed => _$closed;
  ConciergeCaseStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<ConciergeCaseStatus> get values => _$values;
}

mixin _$ConciergeCaseStatusMixin {
  // ignore: non_constant_identifier_names
  _$ConciergeCaseStatusMeta get ConciergeCaseStatus =>
      const _$ConciergeCaseStatusMeta();
}

Serializer<ConciergeCaseStatus> _$conciergeCaseStatusSerializer =
    _$ConciergeCaseStatusSerializer();

class _$ConciergeCaseStatusSerializer
    implements PrimitiveSerializer<ConciergeCaseStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'open': 'open',
    'active': 'active',
    'closed': 'closed',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'open': 'open',
    'active': 'active',
    'closed': 'closed',
  };

  @override
  final Iterable<Type> types = const <Type>[ConciergeCaseStatus];
  @override
  final String wireName = 'ConciergeCaseStatus';

  @override
  Object serialize(
    Serializers serializers,
    ConciergeCaseStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ConciergeCaseStatus deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ConciergeCaseStatus.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
