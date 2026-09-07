//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_roster_donated_block.g.dart';

/// ClinicRosterDonatedBlock
///
/// Properties:
/// * [startAt] 
/// * [endAt] 
/// * [mode] 
@BuiltValue()
abstract class ClinicRosterDonatedBlock implements Built<ClinicRosterDonatedBlock, ClinicRosterDonatedBlockBuilder> {
  @BuiltValueField(wireName: r'start_at')
  DateTime get startAt;

  @BuiltValueField(wireName: r'end_at')
  DateTime get endAt;

  @BuiltValueField(wireName: r'mode')
  ClinicRosterDonatedBlockModeEnum? get mode;
  // enum modeEnum {  in_person,  telehealth,  both,  };

  ClinicRosterDonatedBlock._();

  factory ClinicRosterDonatedBlock([void updates(ClinicRosterDonatedBlockBuilder b)]) = _$ClinicRosterDonatedBlock;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicRosterDonatedBlockBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicRosterDonatedBlock> get serializer => _$ClinicRosterDonatedBlockSerializer();
}

class _$ClinicRosterDonatedBlockSerializer implements PrimitiveSerializer<ClinicRosterDonatedBlock> {
  @override
  final Iterable<Type> types = const [ClinicRosterDonatedBlock, _$ClinicRosterDonatedBlock];

  @override
  final String wireName = r'ClinicRosterDonatedBlock';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicRosterDonatedBlock object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'start_at';
    yield serializers.serialize(
      object.startAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'end_at';
    yield serializers.serialize(
      object.endAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.mode != null) {
      yield r'mode';
      yield serializers.serialize(
        object.mode,
        specifiedType: const FullType.nullable(ClinicRosterDonatedBlockModeEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicRosterDonatedBlock object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicRosterDonatedBlockBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'start_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startAt = valueDes;
          break;
        case r'end_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endAt = valueDes;
          break;
        case r'mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ClinicRosterDonatedBlockModeEnum),
          ) as ClinicRosterDonatedBlockModeEnum?;
          if (valueDes == null) continue;
          result.mode = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicRosterDonatedBlock deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicRosterDonatedBlockBuilder();
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

class ClinicRosterDonatedBlockModeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'in_person')
  static const ClinicRosterDonatedBlockModeEnum inPerson = _$clinicRosterDonatedBlockModeEnum_inPerson;
  @BuiltValueEnumConst(wireName: r'telehealth')
  static const ClinicRosterDonatedBlockModeEnum telehealth = _$clinicRosterDonatedBlockModeEnum_telehealth;
  @BuiltValueEnumConst(wireName: r'both')
  static const ClinicRosterDonatedBlockModeEnum both = _$clinicRosterDonatedBlockModeEnum_both;

  static Serializer<ClinicRosterDonatedBlockModeEnum> get serializer => _$clinicRosterDonatedBlockModeEnumSerializer;

  const ClinicRosterDonatedBlockModeEnum._(String name): super(name);

  static BuiltSet<ClinicRosterDonatedBlockModeEnum> get values => _$clinicRosterDonatedBlockModeEnumValues;
  static ClinicRosterDonatedBlockModeEnum valueOf(String name) => _$clinicRosterDonatedBlockModeEnumValueOf(name);
}

