//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_under_staffed_advisory_affected_templates_inner.g.dart';

/// ClinicUnderStaffedAdvisoryAffectedTemplatesInner
///
/// Properties:
/// * [templateId] 
/// * [weekday] 
/// * [startTime] 
/// * [endTime] 
/// * [capacity] 
/// * [understaffed] 
@BuiltValue()
abstract class ClinicUnderStaffedAdvisoryAffectedTemplatesInner implements Built<ClinicUnderStaffedAdvisoryAffectedTemplatesInner, ClinicUnderStaffedAdvisoryAffectedTemplatesInnerBuilder> {
  @BuiltValueField(wireName: r'template_id')
  String? get templateId;

  @BuiltValueField(wireName: r'weekday')
  int? get weekday;

  @BuiltValueField(wireName: r'start_time')
  String? get startTime;

  @BuiltValueField(wireName: r'end_time')
  String? get endTime;

  @BuiltValueField(wireName: r'capacity')
  int? get capacity;

  @BuiltValueField(wireName: r'understaffed')
  bool? get understaffed;

  ClinicUnderStaffedAdvisoryAffectedTemplatesInner._();

  factory ClinicUnderStaffedAdvisoryAffectedTemplatesInner([void updates(ClinicUnderStaffedAdvisoryAffectedTemplatesInnerBuilder b)]) = _$ClinicUnderStaffedAdvisoryAffectedTemplatesInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicUnderStaffedAdvisoryAffectedTemplatesInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicUnderStaffedAdvisoryAffectedTemplatesInner> get serializer => _$ClinicUnderStaffedAdvisoryAffectedTemplatesInnerSerializer();
}

class _$ClinicUnderStaffedAdvisoryAffectedTemplatesInnerSerializer implements PrimitiveSerializer<ClinicUnderStaffedAdvisoryAffectedTemplatesInner> {
  @override
  final Iterable<Type> types = const [ClinicUnderStaffedAdvisoryAffectedTemplatesInner, _$ClinicUnderStaffedAdvisoryAffectedTemplatesInner];

  @override
  final String wireName = r'ClinicUnderStaffedAdvisoryAffectedTemplatesInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicUnderStaffedAdvisoryAffectedTemplatesInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.templateId != null) {
      yield r'template_id';
      yield serializers.serialize(
        object.templateId,
        specifiedType: const FullType(String),
      );
    }
    if (object.weekday != null) {
      yield r'weekday';
      yield serializers.serialize(
        object.weekday,
        specifiedType: const FullType(int),
      );
    }
    if (object.startTime != null) {
      yield r'start_time';
      yield serializers.serialize(
        object.startTime,
        specifiedType: const FullType(String),
      );
    }
    if (object.endTime != null) {
      yield r'end_time';
      yield serializers.serialize(
        object.endTime,
        specifiedType: const FullType(String),
      );
    }
    if (object.capacity != null) {
      yield r'capacity';
      yield serializers.serialize(
        object.capacity,
        specifiedType: const FullType(int),
      );
    }
    if (object.understaffed != null) {
      yield r'understaffed';
      yield serializers.serialize(
        object.understaffed,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicUnderStaffedAdvisoryAffectedTemplatesInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicUnderStaffedAdvisoryAffectedTemplatesInnerBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'template_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.templateId = valueDes;
          break;
        case r'weekday':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.weekday = valueDes;
          break;
        case r'start_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.startTime = valueDes;
          break;
        case r'end_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.endTime = valueDes;
          break;
        case r'capacity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.capacity = valueDes;
          break;
        case r'understaffed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.understaffed = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicUnderStaffedAdvisoryAffectedTemplatesInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicUnderStaffedAdvisoryAffectedTemplatesInnerBuilder();
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

