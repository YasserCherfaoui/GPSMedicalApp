//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_registration.g.dart';

/// DeviceRegistration
///
/// Properties:
/// * [fcmToken]
/// * [platform]
/// * [deviceModel]
/// * [appVersion]
@BuiltValue()
abstract class DeviceRegistration
    implements Built<DeviceRegistration, DeviceRegistrationBuilder> {
  @BuiltValueField(wireName: r'fcm_token')
  String get fcmToken;

  @BuiltValueField(wireName: r'platform')
  DeviceRegistrationPlatformEnum get platform;
  // enum platformEnum {  ios,  android,  web,  };

  @BuiltValueField(wireName: r'device_model')
  String? get deviceModel;

  @BuiltValueField(wireName: r'app_version')
  String? get appVersion;

  DeviceRegistration._();

  factory DeviceRegistration([void updates(DeviceRegistrationBuilder b)]) =
      _$DeviceRegistration;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeviceRegistrationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeviceRegistration> get serializer =>
      _$DeviceRegistrationSerializer();
}

class _$DeviceRegistrationSerializer
    implements PrimitiveSerializer<DeviceRegistration> {
  @override
  final Iterable<Type> types = const [DeviceRegistration, _$DeviceRegistration];

  @override
  final String wireName = r'DeviceRegistration';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeviceRegistration object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'fcm_token';
    yield serializers.serialize(
      object.fcmToken,
      specifiedType: const FullType(String),
    );
    yield r'platform';
    yield serializers.serialize(
      object.platform,
      specifiedType: const FullType(DeviceRegistrationPlatformEnum),
    );
    if (object.deviceModel != null) {
      yield r'device_model';
      yield serializers.serialize(
        object.deviceModel,
        specifiedType: const FullType(String),
      );
    }
    if (object.appVersion != null) {
      yield r'app_version';
      yield serializers.serialize(
        object.appVersion,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DeviceRegistration object, {
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
    required DeviceRegistrationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'fcm_token':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.fcmToken = valueDes;
          break;
        case r'platform':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      DeviceRegistrationPlatformEnum,
                    ),
                  )
                  as DeviceRegistrationPlatformEnum;
          result.platform = valueDes;
          break;
        case r'device_model':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.deviceModel = valueDes;
          break;
        case r'app_version':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.appVersion = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeviceRegistration deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeviceRegistrationBuilder();
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

class DeviceRegistrationPlatformEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'ios')
  static const DeviceRegistrationPlatformEnum ios =
      _$deviceRegistrationPlatformEnum_ios;
  @BuiltValueEnumConst(wireName: r'android')
  static const DeviceRegistrationPlatformEnum android =
      _$deviceRegistrationPlatformEnum_android;
  @BuiltValueEnumConst(wireName: r'web')
  static const DeviceRegistrationPlatformEnum web =
      _$deviceRegistrationPlatformEnum_web;

  static Serializer<DeviceRegistrationPlatformEnum> get serializer =>
      _$deviceRegistrationPlatformEnumSerializer;

  const DeviceRegistrationPlatformEnum._(String name) : super(name);

  static BuiltSet<DeviceRegistrationPlatformEnum> get values =>
      _$deviceRegistrationPlatformEnumValues;
  static DeviceRegistrationPlatformEnum valueOf(String name) =>
      _$deviceRegistrationPlatformEnumValueOf(name);
}
