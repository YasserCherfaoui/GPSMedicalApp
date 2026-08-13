//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'messaging_realtime_event.g.dart';

/// MessagingRealtimeEvent
///
/// Properties:
/// * [type] 
/// * [threadId] 
/// * [payload] - Pour `message.new` : objet `Message`. Pour `message.read` : `{ message_id, reader_id, read_at }`. 
@BuiltValue()
abstract class MessagingRealtimeEvent implements Built<MessagingRealtimeEvent, MessagingRealtimeEventBuilder> {
  @BuiltValueField(wireName: r'type')
  MessagingRealtimeEventTypeEnum get type;
  // enum typeEnum {  message.new,  message.read,  };

  @BuiltValueField(wireName: r'thread_id')
  String get threadId;

  /// Pour `message.new` : objet `Message`. Pour `message.read` : `{ message_id, reader_id, read_at }`. 
  @BuiltValueField(wireName: r'payload')
  BuiltMap<String, JsonObject?> get payload;

  MessagingRealtimeEvent._();

  factory MessagingRealtimeEvent([void updates(MessagingRealtimeEventBuilder b)]) = _$MessagingRealtimeEvent;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MessagingRealtimeEventBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MessagingRealtimeEvent> get serializer => _$MessagingRealtimeEventSerializer();
}

class _$MessagingRealtimeEventSerializer implements PrimitiveSerializer<MessagingRealtimeEvent> {
  @override
  final Iterable<Type> types = const [MessagingRealtimeEvent, _$MessagingRealtimeEvent];

  @override
  final String wireName = r'MessagingRealtimeEvent';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MessagingRealtimeEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(MessagingRealtimeEventTypeEnum),
    );
    yield r'thread_id';
    yield serializers.serialize(
      object.threadId,
      specifiedType: const FullType(String),
    );
    yield r'payload';
    yield serializers.serialize(
      object.payload,
      specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MessagingRealtimeEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MessagingRealtimeEventBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MessagingRealtimeEventTypeEnum),
          ) as MessagingRealtimeEventTypeEnum;
          result.type = valueDes;
          break;
        case r'thread_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.threadId = valueDes;
          break;
        case r'payload':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>;
          result.payload.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MessagingRealtimeEvent deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MessagingRealtimeEventBuilder();
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

class MessagingRealtimeEventTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'message.new')
  static const MessagingRealtimeEventTypeEnum messagePeriodNew = _$messagingRealtimeEventTypeEnum_messagePeriodNew;
  @BuiltValueEnumConst(wireName: r'message.read')
  static const MessagingRealtimeEventTypeEnum messagePeriodRead = _$messagingRealtimeEventTypeEnum_messagePeriodRead;

  static Serializer<MessagingRealtimeEventTypeEnum> get serializer => _$messagingRealtimeEventTypeEnumSerializer;

  const MessagingRealtimeEventTypeEnum._(String name): super(name);

  static BuiltSet<MessagingRealtimeEventTypeEnum> get values => _$messagingRealtimeEventTypeEnumValues;
  static MessagingRealtimeEventTypeEnum valueOf(String name) => _$messagingRealtimeEventTypeEnumValueOf(name);
}

