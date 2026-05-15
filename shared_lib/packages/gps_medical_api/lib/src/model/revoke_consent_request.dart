//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'revoke_consent_request.g.dart';

/// RevokeConsentRequest
///
/// Properties:
/// * [consentType]
@BuiltValue()
abstract class RevokeConsentRequest
    implements Built<RevokeConsentRequest, RevokeConsentRequestBuilder> {
  @BuiltValueField(wireName: r'consent_type')
  RevokeConsentRequestConsentTypeEnum get consentType;
  // enum consentTypeEnum {  data_processing,  health_data,  anpdp_terms,  marketing,  };

  RevokeConsentRequest._();

  factory RevokeConsentRequest([void updates(RevokeConsentRequestBuilder b)]) =
      _$RevokeConsentRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RevokeConsentRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RevokeConsentRequest> get serializer =>
      _$RevokeConsentRequestSerializer();
}

class _$RevokeConsentRequestSerializer
    implements PrimitiveSerializer<RevokeConsentRequest> {
  @override
  final Iterable<Type> types = const [
    RevokeConsentRequest,
    _$RevokeConsentRequest,
  ];

  @override
  final String wireName = r'RevokeConsentRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RevokeConsentRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'consent_type';
    yield serializers.serialize(
      object.consentType,
      specifiedType: const FullType(RevokeConsentRequestConsentTypeEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RevokeConsentRequest object, {
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
    required RevokeConsentRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'consent_type':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      RevokeConsentRequestConsentTypeEnum,
                    ),
                  )
                  as RevokeConsentRequestConsentTypeEnum;
          result.consentType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RevokeConsentRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RevokeConsentRequestBuilder();
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

class RevokeConsentRequestConsentTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'data_processing')
  static const RevokeConsentRequestConsentTypeEnum dataProcessing =
      _$revokeConsentRequestConsentTypeEnum_dataProcessing;
  @BuiltValueEnumConst(wireName: r'health_data')
  static const RevokeConsentRequestConsentTypeEnum healthData =
      _$revokeConsentRequestConsentTypeEnum_healthData;
  @BuiltValueEnumConst(wireName: r'anpdp_terms')
  static const RevokeConsentRequestConsentTypeEnum anpdpTerms =
      _$revokeConsentRequestConsentTypeEnum_anpdpTerms;
  @BuiltValueEnumConst(wireName: r'marketing')
  static const RevokeConsentRequestConsentTypeEnum marketing =
      _$revokeConsentRequestConsentTypeEnum_marketing;

  static Serializer<RevokeConsentRequestConsentTypeEnum> get serializer =>
      _$revokeConsentRequestConsentTypeEnumSerializer;

  const RevokeConsentRequestConsentTypeEnum._(String name) : super(name);

  static BuiltSet<RevokeConsentRequestConsentTypeEnum> get values =>
      _$revokeConsentRequestConsentTypeEnumValues;
  static RevokeConsentRequestConsentTypeEnum valueOf(String name) =>
      _$revokeConsentRequestConsentTypeEnumValueOf(name);
}
