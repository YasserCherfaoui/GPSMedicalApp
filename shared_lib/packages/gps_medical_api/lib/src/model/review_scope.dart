//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'review_scope.g.dart';

class ReviewScope extends EnumClass {

  @BuiltValueEnumConst(wireName: r'appointment')
  static const ReviewScope appointment = _$appointment;
  @BuiltValueEnumConst(wireName: r'profile')
  static const ReviewScope profile = _$profile;

  static Serializer<ReviewScope> get serializer => _$reviewScopeSerializer;

  const ReviewScope._(String name): super(name);

  static BuiltSet<ReviewScope> get values => _$values;
  static ReviewScope valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ReviewScopeMixin = Object with _$ReviewScopeMixin;

