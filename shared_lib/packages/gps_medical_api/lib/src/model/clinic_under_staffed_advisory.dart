//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/clinic_understaffed_shortfall.dart';
import 'package:gps_medical_api/src/model/clinic_under_staffed_advisory_affected_templates_inner.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_under_staffed_advisory.g.dart';

/// ClinicUnderStaffedAdvisory
///
/// Properties:
/// * [underStaffed] 
/// * [shortfall] 
/// * [affectedTemplates] 
@BuiltValue()
abstract class ClinicUnderStaffedAdvisory implements Built<ClinicUnderStaffedAdvisory, ClinicUnderStaffedAdvisoryBuilder> {
  @BuiltValueField(wireName: r'under_staffed')
  bool? get underStaffed;

  @BuiltValueField(wireName: r'shortfall')
  ClinicUnderstaffedShortfall? get shortfall;

  @BuiltValueField(wireName: r'affected_templates')
  BuiltList<ClinicUnderStaffedAdvisoryAffectedTemplatesInner>? get affectedTemplates;

  ClinicUnderStaffedAdvisory._();

  factory ClinicUnderStaffedAdvisory([void updates(ClinicUnderStaffedAdvisoryBuilder b)]) = _$ClinicUnderStaffedAdvisory;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicUnderStaffedAdvisoryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicUnderStaffedAdvisory> get serializer => _$ClinicUnderStaffedAdvisorySerializer();
}

class _$ClinicUnderStaffedAdvisorySerializer implements PrimitiveSerializer<ClinicUnderStaffedAdvisory> {
  @override
  final Iterable<Type> types = const [ClinicUnderStaffedAdvisory, _$ClinicUnderStaffedAdvisory];

  @override
  final String wireName = r'ClinicUnderStaffedAdvisory';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicUnderStaffedAdvisory object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.underStaffed != null) {
      yield r'under_staffed';
      yield serializers.serialize(
        object.underStaffed,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.shortfall != null) {
      yield r'shortfall';
      yield serializers.serialize(
        object.shortfall,
        specifiedType: const FullType.nullable(ClinicUnderstaffedShortfall),
      );
    }
    if (object.affectedTemplates != null) {
      yield r'affected_templates';
      yield serializers.serialize(
        object.affectedTemplates,
        specifiedType: const FullType(BuiltList, [FullType(ClinicUnderStaffedAdvisoryAffectedTemplatesInner)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicUnderStaffedAdvisory object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicUnderStaffedAdvisoryBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'under_staffed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.underStaffed = valueDes;
          break;
        case r'shortfall':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ClinicUnderstaffedShortfall),
          ) as ClinicUnderstaffedShortfall?;
          if (valueDes == null) continue;
          result.shortfall.replace(valueDes);
          break;
        case r'affected_templates':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ClinicUnderStaffedAdvisoryAffectedTemplatesInner)]),
          ) as BuiltList<ClinicUnderStaffedAdvisoryAffectedTemplatesInner>;
          result.affectedTemplates.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicUnderStaffedAdvisory deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicUnderStaffedAdvisoryBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

