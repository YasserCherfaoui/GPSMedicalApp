//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/ice_server.dart';
import 'package:gps_medical_api/src/model/turn_credentials.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'teleconsult_lab_join.g.dart';

/// TeleconsultLabJoin
///
/// Properties:
/// * [roomId] 
/// * [peerId] 
/// * [role] 
/// * [peerCount] 
/// * [status] 
/// * [startedAt] 
/// * [iceServers] 
/// * [turn] 
@BuiltValue()
abstract class TeleconsultLabJoin implements Built<TeleconsultLabJoin, TeleconsultLabJoinBuilder> {
  @BuiltValueField(wireName: r'room_id')
  String get roomId;

  @BuiltValueField(wireName: r'peer_id')
  String get peerId;

  @BuiltValueField(wireName: r'role')
  TeleconsultLabJoinRoleEnum get role;
  // enum roleEnum {  offerer,  answerer,  };

  @BuiltValueField(wireName: r'peer_count')
  int get peerCount;

  @BuiltValueField(wireName: r'status')
  TeleconsultLabJoinStatusEnum get status;
  // enum statusEnum {  waiting,  ready,  };

  @BuiltValueField(wireName: r'started_at')
  DateTime get startedAt;

  @BuiltValueField(wireName: r'ice_servers')
  BuiltList<IceServer> get iceServers;

  @BuiltValueField(wireName: r'turn')
  TurnCredentials? get turn;

  TeleconsultLabJoin._();

  factory TeleconsultLabJoin([void updates(TeleconsultLabJoinBuilder b)]) = _$TeleconsultLabJoin;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TeleconsultLabJoinBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TeleconsultLabJoin> get serializer => _$TeleconsultLabJoinSerializer();
}

class _$TeleconsultLabJoinSerializer implements PrimitiveSerializer<TeleconsultLabJoin> {
  @override
  final Iterable<Type> types = const [TeleconsultLabJoin, _$TeleconsultLabJoin];

  @override
  final String wireName = r'TeleconsultLabJoin';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TeleconsultLabJoin object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'room_id';
    yield serializers.serialize(
      object.roomId,
      specifiedType: const FullType(String),
    );
    yield r'peer_id';
    yield serializers.serialize(
      object.peerId,
      specifiedType: const FullType(String),
    );
    yield r'role';
    yield serializers.serialize(
      object.role,
      specifiedType: const FullType(TeleconsultLabJoinRoleEnum),
    );
    yield r'peer_count';
    yield serializers.serialize(
      object.peerCount,
      specifiedType: const FullType(int),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(TeleconsultLabJoinStatusEnum),
    );
    yield r'started_at';
    yield serializers.serialize(
      object.startedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'ice_servers';
    yield serializers.serialize(
      object.iceServers,
      specifiedType: const FullType(BuiltList, [FullType(IceServer)]),
    );
    if (object.turn != null) {
      yield r'turn';
      yield serializers.serialize(
        object.turn,
        specifiedType: const FullType(TurnCredentials),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TeleconsultLabJoin object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TeleconsultLabJoinBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'room_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.roomId = valueDes;
          break;
        case r'peer_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.peerId = valueDes;
          break;
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TeleconsultLabJoinRoleEnum),
          ) as TeleconsultLabJoinRoleEnum;
          result.role = valueDes;
          break;
        case r'peer_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.peerCount = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TeleconsultLabJoinStatusEnum),
          ) as TeleconsultLabJoinStatusEnum;
          result.status = valueDes;
          break;
        case r'started_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startedAt = valueDes;
          break;
        case r'ice_servers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(IceServer)]),
          ) as BuiltList<IceServer>;
          result.iceServers.replace(valueDes);
          break;
        case r'turn':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TurnCredentials),
          ) as TurnCredentials;
          result.turn.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TeleconsultLabJoin deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TeleconsultLabJoinBuilder();
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

class TeleconsultLabJoinRoleEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'offerer')
  static const TeleconsultLabJoinRoleEnum offerer = _$teleconsultLabJoinRoleEnum_offerer;
  @BuiltValueEnumConst(wireName: r'answerer')
  static const TeleconsultLabJoinRoleEnum answerer = _$teleconsultLabJoinRoleEnum_answerer;

  static Serializer<TeleconsultLabJoinRoleEnum> get serializer => _$teleconsultLabJoinRoleEnumSerializer;

  const TeleconsultLabJoinRoleEnum._(String name): super(name);

  static BuiltSet<TeleconsultLabJoinRoleEnum> get values => _$teleconsultLabJoinRoleEnumValues;
  static TeleconsultLabJoinRoleEnum valueOf(String name) => _$teleconsultLabJoinRoleEnumValueOf(name);
}

class TeleconsultLabJoinStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'waiting')
  static const TeleconsultLabJoinStatusEnum waiting = _$teleconsultLabJoinStatusEnum_waiting;
  @BuiltValueEnumConst(wireName: r'ready')
  static const TeleconsultLabJoinStatusEnum ready = _$teleconsultLabJoinStatusEnum_ready;

  static Serializer<TeleconsultLabJoinStatusEnum> get serializer => _$teleconsultLabJoinStatusEnumSerializer;

  const TeleconsultLabJoinStatusEnum._(String name): super(name);

  static BuiltSet<TeleconsultLabJoinStatusEnum> get values => _$teleconsultLabJoinStatusEnumValues;
  static TeleconsultLabJoinStatusEnum valueOf(String name) => _$teleconsultLabJoinStatusEnumValueOf(name);
}

