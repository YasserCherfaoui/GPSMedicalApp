//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'patient_update_insurance.g.dart';

/// PatientUpdateInsurance
///
/// Properties:
/// * [provider] 
/// * [number] 
@BuiltValue()
abstract class PatientUpdateInsurance implements Built<PatientUpdateInsurance, PatientUpdateInsuranceBuilder> {
  @BuiltValueField(wireName: r'provider')
  PatientUpdateInsuranceProviderEnum? get provider;
  // enum providerEnum {  cnas,  casnos,  none,  private,  };

  @BuiltValueField(wireName: r'number')
  String? get number;

  PatientUpdateInsurance._();

  factory PatientUpdateInsurance([void updates(PatientUpdateInsuranceBuilder b)]) = _$PatientUpdateInsurance;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PatientUpdateInsuranceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PatientUpdateInsurance> get serializer => _$PatientUpdateInsuranceSerializer();
}

class _$PatientUpdateInsuranceSerializer implements PrimitiveSerializer<PatientUpdateInsurance> {
  @override
  final Iterable<Type> types = const [PatientUpdateInsurance, _$PatientUpdateInsurance];

  @override
  final String wireName = r'PatientUpdateInsurance';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PatientUpdateInsurance object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.provider != null) {
      yield r'provider';
      yield serializers.serialize(
        object.provider,
        specifiedType: const FullType(PatientUpdateInsuranceProviderEnum),
      );
    }
    if (object.number != null) {
      yield r'number';
      yield serializers.serialize(
        object.number,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PatientUpdateInsurance object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PatientUpdateInsuranceBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'provider':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PatientUpdateInsuranceProviderEnum),
          ) as PatientUpdateInsuranceProviderEnum;
          result.provider = valueDes;
          break;
        case r'number':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.number = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PatientUpdateInsurance deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PatientUpdateInsuranceBuilder();
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

class PatientUpdateInsuranceProviderEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'cnas')
  static const PatientUpdateInsuranceProviderEnum cnas = _$patientUpdateInsuranceProviderEnum_cnas;
  @BuiltValueEnumConst(wireName: r'casnos')
  static const PatientUpdateInsuranceProviderEnum casnos = _$patientUpdateInsuranceProviderEnum_casnos;
  @BuiltValueEnumConst(wireName: r'none')
  static const PatientUpdateInsuranceProviderEnum none = _$patientUpdateInsuranceProviderEnum_none;
  @BuiltValueEnumConst(wireName: r'private')
  static const PatientUpdateInsuranceProviderEnum private = _$patientUpdateInsuranceProviderEnum_private;

  static Serializer<PatientUpdateInsuranceProviderEnum> get serializer => _$patientUpdateInsuranceProviderEnumSerializer;

  const PatientUpdateInsuranceProviderEnum._(String name): super(name);

  static BuiltSet<PatientUpdateInsuranceProviderEnum> get values => _$patientUpdateInsuranceProviderEnumValues;
  static PatientUpdateInsuranceProviderEnum valueOf(String name) => _$patientUpdateInsuranceProviderEnumValueOf(name);
}

