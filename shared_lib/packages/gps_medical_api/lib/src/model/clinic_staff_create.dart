//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_staff_create.g.dart';

/// ClinicStaffCreate
///
/// Properties:
/// * [userId] 
@BuiltValue()
abstract class ClinicStaffCreate implements Built<ClinicStaffCreate, ClinicStaffCreateBuilder> {
  @BuiltValueField(wireName: r'user_id')
  String get userId;

  ClinicStaffCreate._();

  factory ClinicStaffCreate([void updates(ClinicStaffCreateBuilder b)]) = _$ClinicStaffCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicStaffCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicStaffCreate> get serializer => _$ClinicStaffCreateSerializer();
}

class _$ClinicStaffCreateSerializer implements PrimitiveSerializer<ClinicStaffCreate> {
  @override
  final Iterable<Type> types = const [ClinicStaffCreate, _$ClinicStaffCreate];

  @override
  final String wireName = r'ClinicStaffCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicStaffCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicStaffCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicStaffCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicStaffCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicStaffCreateBuilder();
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

