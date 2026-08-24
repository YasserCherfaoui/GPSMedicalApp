//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'review_subject_type.g.dart';

class ReviewSubjectType extends EnumClass {

  @BuiltValueEnumConst(wireName: r'doctor')
  static const ReviewSubjectType doctor = _$doctor;
  @BuiltValueEnumConst(wireName: r'clinic')
  static const ReviewSubjectType clinic = _$clinic;

  static Serializer<ReviewSubjectType> get serializer => _$reviewSubjectTypeSerializer;

  const ReviewSubjectType._(String name): super(name);

  static BuiltSet<ReviewSubjectType> get values => _$values;
  static ReviewSubjectType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ReviewSubjectTypeMixin = Object with _$ReviewSubjectTypeMixin;

