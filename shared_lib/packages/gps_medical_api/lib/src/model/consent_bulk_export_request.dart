//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'consent_bulk_export_request.g.dart';

/// ConsentBulkExportRequest
///
/// Properties:
/// * [from] 
/// * [to] 
/// * [purpose] 
/// * [country] 
/// * [userIds] 
@BuiltValue()
abstract class ConsentBulkExportRequest implements Built<ConsentBulkExportRequest, ConsentBulkExportRequestBuilder> {
  @BuiltValueField(wireName: r'from')
  DateTime? get from;

  @BuiltValueField(wireName: r'to')
  DateTime? get to;

  @BuiltValueField(wireName: r'purpose')
  ConsentBulkExportRequestPurposeEnum? get purpose;
  // enum purposeEnum {  data_processing,  health_data,  anpdp_terms,  marketing,  };

  @BuiltValueField(wireName: r'country')
  ConsentBulkExportRequestCountryEnum? get country;
  // enum countryEnum {  DZ,  TN,  };

  @BuiltValueField(wireName: r'user_ids')
  BuiltList<String>? get userIds;

  ConsentBulkExportRequest._();

  factory ConsentBulkExportRequest([void updates(ConsentBulkExportRequestBuilder b)]) = _$ConsentBulkExportRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConsentBulkExportRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConsentBulkExportRequest> get serializer => _$ConsentBulkExportRequestSerializer();
}

class _$ConsentBulkExportRequestSerializer implements PrimitiveSerializer<ConsentBulkExportRequest> {
  @override
  final Iterable<Type> types = const [ConsentBulkExportRequest, _$ConsentBulkExportRequest];

  @override
  final String wireName = r'ConsentBulkExportRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConsentBulkExportRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.from != null) {
      yield r'from';
      yield serializers.serialize(
        object.from,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.to != null) {
      yield r'to';
      yield serializers.serialize(
        object.to,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.purpose != null) {
      yield r'purpose';
      yield serializers.serialize(
        object.purpose,
        specifiedType: const FullType(ConsentBulkExportRequestPurposeEnum),
      );
    }
    if (object.country != null) {
      yield r'country';
      yield serializers.serialize(
        object.country,
        specifiedType: const FullType(ConsentBulkExportRequestCountryEnum),
      );
    }
    if (object.userIds != null) {
      yield r'user_ids';
      yield serializers.serialize(
        object.userIds,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConsentBulkExportRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConsentBulkExportRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'from':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.from = valueDes;
          break;
        case r'to':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.to = valueDes;
          break;
        case r'purpose':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConsentBulkExportRequestPurposeEnum),
          ) as ConsentBulkExportRequestPurposeEnum;
          result.purpose = valueDes;
          break;
        case r'country':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConsentBulkExportRequestCountryEnum),
          ) as ConsentBulkExportRequestCountryEnum;
          result.country = valueDes;
          break;
        case r'user_ids':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.userIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConsentBulkExportRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConsentBulkExportRequestBuilder();
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

class ConsentBulkExportRequestPurposeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'data_processing')
  static const ConsentBulkExportRequestPurposeEnum dataProcessing = _$consentBulkExportRequestPurposeEnum_dataProcessing;
  @BuiltValueEnumConst(wireName: r'health_data')
  static const ConsentBulkExportRequestPurposeEnum healthData = _$consentBulkExportRequestPurposeEnum_healthData;
  @BuiltValueEnumConst(wireName: r'anpdp_terms')
  static const ConsentBulkExportRequestPurposeEnum anpdpTerms = _$consentBulkExportRequestPurposeEnum_anpdpTerms;
  @BuiltValueEnumConst(wireName: r'marketing')
  static const ConsentBulkExportRequestPurposeEnum marketing = _$consentBulkExportRequestPurposeEnum_marketing;

  static Serializer<ConsentBulkExportRequestPurposeEnum> get serializer => _$consentBulkExportRequestPurposeEnumSerializer;

  const ConsentBulkExportRequestPurposeEnum._(String name): super(name);

  static BuiltSet<ConsentBulkExportRequestPurposeEnum> get values => _$consentBulkExportRequestPurposeEnumValues;
  static ConsentBulkExportRequestPurposeEnum valueOf(String name) => _$consentBulkExportRequestPurposeEnumValueOf(name);
}

class ConsentBulkExportRequestCountryEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'DZ')
  static const ConsentBulkExportRequestCountryEnum DZ = _$consentBulkExportRequestCountryEnum_DZ;
  @BuiltValueEnumConst(wireName: r'TN')
  static const ConsentBulkExportRequestCountryEnum TN = _$consentBulkExportRequestCountryEnum_TN;

  static Serializer<ConsentBulkExportRequestCountryEnum> get serializer => _$consentBulkExportRequestCountryEnumSerializer;

  const ConsentBulkExportRequestCountryEnum._(String name): super(name);

  static BuiltSet<ConsentBulkExportRequestCountryEnum> get values => _$consentBulkExportRequestCountryEnumValues;
  static ConsentBulkExportRequestCountryEnum valueOf(String name) => _$consentBulkExportRequestCountryEnumValueOf(name);
}

