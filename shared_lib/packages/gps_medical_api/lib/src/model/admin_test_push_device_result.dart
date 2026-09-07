//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_test_push_device_result.g.dart';

/// AdminTestPushDeviceResult
///
/// Properties:
/// * [deviceId] 
/// * [platform] 
/// * [ok] 
/// * [error] 
@BuiltValue()
abstract class AdminTestPushDeviceResult implements Built<AdminTestPushDeviceResult, AdminTestPushDeviceResultBuilder> {
  @BuiltValueField(wireName: r'device_id')
  String get deviceId;

  @BuiltValueField(wireName: r'platform')
  AdminTestPushDeviceResultPlatformEnum get platform;
  // enum platformEnum {  ios,  android,  web,  };

  @BuiltValueField(wireName: r'ok')
  bool get ok;

  @BuiltValueField(wireName: r'error')
  String? get error;

  AdminTestPushDeviceResult._();

  factory AdminTestPushDeviceResult([void updates(AdminTestPushDeviceResultBuilder b)]) = _$AdminTestPushDeviceResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminTestPushDeviceResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminTestPushDeviceResult> get serializer => _$AdminTestPushDeviceResultSerializer();
}

class _$AdminTestPushDeviceResultSerializer implements PrimitiveSerializer<AdminTestPushDeviceResult> {
  @override
  final Iterable<Type> types = const [AdminTestPushDeviceResult, _$AdminTestPushDeviceResult];

  @override
  final String wireName = r'AdminTestPushDeviceResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminTestPushDeviceResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'device_id';
    yield serializers.serialize(
      object.deviceId,
      specifiedType: const FullType(String),
    );
    yield r'platform';
    yield serializers.serialize(
      object.platform,
      specifiedType: const FullType(AdminTestPushDeviceResultPlatformEnum),
    );
    yield r'ok';
    yield serializers.serialize(
      object.ok,
      specifiedType: const FullType(bool),
    );
    if (object.error != null) {
      yield r'error';
      yield serializers.serialize(
        object.error,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminTestPushDeviceResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminTestPushDeviceResultBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'device_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.deviceId = valueDes;
          break;
        case r'platform':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AdminTestPushDeviceResultPlatformEnum),
          ) as AdminTestPushDeviceResultPlatformEnum;
          result.platform = valueDes;
          break;
        case r'ok':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.ok = valueDes;
          break;
        case r'error':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.error = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminTestPushDeviceResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminTestPushDeviceResultBuilder();
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

class AdminTestPushDeviceResultPlatformEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'ios')
  static const AdminTestPushDeviceResultPlatformEnum ios = _$adminTestPushDeviceResultPlatformEnum_ios;
  @BuiltValueEnumConst(wireName: r'android')
  static const AdminTestPushDeviceResultPlatformEnum android = _$adminTestPushDeviceResultPlatformEnum_android;
  @BuiltValueEnumConst(wireName: r'web')
  static const AdminTestPushDeviceResultPlatformEnum web = _$adminTestPushDeviceResultPlatformEnum_web;

  static Serializer<AdminTestPushDeviceResultPlatformEnum> get serializer => _$adminTestPushDeviceResultPlatformEnumSerializer;

  const AdminTestPushDeviceResultPlatformEnum._(String name): super(name);

  static BuiltSet<AdminTestPushDeviceResultPlatformEnum> get values => _$adminTestPushDeviceResultPlatformEnumValues;
  static AdminTestPushDeviceResultPlatformEnum valueOf(String name) => _$adminTestPushDeviceResultPlatformEnumValueOf(name);
}

