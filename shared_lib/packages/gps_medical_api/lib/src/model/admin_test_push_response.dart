//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/admin_test_push_device_result.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_test_push_response.g.dart';

/// AdminTestPushResponse
///
/// Properties:
/// * [userId] 
/// * [deviceCount] 
/// * [sent] 
/// * [failed] 
/// * [results] 
@BuiltValue()
abstract class AdminTestPushResponse implements Built<AdminTestPushResponse, AdminTestPushResponseBuilder> {
  @BuiltValueField(wireName: r'user_id')
  String get userId;

  @BuiltValueField(wireName: r'device_count')
  int get deviceCount;

  @BuiltValueField(wireName: r'sent')
  int get sent;

  @BuiltValueField(wireName: r'failed')
  int get failed;

  @BuiltValueField(wireName: r'results')
  BuiltList<AdminTestPushDeviceResult> get results;

  AdminTestPushResponse._();

  factory AdminTestPushResponse([void updates(AdminTestPushResponseBuilder b)]) = _$AdminTestPushResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminTestPushResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminTestPushResponse> get serializer => _$AdminTestPushResponseSerializer();
}

class _$AdminTestPushResponseSerializer implements PrimitiveSerializer<AdminTestPushResponse> {
  @override
  final Iterable<Type> types = const [AdminTestPushResponse, _$AdminTestPushResponse];

  @override
  final String wireName = r'AdminTestPushResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminTestPushResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(String),
    );
    yield r'device_count';
    yield serializers.serialize(
      object.deviceCount,
      specifiedType: const FullType(int),
    );
    yield r'sent';
    yield serializers.serialize(
      object.sent,
      specifiedType: const FullType(int),
    );
    yield r'failed';
    yield serializers.serialize(
      object.failed,
      specifiedType: const FullType(int),
    );
    yield r'results';
    yield serializers.serialize(
      object.results,
      specifiedType: const FullType(BuiltList, [FullType(AdminTestPushDeviceResult)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminTestPushResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminTestPushResponseBuilder result,
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
        case r'device_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.deviceCount = valueDes;
          break;
        case r'sent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sent = valueDes;
          break;
        case r'failed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.failed = valueDes;
          break;
        case r'results':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AdminTestPushDeviceResult)]),
          ) as BuiltList<AdminTestPushDeviceResult>;
          result.results.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminTestPushResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminTestPushResponseBuilder();
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

