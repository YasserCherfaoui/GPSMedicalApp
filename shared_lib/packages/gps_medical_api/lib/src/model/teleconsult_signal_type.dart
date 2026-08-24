//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'teleconsult_signal_type.g.dart';

class TeleconsultSignalType extends EnumClass {

  @BuiltValueEnumConst(wireName: r'offer')
  static const TeleconsultSignalType offer = _$offer;
  @BuiltValueEnumConst(wireName: r'answer')
  static const TeleconsultSignalType answer = _$answer;
  @BuiltValueEnumConst(wireName: r'ice_candidate')
  static const TeleconsultSignalType iceCandidate = _$iceCandidate;
  @BuiltValueEnumConst(wireName: r'hangup')
  static const TeleconsultSignalType hangup = _$hangup;

  static Serializer<TeleconsultSignalType> get serializer => _$teleconsultSignalTypeSerializer;

  const TeleconsultSignalType._(String name): super(name);

  static BuiltSet<TeleconsultSignalType> get values => _$values;
  static TeleconsultSignalType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class TeleconsultSignalTypeMixin = Object with _$TeleconsultSignalTypeMixin;

