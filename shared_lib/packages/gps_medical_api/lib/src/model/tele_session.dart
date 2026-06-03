//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/ice_server.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tele_session.g.dart';

/// TeleSession
///
/// Properties:
/// * [appointmentId] 
/// * [roomId] 
/// * [status] 
/// * [startedAt] 
/// * [endedAt] 
/// * [durationSeconds] 
/// * [iceServers] 
/// * [token] - Jeton court (TTL 5 min) pour rejoindre la salle
@BuiltValue()
abstract class TeleSession implements Built<TeleSession, TeleSessionBuilder> {
  @BuiltValueField(wireName: r'appointment_id')
  String? get appointmentId;

  @BuiltValueField(wireName: r'room_id')
  String? get roomId;

  @BuiltValueField(wireName: r'status')
  TeleSessionStatusEnum? get status;
  // enum statusEnum {  scheduled,  ready,  in_progress,  ended,  };

  @BuiltValueField(wireName: r'started_at')
  DateTime? get startedAt;

  @BuiltValueField(wireName: r'ended_at')
  DateTime? get endedAt;

  @BuiltValueField(wireName: r'duration_seconds')
  int? get durationSeconds;

  @BuiltValueField(wireName: r'ice_servers')
  BuiltList<IceServer>? get iceServers;

  /// Jeton court (TTL 5 min) pour rejoindre la salle
  @BuiltValueField(wireName: r'token')
  String? get token;

  TeleSession._();

  factory TeleSession([void updates(TeleSessionBuilder b)]) = _$TeleSession;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TeleSessionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TeleSession> get serializer => _$TeleSessionSerializer();
}

class _$TeleSessionSerializer implements PrimitiveSerializer<TeleSession> {
  @override
  final Iterable<Type> types = const [TeleSession, _$TeleSession];

  @override
  final String wireName = r'TeleSession';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TeleSession object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.appointmentId != null) {
      yield r'appointment_id';
      yield serializers.serialize(
        object.appointmentId,
        specifiedType: const FullType(String),
      );
    }
    if (object.roomId != null) {
      yield r'room_id';
      yield serializers.serialize(
        object.roomId,
        specifiedType: const FullType(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(TeleSessionStatusEnum),
      );
    }
    if (object.startedAt != null) {
      yield r'started_at';
      yield serializers.serialize(
        object.startedAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.endedAt != null) {
      yield r'ended_at';
      yield serializers.serialize(
        object.endedAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.durationSeconds != null) {
      yield r'duration_seconds';
      yield serializers.serialize(
        object.durationSeconds,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.iceServers != null) {
      yield r'ice_servers';
      yield serializers.serialize(
        object.iceServers,
        specifiedType: const FullType(BuiltList, [FullType(IceServer)]),
      );
    }
    if (object.token != null) {
      yield r'token';
      yield serializers.serialize(
        object.token,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TeleSession object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TeleSessionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'appointment_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.appointmentId = valueDes;
          break;
        case r'room_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.roomId = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TeleSessionStatusEnum),
          ) as TeleSessionStatusEnum;
          result.status = valueDes;
          break;
        case r'started_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.startedAt = valueDes;
          break;
        case r'ended_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.endedAt = valueDes;
          break;
        case r'duration_seconds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.durationSeconds = valueDes;
          break;
        case r'ice_servers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(IceServer)]),
          ) as BuiltList<IceServer>;
          result.iceServers.replace(valueDes);
          break;
        case r'token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.token = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TeleSession deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TeleSessionBuilder();
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

class TeleSessionStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'scheduled')
  static const TeleSessionStatusEnum scheduled = _$teleSessionStatusEnum_scheduled;
  @BuiltValueEnumConst(wireName: r'ready')
  static const TeleSessionStatusEnum ready = _$teleSessionStatusEnum_ready;
  @BuiltValueEnumConst(wireName: r'in_progress')
  static const TeleSessionStatusEnum inProgress = _$teleSessionStatusEnum_inProgress;
  @BuiltValueEnumConst(wireName: r'ended')
  static const TeleSessionStatusEnum ended = _$teleSessionStatusEnum_ended;

  static Serializer<TeleSessionStatusEnum> get serializer => _$teleSessionStatusEnumSerializer;

  const TeleSessionStatusEnum._(String name): super(name);

  static BuiltSet<TeleSessionStatusEnum> get values => _$teleSessionStatusEnumValues;
  static TeleSessionStatusEnum valueOf(String name) => _$teleSessionStatusEnumValueOf(name);
}

