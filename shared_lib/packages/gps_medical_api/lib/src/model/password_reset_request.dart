//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'password_reset_request.g.dart';

/// PasswordResetRequest
///
/// Properties:
/// * [phone] - Numéro algérien au format E.164
/// * [code]
/// * [newPassword]
@BuiltValue()
abstract class PasswordResetRequest
    implements Built<PasswordResetRequest, PasswordResetRequestBuilder> {
  /// Numéro algérien au format E.164
  @BuiltValueField(wireName: r'phone')
  String get phone;

  @BuiltValueField(wireName: r'code')
  String get code;

  @BuiltValueField(wireName: r'new_password')
  String get newPassword;

  PasswordResetRequest._();

  factory PasswordResetRequest([void updates(PasswordResetRequestBuilder b)]) =
      _$PasswordResetRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PasswordResetRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PasswordResetRequest> get serializer =>
      _$PasswordResetRequestSerializer();
}

class _$PasswordResetRequestSerializer
    implements PrimitiveSerializer<PasswordResetRequest> {
  @override
  final Iterable<Type> types = const [
    PasswordResetRequest,
    _$PasswordResetRequest,
  ];

  @override
  final String wireName = r'PasswordResetRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PasswordResetRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'phone';
    yield serializers.serialize(
      object.phone,
      specifiedType: const FullType(String),
    );
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'new_password';
    yield serializers.serialize(
      object.newPassword,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PasswordResetRequest object, {
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
    required PasswordResetRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'phone':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.phone = valueDes;
          break;
        case r'code':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.code = valueDes;
          break;
        case r'new_password':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.newPassword = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PasswordResetRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PasswordResetRequestBuilder();
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
