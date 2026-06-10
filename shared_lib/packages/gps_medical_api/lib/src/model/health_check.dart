//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'health_check.g.dart';

/// HealthCheck
///
/// Properties:
/// * [status] 
/// * [db] - `ok` si PostgreSQL répond au ping, sinon `error`
/// * [redis] 
/// * [storage] - `disabled` si le stockage objet n'est pas configuré (`STORAGE_PROVIDER` vide ou `disabled`) ; `ok` si le bucket répond ; `error` en cas d'échec de sonde. 
@BuiltValue()
abstract class HealthCheck implements Built<HealthCheck, HealthCheckBuilder> {
  @BuiltValueField(wireName: r'status')
  HealthCheckStatusEnum get status;
  // enum statusEnum {  ok,  degraded,  };

  /// `ok` si PostgreSQL répond au ping, sinon `error`
  @BuiltValueField(wireName: r'db')
  HealthCheckDbEnum get db;
  // enum dbEnum {  ok,  error,  };

  @BuiltValueField(wireName: r'redis')
  HealthCheckRedisEnum get redis;
  // enum redisEnum {  ok,  error,  };

  /// `disabled` si le stockage objet n'est pas configuré (`STORAGE_PROVIDER` vide ou `disabled`) ; `ok` si le bucket répond ; `error` en cas d'échec de sonde. 
  @BuiltValueField(wireName: r'storage')
  HealthCheckStorageEnum get storage;
  // enum storageEnum {  ok,  error,  disabled,  };

  HealthCheck._();

  factory HealthCheck([void updates(HealthCheckBuilder b)]) = _$HealthCheck;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HealthCheckBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HealthCheck> get serializer => _$HealthCheckSerializer();
}

class _$HealthCheckSerializer implements PrimitiveSerializer<HealthCheck> {
  @override
  final Iterable<Type> types = const [HealthCheck, _$HealthCheck];

  @override
  final String wireName = r'HealthCheck';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HealthCheck object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(HealthCheckStatusEnum),
    );
    yield r'db';
    yield serializers.serialize(
      object.db,
      specifiedType: const FullType(HealthCheckDbEnum),
    );
    yield r'redis';
    yield serializers.serialize(
      object.redis,
      specifiedType: const FullType(HealthCheckRedisEnum),
    );
    yield r'storage';
    yield serializers.serialize(
      object.storage,
      specifiedType: const FullType(HealthCheckStorageEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    HealthCheck object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required HealthCheckBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HealthCheckStatusEnum),
          ) as HealthCheckStatusEnum;
          result.status = valueDes;
          break;
        case r'db':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HealthCheckDbEnum),
          ) as HealthCheckDbEnum;
          result.db = valueDes;
          break;
        case r'redis':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HealthCheckRedisEnum),
          ) as HealthCheckRedisEnum;
          result.redis = valueDes;
          break;
        case r'storage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(HealthCheckStorageEnum),
          ) as HealthCheckStorageEnum;
          result.storage = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  HealthCheck deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HealthCheckBuilder();
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

class HealthCheckStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'ok')
  static const HealthCheckStatusEnum ok = _$healthCheckStatusEnum_ok;
  @BuiltValueEnumConst(wireName: r'degraded')
  static const HealthCheckStatusEnum degraded = _$healthCheckStatusEnum_degraded;

  static Serializer<HealthCheckStatusEnum> get serializer => _$healthCheckStatusEnumSerializer;

  const HealthCheckStatusEnum._(String name): super(name);

  static BuiltSet<HealthCheckStatusEnum> get values => _$healthCheckStatusEnumValues;
  static HealthCheckStatusEnum valueOf(String name) => _$healthCheckStatusEnumValueOf(name);
}

class HealthCheckDbEnum extends EnumClass {

  /// `ok` si PostgreSQL répond au ping, sinon `error`
  @BuiltValueEnumConst(wireName: r'ok')
  static const HealthCheckDbEnum ok = _$healthCheckDbEnum_ok;
  /// `ok` si PostgreSQL répond au ping, sinon `error`
  @BuiltValueEnumConst(wireName: r'error')
  static const HealthCheckDbEnum error = _$healthCheckDbEnum_error;

  static Serializer<HealthCheckDbEnum> get serializer => _$healthCheckDbEnumSerializer;

  const HealthCheckDbEnum._(String name): super(name);

  static BuiltSet<HealthCheckDbEnum> get values => _$healthCheckDbEnumValues;
  static HealthCheckDbEnum valueOf(String name) => _$healthCheckDbEnumValueOf(name);
}

class HealthCheckRedisEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'ok')
  static const HealthCheckRedisEnum ok = _$healthCheckRedisEnum_ok;
  @BuiltValueEnumConst(wireName: r'error')
  static const HealthCheckRedisEnum error = _$healthCheckRedisEnum_error;

  static Serializer<HealthCheckRedisEnum> get serializer => _$healthCheckRedisEnumSerializer;

  const HealthCheckRedisEnum._(String name): super(name);

  static BuiltSet<HealthCheckRedisEnum> get values => _$healthCheckRedisEnumValues;
  static HealthCheckRedisEnum valueOf(String name) => _$healthCheckRedisEnumValueOf(name);
}

class HealthCheckStorageEnum extends EnumClass {

  /// `disabled` si le stockage objet n'est pas configuré (`STORAGE_PROVIDER` vide ou `disabled`) ; `ok` si le bucket répond ; `error` en cas d'échec de sonde. 
  @BuiltValueEnumConst(wireName: r'ok')
  static const HealthCheckStorageEnum ok = _$healthCheckStorageEnum_ok;
  /// `disabled` si le stockage objet n'est pas configuré (`STORAGE_PROVIDER` vide ou `disabled`) ; `ok` si le bucket répond ; `error` en cas d'échec de sonde. 
  @BuiltValueEnumConst(wireName: r'error')
  static const HealthCheckStorageEnum error = _$healthCheckStorageEnum_error;
  /// `disabled` si le stockage objet n'est pas configuré (`STORAGE_PROVIDER` vide ou `disabled`) ; `ok` si le bucket répond ; `error` en cas d'échec de sonde. 
  @BuiltValueEnumConst(wireName: r'disabled')
  static const HealthCheckStorageEnum disabled = _$healthCheckStorageEnum_disabled;

  static Serializer<HealthCheckStorageEnum> get serializer => _$healthCheckStorageEnumSerializer;

  const HealthCheckStorageEnum._(String name): super(name);

  static BuiltSet<HealthCheckStorageEnum> get values => _$healthCheckStorageEnumValues;
  static HealthCheckStorageEnum valueOf(String name) => _$healthCheckStorageEnumValueOf(name);
}

