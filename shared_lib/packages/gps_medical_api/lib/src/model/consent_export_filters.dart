//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'consent_export_filters.g.dart';

/// ConsentExportFilters
///
/// Properties:
/// * [from] 
/// * [to] 
/// * [purpose] 
/// * [country] 
/// * [userIds] 
@BuiltValue()
abstract class ConsentExportFilters implements Built<ConsentExportFilters, ConsentExportFiltersBuilder> {
  @BuiltValueField(wireName: r'from')
  DateTime? get from;

  @BuiltValueField(wireName: r'to')
  DateTime? get to;

  @BuiltValueField(wireName: r'purpose')
  ConsentExportFiltersPurposeEnum? get purpose;
  // enum purposeEnum {  data_processing,  health_data,  anpdp_terms,  marketing,  };

  @BuiltValueField(wireName: r'country')
  ConsentExportFiltersCountryEnum? get country;
  // enum countryEnum {  DZ,  TN,  };

  @BuiltValueField(wireName: r'user_ids')
  BuiltList<String>? get userIds;

  ConsentExportFilters._();

  factory ConsentExportFilters([void updates(ConsentExportFiltersBuilder b)]) = _$ConsentExportFilters;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConsentExportFiltersBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConsentExportFilters> get serializer => _$ConsentExportFiltersSerializer();
}

class _$ConsentExportFiltersSerializer implements PrimitiveSerializer<ConsentExportFilters> {
  @override
  final Iterable<Type> types = const [ConsentExportFilters, _$ConsentExportFilters];

  @override
  final String wireName = r'ConsentExportFilters';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConsentExportFilters object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.from != null) {
      yield r'from';
      yield serializers.serialize(
        object.from,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.to != null) {
      yield r'to';
      yield serializers.serialize(
        object.to,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.purpose != null) {
      yield r'purpose';
      yield serializers.serialize(
        object.purpose,
        specifiedType: const FullType.nullable(ConsentExportFiltersPurposeEnum),
      );
    }
    if (object.country != null) {
      yield r'country';
      yield serializers.serialize(
        object.country,
        specifiedType: const FullType.nullable(ConsentExportFiltersCountryEnum),
      );
    }
    if (object.userIds != null) {
      yield r'user_ids';
      yield serializers.serialize(
        object.userIds,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConsentExportFilters object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConsentExportFiltersBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'from':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.from = valueDes;
          break;
        case r'to':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.to = valueDes;
          break;
        case r'purpose':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ConsentExportFiltersPurposeEnum),
          ) as ConsentExportFiltersPurposeEnum?;
          if (valueDes == null) continue;
          result.purpose = valueDes;
          break;
        case r'country':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ConsentExportFiltersCountryEnum),
          ) as ConsentExportFiltersCountryEnum?;
          if (valueDes == null) continue;
          result.country = valueDes;
          break;
        case r'user_ids':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
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
  ConsentExportFilters deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConsentExportFiltersBuilder();
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

class ConsentExportFiltersPurposeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'data_processing')
  static const ConsentExportFiltersPurposeEnum dataProcessing = _$consentExportFiltersPurposeEnum_dataProcessing;
  @BuiltValueEnumConst(wireName: r'health_data')
  static const ConsentExportFiltersPurposeEnum healthData = _$consentExportFiltersPurposeEnum_healthData;
  @BuiltValueEnumConst(wireName: r'anpdp_terms')
  static const ConsentExportFiltersPurposeEnum anpdpTerms = _$consentExportFiltersPurposeEnum_anpdpTerms;
  @BuiltValueEnumConst(wireName: r'marketing')
  static const ConsentExportFiltersPurposeEnum marketing = _$consentExportFiltersPurposeEnum_marketing;

  static Serializer<ConsentExportFiltersPurposeEnum> get serializer => _$consentExportFiltersPurposeEnumSerializer;

  const ConsentExportFiltersPurposeEnum._(String name): super(name);

  static BuiltSet<ConsentExportFiltersPurposeEnum> get values => _$consentExportFiltersPurposeEnumValues;
  static ConsentExportFiltersPurposeEnum valueOf(String name) => _$consentExportFiltersPurposeEnumValueOf(name);
}

class ConsentExportFiltersCountryEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'DZ')
  static const ConsentExportFiltersCountryEnum DZ = _$consentExportFiltersCountryEnum_DZ;
  @BuiltValueEnumConst(wireName: r'TN')
  static const ConsentExportFiltersCountryEnum TN = _$consentExportFiltersCountryEnum_TN;

  static Serializer<ConsentExportFiltersCountryEnum> get serializer => _$consentExportFiltersCountryEnumSerializer;

  const ConsentExportFiltersCountryEnum._(String name): super(name);

  static BuiltSet<ConsentExportFiltersCountryEnum> get values => _$consentExportFiltersCountryEnumValues;
  static ConsentExportFiltersCountryEnum valueOf(String name) => _$consentExportFiltersCountryEnumValueOf(name);
}

