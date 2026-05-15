//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'thread.g.dart';

/// Thread
///
/// Properties:
/// * [id]
/// * [patientId]
/// * [doctorId]
/// * [lastMessageAt]
/// * [unreadCount]
/// * [appointmentId]
@BuiltValue()
abstract class Thread implements Built<Thread, ThreadBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'patient_id')
  String? get patientId;

  @BuiltValueField(wireName: r'doctor_id')
  String? get doctorId;

  @BuiltValueField(wireName: r'last_message_at')
  DateTime? get lastMessageAt;

  @BuiltValueField(wireName: r'unread_count')
  int? get unreadCount;

  @BuiltValueField(wireName: r'appointment_id')
  String? get appointmentId;

  Thread._();

  factory Thread([void updates(ThreadBuilder b)]) = _$Thread;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ThreadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Thread> get serializer => _$ThreadSerializer();
}

class _$ThreadSerializer implements PrimitiveSerializer<Thread> {
  @override
  final Iterable<Type> types = const [Thread, _$Thread];

  @override
  final String wireName = r'Thread';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Thread object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.patientId != null) {
      yield r'patient_id';
      yield serializers.serialize(
        object.patientId,
        specifiedType: const FullType(String),
      );
    }
    if (object.doctorId != null) {
      yield r'doctor_id';
      yield serializers.serialize(
        object.doctorId,
        specifiedType: const FullType(String),
      );
    }
    if (object.lastMessageAt != null) {
      yield r'last_message_at';
      yield serializers.serialize(
        object.lastMessageAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.unreadCount != null) {
      yield r'unread_count';
      yield serializers.serialize(
        object.unreadCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.appointmentId != null) {
      yield r'appointment_id';
      yield serializers.serialize(
        object.appointmentId,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Thread object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(
      serializers,
      object,
      specifiedType: specifiedType,
    ).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ThreadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.id = valueDes;
          break;
        case r'patient_id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.patientId = valueDes;
          break;
        case r'doctor_id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.doctorId = valueDes;
          break;
        case r'last_message_at':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DateTime),
                  )
                  as DateTime;
          result.lastMessageAt = valueDes;
          break;
        case r'unread_count':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.unreadCount = valueDes;
          break;
        case r'appointment_id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.appointmentId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Thread deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ThreadBuilder();
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
