//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_test_push_request.g.dart';

/// AdminTestPushRequest
///
/// Properties:
/// * [userId] 
/// * [title] 
/// * [body] 
/// * [data] - Données FCM (clés/valeurs string) fusionnées avec `source=admin_test`
@BuiltValue()
abstract class AdminTestPushRequest implements Built<AdminTestPushRequest, AdminTestPushRequestBuilder> {
  @BuiltValueField(wireName: r'user_id')
  String get userId;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'body')
  String? get body;

  /// Données FCM (clés/valeurs string) fusionnées avec `source=admin_test`
  @BuiltValueField(wireName: r'data')
  BuiltMap<String, String>? get data;

  AdminTestPushRequest._();

  factory AdminTestPushRequest([void updates(AdminTestPushRequestBuilder b)]) = _$AdminTestPushRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminTestPushRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminTestPushRequest> get serializer => _$AdminTestPushRequestSerializer();
}

class _$AdminTestPushRequestSerializer implements PrimitiveSerializer<AdminTestPushRequest> {
  @override
  final Iterable<Type> types = const [AdminTestPushRequest, _$AdminTestPushRequest];

  @override
  final String wireName = r'AdminTestPushRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminTestPushRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(String),
    );
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.body != null) {
      yield r'body';
      yield serializers.serialize(
        object.body,
        specifiedType: const FullType(String),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminTestPushRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminTestPushRequestBuilder result,
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
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'body':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.body = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]),
          ) as BuiltMap<String, String>;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminTestPushRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminTestPushRequestBuilder();
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

