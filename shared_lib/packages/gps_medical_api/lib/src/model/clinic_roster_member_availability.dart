//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/clinic_roster_donated_block.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_roster_member_availability.g.dart';

/// ClinicRosterMemberAvailability
///
/// Properties:
/// * [specialistId] 
/// * [fullName] 
/// * [specialtyCode] 
/// * [blocks] 
@BuiltValue()
abstract class ClinicRosterMemberAvailability implements Built<ClinicRosterMemberAvailability, ClinicRosterMemberAvailabilityBuilder> {
  @BuiltValueField(wireName: r'specialist_id')
  String get specialistId;

  @BuiltValueField(wireName: r'full_name')
  String get fullName;

  @BuiltValueField(wireName: r'specialty_code')
  String? get specialtyCode;

  @BuiltValueField(wireName: r'blocks')
  BuiltList<ClinicRosterDonatedBlock> get blocks;

  ClinicRosterMemberAvailability._();

  factory ClinicRosterMemberAvailability([void updates(ClinicRosterMemberAvailabilityBuilder b)]) = _$ClinicRosterMemberAvailability;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicRosterMemberAvailabilityBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicRosterMemberAvailability> get serializer => _$ClinicRosterMemberAvailabilitySerializer();
}

class _$ClinicRosterMemberAvailabilitySerializer implements PrimitiveSerializer<ClinicRosterMemberAvailability> {
  @override
  final Iterable<Type> types = const [ClinicRosterMemberAvailability, _$ClinicRosterMemberAvailability];

  @override
  final String wireName = r'ClinicRosterMemberAvailability';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicRosterMemberAvailability object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'specialist_id';
    yield serializers.serialize(
      object.specialistId,
      specifiedType: const FullType(String),
    );
    yield r'full_name';
    yield serializers.serialize(
      object.fullName,
      specifiedType: const FullType(String),
    );
    if (object.specialtyCode != null) {
      yield r'specialty_code';
      yield serializers.serialize(
        object.specialtyCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'blocks';
    yield serializers.serialize(
      object.blocks,
      specifiedType: const FullType(BuiltList, [FullType(ClinicRosterDonatedBlock)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicRosterMemberAvailability object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicRosterMemberAvailabilityBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'specialist_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.specialistId = valueDes;
          break;
        case r'full_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
          break;
        case r'specialty_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.specialtyCode = valueDes;
          break;
        case r'blocks':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ClinicRosterDonatedBlock)]),
          ) as BuiltList<ClinicRosterDonatedBlock>;
          result.blocks.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicRosterMemberAvailability deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicRosterMemberAvailabilityBuilder();
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

