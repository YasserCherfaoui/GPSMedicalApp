//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'patient_all_of_insurance.g.dart';

/// PatientAllOfInsurance
///
/// Properties:
/// * [provider]
/// * [number]
@BuiltValue()
abstract class PatientAllOfInsurance
    implements Built<PatientAllOfInsurance, PatientAllOfInsuranceBuilder> {
  @BuiltValueField(wireName: r'provider')
  PatientAllOfInsuranceProviderEnum? get provider;
  // enum providerEnum {  cnas,  casnos,  none,  private,  };

  @BuiltValueField(wireName: r'number')
  String? get number;

  PatientAllOfInsurance._();

  factory PatientAllOfInsurance([
    void updates(PatientAllOfInsuranceBuilder b),
  ]) = _$PatientAllOfInsurance;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PatientAllOfInsuranceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PatientAllOfInsurance> get serializer =>
      _$PatientAllOfInsuranceSerializer();
}

class _$PatientAllOfInsuranceSerializer
    implements PrimitiveSerializer<PatientAllOfInsurance> {
  @override
  final Iterable<Type> types = const [
    PatientAllOfInsurance,
    _$PatientAllOfInsurance,
  ];

  @override
  final String wireName = r'PatientAllOfInsurance';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PatientAllOfInsurance object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.provider != null) {
      yield r'provider';
      yield serializers.serialize(
        object.provider,
        specifiedType: const FullType(PatientAllOfInsuranceProviderEnum),
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
    PatientAllOfInsurance object, {
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
    required PatientAllOfInsuranceBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'provider':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      PatientAllOfInsuranceProviderEnum,
                    ),
                  )
                  as PatientAllOfInsuranceProviderEnum;
          result.provider = valueDes;
          break;
        case r'number':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
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
  PatientAllOfInsurance deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PatientAllOfInsuranceBuilder();
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

class PatientAllOfInsuranceProviderEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'cnas')
  static const PatientAllOfInsuranceProviderEnum cnas =
      _$patientAllOfInsuranceProviderEnum_cnas;
  @BuiltValueEnumConst(wireName: r'casnos')
  static const PatientAllOfInsuranceProviderEnum casnos =
      _$patientAllOfInsuranceProviderEnum_casnos;
  @BuiltValueEnumConst(wireName: r'none')
  static const PatientAllOfInsuranceProviderEnum none =
      _$patientAllOfInsuranceProviderEnum_none;
  @BuiltValueEnumConst(wireName: r'private')
  static const PatientAllOfInsuranceProviderEnum private =
      _$patientAllOfInsuranceProviderEnum_private;

  static Serializer<PatientAllOfInsuranceProviderEnum> get serializer =>
      _$patientAllOfInsuranceProviderEnumSerializer;

  const PatientAllOfInsuranceProviderEnum._(String name) : super(name);

  static BuiltSet<PatientAllOfInsuranceProviderEnum> get values =>
      _$patientAllOfInsuranceProviderEnumValues;
  static PatientAllOfInsuranceProviderEnum valueOf(String name) =>
      _$patientAllOfInsuranceProviderEnumValueOf(name);
}
