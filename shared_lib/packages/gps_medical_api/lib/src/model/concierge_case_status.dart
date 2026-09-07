//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'concierge_case_status.g.dart';

class ConciergeCaseStatus extends EnumClass {

  @BuiltValueEnumConst(wireName: r'open')
  static const ConciergeCaseStatus open = _$open;
  @BuiltValueEnumConst(wireName: r'active')
  static const ConciergeCaseStatus active = _$active;
  @BuiltValueEnumConst(wireName: r'closed')
  static const ConciergeCaseStatus closed = _$closed;

  static Serializer<ConciergeCaseStatus> get serializer => _$conciergeCaseStatusSerializer;

  const ConciergeCaseStatus._(String name): super(name);

  static BuiltSet<ConciergeCaseStatus> get values => _$values;
  static ConciergeCaseStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ConciergeCaseStatusMixin = Object with _$ConciergeCaseStatusMixin;

