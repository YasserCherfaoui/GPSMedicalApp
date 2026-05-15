//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'consent_grant.g.dart';

/// ConsentGrant
///
/// Properties:
/// * [id]
/// * [userId]
/// * [consentType]
/// * [version]
/// * [grantedAt]
/// * [revokedAt]
/// * [ipAddress]
/// * [userAgent]
@BuiltValue()
abstract class ConsentGrant
    implements Built<ConsentGrant, ConsentGrantBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'user_id')
  String get userId;

  @BuiltValueField(wireName: r'consent_type')
  ConsentGrantConsentTypeEnum get consentType;
  // enum consentTypeEnum {  data_processing,  health_data,  anpdp_terms,  marketing,  };

  @BuiltValueField(wireName: r'version')
  String get version;

  @BuiltValueField(wireName: r'granted_at')
  DateTime get grantedAt;

  @BuiltValueField(wireName: r'revoked_at')
  DateTime? get revokedAt;

  @BuiltValueField(wireName: r'ip_address')
  String? get ipAddress;

  @BuiltValueField(wireName: r'user_agent')
  String? get userAgent;

  ConsentGrant._();

  factory ConsentGrant([void updates(ConsentGrantBuilder b)]) = _$ConsentGrant;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConsentGrantBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConsentGrant> get serializer => _$ConsentGrantSerializer();
}

class _$ConsentGrantSerializer implements PrimitiveSerializer<ConsentGrant> {
  @override
  final Iterable<Type> types = const [ConsentGrant, _$ConsentGrant];

  @override
  final String wireName = r'ConsentGrant';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConsentGrant object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(String),
    );
    yield r'consent_type';
    yield serializers.serialize(
      object.consentType,
      specifiedType: const FullType(ConsentGrantConsentTypeEnum),
    );
    yield r'version';
    yield serializers.serialize(
      object.version,
      specifiedType: const FullType(String),
    );
    yield r'granted_at';
    yield serializers.serialize(
      object.grantedAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.revokedAt != null) {
      yield r'revoked_at';
      yield serializers.serialize(
        object.revokedAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.ipAddress != null) {
      yield r'ip_address';
      yield serializers.serialize(
        object.ipAddress,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.userAgent != null) {
      yield r'user_agent';
      yield serializers.serialize(
        object.userAgent,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConsentGrant object, {
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
    required ConsentGrantBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.id = valueDes;
          break;
        case r'user_id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.userId = valueDes;
          break;
        case r'consent_type':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(ConsentGrantConsentTypeEnum),
                  )
                  as ConsentGrantConsentTypeEnum;
          result.consentType = valueDes;
          break;
        case r'version':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.version = valueDes;
          break;
        case r'granted_at':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DateTime),
                  )
                  as DateTime;
          result.grantedAt = valueDes;
          break;
        case r'revoked_at':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(DateTime),
                  )
                  as DateTime?;
          if (valueDes == null) continue;
          result.revokedAt = valueDes;
          break;
        case r'ip_address':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.ipAddress = valueDes;
          break;
        case r'user_agent':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.userAgent = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConsentGrant deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConsentGrantBuilder();
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

class ConsentGrantConsentTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'data_processing')
  static const ConsentGrantConsentTypeEnum dataProcessing =
      _$consentGrantConsentTypeEnum_dataProcessing;
  @BuiltValueEnumConst(wireName: r'health_data')
  static const ConsentGrantConsentTypeEnum healthData =
      _$consentGrantConsentTypeEnum_healthData;
  @BuiltValueEnumConst(wireName: r'anpdp_terms')
  static const ConsentGrantConsentTypeEnum anpdpTerms =
      _$consentGrantConsentTypeEnum_anpdpTerms;
  @BuiltValueEnumConst(wireName: r'marketing')
  static const ConsentGrantConsentTypeEnum marketing =
      _$consentGrantConsentTypeEnum_marketing;

  static Serializer<ConsentGrantConsentTypeEnum> get serializer =>
      _$consentGrantConsentTypeEnumSerializer;

  const ConsentGrantConsentTypeEnum._(String name) : super(name);

  static BuiltSet<ConsentGrantConsentTypeEnum> get values =>
      _$consentGrantConsentTypeEnumValues;
  static ConsentGrantConsentTypeEnum valueOf(String name) =>
      _$consentGrantConsentTypeEnumValueOf(name);
}
