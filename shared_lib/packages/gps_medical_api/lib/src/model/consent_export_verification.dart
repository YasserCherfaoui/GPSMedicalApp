//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'consent_export_verification.g.dart';

/// ConsentExportVerification
///
/// Properties:
/// * [algorithm] 
/// * [publicKey] - Clé publique Ed25519 (base64, 32 octets)
/// * [signedOver] 
/// * [verificationDocPath] 
@BuiltValue()
abstract class ConsentExportVerification implements Built<ConsentExportVerification, ConsentExportVerificationBuilder> {
  @BuiltValueField(wireName: r'algorithm')
  ConsentExportVerificationAlgorithmEnum get algorithm;
  // enum algorithmEnum {  Ed25519,  };

  /// Clé publique Ed25519 (base64, 32 octets)
  @BuiltValueField(wireName: r'public_key')
  String get publicKey;

  @BuiltValueField(wireName: r'signed_over')
  ConsentExportVerificationSignedOverEnum get signedOver;
  // enum signedOverEnum {  payload,  };

  @BuiltValueField(wireName: r'verification_doc_path')
  String get verificationDocPath;

  ConsentExportVerification._();

  factory ConsentExportVerification([void updates(ConsentExportVerificationBuilder b)]) = _$ConsentExportVerification;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConsentExportVerificationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConsentExportVerification> get serializer => _$ConsentExportVerificationSerializer();
}

class _$ConsentExportVerificationSerializer implements PrimitiveSerializer<ConsentExportVerification> {
  @override
  final Iterable<Type> types = const [ConsentExportVerification, _$ConsentExportVerification];

  @override
  final String wireName = r'ConsentExportVerification';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConsentExportVerification object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'algorithm';
    yield serializers.serialize(
      object.algorithm,
      specifiedType: const FullType(ConsentExportVerificationAlgorithmEnum),
    );
    yield r'public_key';
    yield serializers.serialize(
      object.publicKey,
      specifiedType: const FullType(String),
    );
    yield r'signed_over';
    yield serializers.serialize(
      object.signedOver,
      specifiedType: const FullType(ConsentExportVerificationSignedOverEnum),
    );
    yield r'verification_doc_path';
    yield serializers.serialize(
      object.verificationDocPath,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConsentExportVerification object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConsentExportVerificationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'algorithm':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConsentExportVerificationAlgorithmEnum),
          ) as ConsentExportVerificationAlgorithmEnum;
          result.algorithm = valueDes;
          break;
        case r'public_key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.publicKey = valueDes;
          break;
        case r'signed_over':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConsentExportVerificationSignedOverEnum),
          ) as ConsentExportVerificationSignedOverEnum;
          result.signedOver = valueDes;
          break;
        case r'verification_doc_path':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.verificationDocPath = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConsentExportVerification deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConsentExportVerificationBuilder();
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

class ConsentExportVerificationAlgorithmEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Ed25519')
  static const ConsentExportVerificationAlgorithmEnum ed25519 = _$consentExportVerificationAlgorithmEnum_ed25519;

  static Serializer<ConsentExportVerificationAlgorithmEnum> get serializer => _$consentExportVerificationAlgorithmEnumSerializer;

  const ConsentExportVerificationAlgorithmEnum._(String name): super(name);

  static BuiltSet<ConsentExportVerificationAlgorithmEnum> get values => _$consentExportVerificationAlgorithmEnumValues;
  static ConsentExportVerificationAlgorithmEnum valueOf(String name) => _$consentExportVerificationAlgorithmEnumValueOf(name);
}

class ConsentExportVerificationSignedOverEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'payload')
  static const ConsentExportVerificationSignedOverEnum payload = _$consentExportVerificationSignedOverEnum_payload;

  static Serializer<ConsentExportVerificationSignedOverEnum> get serializer => _$consentExportVerificationSignedOverEnumSerializer;

  const ConsentExportVerificationSignedOverEnum._(String name): super(name);

  static BuiltSet<ConsentExportVerificationSignedOverEnum> get values => _$consentExportVerificationSignedOverEnumValues;
  static ConsentExportVerificationSignedOverEnum valueOf(String name) => _$consentExportVerificationSignedOverEnumValueOf(name);
}

