//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_specialist_affiliation.g.dart';

/// ClinicSpecialistAffiliation
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [address] 
/// * [wilayaCode] 
/// * [verified] 
@BuiltValue()
abstract class ClinicSpecialistAffiliation implements Built<ClinicSpecialistAffiliation, ClinicSpecialistAffiliationBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'address')
  String? get address;

  @BuiltValueField(wireName: r'wilaya_code')
  String? get wilayaCode;

  @BuiltValueField(wireName: r'verified')
  bool? get verified;

  ClinicSpecialistAffiliation._();

  factory ClinicSpecialistAffiliation([void updates(ClinicSpecialistAffiliationBuilder b)]) = _$ClinicSpecialistAffiliation;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicSpecialistAffiliationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicSpecialistAffiliation> get serializer => _$ClinicSpecialistAffiliationSerializer();
}

class _$ClinicSpecialistAffiliationSerializer implements PrimitiveSerializer<ClinicSpecialistAffiliation> {
  @override
  final Iterable<Type> types = const [ClinicSpecialistAffiliation, _$ClinicSpecialistAffiliation];

  @override
  final String wireName = r'ClinicSpecialistAffiliation';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicSpecialistAffiliation object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.address != null) {
      yield r'address';
      yield serializers.serialize(
        object.address,
        specifiedType: const FullType(String),
      );
    }
    if (object.wilayaCode != null) {
      yield r'wilaya_code';
      yield serializers.serialize(
        object.wilayaCode,
        specifiedType: const FullType(String),
      );
    }
    if (object.verified != null) {
      yield r'verified';
      yield serializers.serialize(
        object.verified,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicSpecialistAffiliation object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicSpecialistAffiliationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.address = valueDes;
          break;
        case r'wilaya_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.wilayaCode = valueDes;
          break;
        case r'verified':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.verified = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicSpecialistAffiliation deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicSpecialistAffiliationBuilder();
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

