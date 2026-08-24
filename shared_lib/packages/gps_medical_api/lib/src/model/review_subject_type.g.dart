// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_subject_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ReviewSubjectType _$doctor = const ReviewSubjectType._('doctor');
const ReviewSubjectType _$clinic = const ReviewSubjectType._('clinic');

ReviewSubjectType _$valueOf(String name) {
  switch (name) {
    case 'doctor':
      return _$doctor;
    case 'clinic':
      return _$clinic;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ReviewSubjectType> _$values = BuiltSet<ReviewSubjectType>(
  const <ReviewSubjectType>[_$doctor, _$clinic],
);

class _$ReviewSubjectTypeMeta {
  const _$ReviewSubjectTypeMeta();
  ReviewSubjectType get doctor => _$doctor;
  ReviewSubjectType get clinic => _$clinic;
  ReviewSubjectType valueOf(String name) => _$valueOf(name);
  BuiltSet<ReviewSubjectType> get values => _$values;
}

mixin _$ReviewSubjectTypeMixin {
  // ignore: non_constant_identifier_names
  _$ReviewSubjectTypeMeta get ReviewSubjectType =>
      const _$ReviewSubjectTypeMeta();
}

Serializer<ReviewSubjectType> _$reviewSubjectTypeSerializer =
    _$ReviewSubjectTypeSerializer();

class _$ReviewSubjectTypeSerializer
    implements PrimitiveSerializer<ReviewSubjectType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'doctor': 'doctor',
    'clinic': 'clinic',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'doctor': 'doctor',
    'clinic': 'clinic',
  };

  @override
  final Iterable<Type> types = const <Type>[ReviewSubjectType];
  @override
  final String wireName = 'ReviewSubjectType';

  @override
  Object serialize(
    Serializers serializers,
    ReviewSubjectType object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ReviewSubjectType deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ReviewSubjectType.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
