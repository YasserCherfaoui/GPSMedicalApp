//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/clinic_roster_member_availability.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_roster_availability.g.dart';

/// ClinicRosterAvailability
///
/// Properties:
/// * [from] 
/// * [to] 
/// * [members] 
@BuiltValue()
abstract class ClinicRosterAvailability implements Built<ClinicRosterAvailability, ClinicRosterAvailabilityBuilder> {
  @BuiltValueField(wireName: r'from')
  DateTime get from;

  @BuiltValueField(wireName: r'to')
  DateTime get to;

  @BuiltValueField(wireName: r'members')
  BuiltList<ClinicRosterMemberAvailability> get members;

  ClinicRosterAvailability._();

  factory ClinicRosterAvailability([void updates(ClinicRosterAvailabilityBuilder b)]) = _$ClinicRosterAvailability;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicRosterAvailabilityBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicRosterAvailability> get serializer => _$ClinicRosterAvailabilitySerializer();
}

class _$ClinicRosterAvailabilitySerializer implements PrimitiveSerializer<ClinicRosterAvailability> {
  @override
  final Iterable<Type> types = const [ClinicRosterAvailability, _$ClinicRosterAvailability];

  @override
  final String wireName = r'ClinicRosterAvailability';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicRosterAvailability object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'from';
    yield serializers.serialize(
      object.from,
      specifiedType: const FullType(DateTime),
    );
    yield r'to';
    yield serializers.serialize(
      object.to,
      specifiedType: const FullType(DateTime),
    );
    yield r'members';
    yield serializers.serialize(
      object.members,
      specifiedType: const FullType(BuiltList, [FullType(ClinicRosterMemberAvailability)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicRosterAvailability object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicRosterAvailabilityBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'from':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.from = valueDes;
          break;
        case r'to':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.to = valueDes;
          break;
        case r'members':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ClinicRosterMemberAvailability)]),
          ) as BuiltList<ClinicRosterMemberAvailability>;
          result.members.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicRosterAvailability deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicRosterAvailabilityBuilder();
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

