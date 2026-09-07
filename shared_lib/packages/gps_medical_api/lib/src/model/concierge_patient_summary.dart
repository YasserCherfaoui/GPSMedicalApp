//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/country_code.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'concierge_patient_summary.g.dart';

/// ConciergePatientSummary
///
/// Properties:
/// * [userId] 
/// * [fullName] 
/// * [country] 
@BuiltValue()
abstract class ConciergePatientSummary implements Built<ConciergePatientSummary, ConciergePatientSummaryBuilder> {
  @BuiltValueField(wireName: r'user_id')
  String get userId;

  @BuiltValueField(wireName: r'full_name')
  String get fullName;

  @BuiltValueField(wireName: r'country')
  CountryCode? get country;
  // enum countryEnum {  DZ,  TN,  AT,  BE,  BG,  HR,  CY,  CZ,  DK,  EE,  FI,  FR,  DE,  GR,  HU,  IE,  IT,  LV,  LT,  LU,  MT,  NL,  PL,  PT,  RO,  SK,  SI,  ES,  SE,  };

  ConciergePatientSummary._();

  factory ConciergePatientSummary([void updates(ConciergePatientSummaryBuilder b)]) = _$ConciergePatientSummary;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConciergePatientSummaryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConciergePatientSummary> get serializer => _$ConciergePatientSummarySerializer();
}

class _$ConciergePatientSummarySerializer implements PrimitiveSerializer<ConciergePatientSummary> {
  @override
  final Iterable<Type> types = const [ConciergePatientSummary, _$ConciergePatientSummary];

  @override
  final String wireName = r'ConciergePatientSummary';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConciergePatientSummary object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(String),
    );
    yield r'full_name';
    yield serializers.serialize(
      object.fullName,
      specifiedType: const FullType(String),
    );
    if (object.country != null) {
      yield r'country';
      yield serializers.serialize(
        object.country,
        specifiedType: const FullType(CountryCode),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConciergePatientSummary object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConciergePatientSummaryBuilder result,
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
        case r'full_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
          break;
        case r'country':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CountryCode),
          ) as CountryCode;
          result.country = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConciergePatientSummary deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConciergePatientSummaryBuilder();
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

