//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'teleconsult_lab_join_write.g.dart';

/// TeleconsultLabJoinWrite
///
/// Properties:
/// * [peerId] 
@BuiltValue()
abstract class TeleconsultLabJoinWrite implements Built<TeleconsultLabJoinWrite, TeleconsultLabJoinWriteBuilder> {
  @BuiltValueField(wireName: r'peer_id')
  String? get peerId;

  TeleconsultLabJoinWrite._();

  factory TeleconsultLabJoinWrite([void updates(TeleconsultLabJoinWriteBuilder b)]) = _$TeleconsultLabJoinWrite;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TeleconsultLabJoinWriteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TeleconsultLabJoinWrite> get serializer => _$TeleconsultLabJoinWriteSerializer();
}

class _$TeleconsultLabJoinWriteSerializer implements PrimitiveSerializer<TeleconsultLabJoinWrite> {
  @override
  final Iterable<Type> types = const [TeleconsultLabJoinWrite, _$TeleconsultLabJoinWrite];

  @override
  final String wireName = r'TeleconsultLabJoinWrite';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TeleconsultLabJoinWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.peerId != null) {
      yield r'peer_id';
      yield serializers.serialize(
        object.peerId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TeleconsultLabJoinWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TeleconsultLabJoinWriteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'peer_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.peerId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TeleconsultLabJoinWrite deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TeleconsultLabJoinWriteBuilder();
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

