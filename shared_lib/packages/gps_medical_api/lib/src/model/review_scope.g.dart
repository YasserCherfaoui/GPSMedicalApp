// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_scope.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ReviewScope _$appointment = const ReviewScope._('appointment');
const ReviewScope _$profile = const ReviewScope._('profile');

ReviewScope _$valueOf(String name) {
  switch (name) {
    case 'appointment':
      return _$appointment;
    case 'profile':
      return _$profile;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ReviewScope> _$values = BuiltSet<ReviewScope>(
  const <ReviewScope>[_$appointment, _$profile],
);

class _$ReviewScopeMeta {
  const _$ReviewScopeMeta();
  ReviewScope get appointment => _$appointment;
  ReviewScope get profile => _$profile;
  ReviewScope valueOf(String name) => _$valueOf(name);
  BuiltSet<ReviewScope> get values => _$values;
}

mixin _$ReviewScopeMixin {
  // ignore: non_constant_identifier_names
  _$ReviewScopeMeta get ReviewScope => const _$ReviewScopeMeta();
}

Serializer<ReviewScope> _$reviewScopeSerializer = _$ReviewScopeSerializer();

class _$ReviewScopeSerializer implements PrimitiveSerializer<ReviewScope> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'appointment': 'appointment',
    'profile': 'profile',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'appointment': 'appointment',
    'profile': 'profile',
  };

  @override
  final Iterable<Type> types = const <Type>[ReviewScope];
  @override
  final String wireName = 'ReviewScope';

  @override
  Object serialize(
    Serializers serializers,
    ReviewScope object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ReviewScope deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ReviewScope.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
