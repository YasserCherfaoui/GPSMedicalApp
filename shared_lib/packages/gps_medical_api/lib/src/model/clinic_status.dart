//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_status.g.dart';

class ClinicStatus extends EnumClass {

  @BuiltValueEnumConst(wireName: r'pending')
  static const ClinicStatus pending = _$pending;
  @BuiltValueEnumConst(wireName: r'active')
  static const ClinicStatus active = _$active;
  @BuiltValueEnumConst(wireName: r'suspended')
  static const ClinicStatus suspended = _$suspended;
  @BuiltValueEnumConst(wireName: r'rejected')
  static const ClinicStatus rejected = _$rejected;

  static Serializer<ClinicStatus> get serializer => _$clinicStatusSerializer;

  const ClinicStatus._(String name): super(name);

  static BuiltSet<ClinicStatus> get values => _$values;
  static ClinicStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ClinicStatusMixin = Object with _$ClinicStatusMixin;

