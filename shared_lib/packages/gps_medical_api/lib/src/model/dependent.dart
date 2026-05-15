//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dependent.g.dart';

/// Dependent
///
/// Properties:
/// * [id]
/// * [fullName]
/// * [relation]
/// * [birthDate]
/// * [gender]
@BuiltValue()
abstract class Dependent implements Built<Dependent, DependentBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'full_name')
  String? get fullName;

  @BuiltValueField(wireName: r'relation')
  DependentRelationEnum? get relation;
  // enum relationEnum {  child,  spouse,  parent,  other,  };

  @BuiltValueField(wireName: r'birth_date')
  Date? get birthDate;

  @BuiltValueField(wireName: r'gender')
  DependentGenderEnum? get gender;
  // enum genderEnum {  male,  female,  };

  Dependent._();

  factory Dependent([void updates(DependentBuilder b)]) = _$Dependent;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DependentBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Dependent> get serializer => _$DependentSerializer();
}

class _$DependentSerializer implements PrimitiveSerializer<Dependent> {
  @override
  final Iterable<Type> types = const [Dependent, _$Dependent];

  @override
  final String wireName = r'Dependent';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Dependent object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.fullName != null) {
      yield r'full_name';
      yield serializers.serialize(
        object.fullName,
        specifiedType: const FullType(String),
      );
    }
    if (object.relation != null) {
      yield r'relation';
      yield serializers.serialize(
        object.relation,
        specifiedType: const FullType(DependentRelationEnum),
      );
    }
    if (object.birthDate != null) {
      yield r'birth_date';
      yield serializers.serialize(
        object.birthDate,
        specifiedType: const FullType(Date),
      );
    }
    if (object.gender != null) {
      yield r'gender';
      yield serializers.serialize(
        object.gender,
        specifiedType: const FullType(DependentGenderEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Dependent object, {
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
    required DependentBuilder result,
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
        case r'full_name':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.fullName = valueDes;
          break;
        case r'relation':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DependentRelationEnum),
                  )
                  as DependentRelationEnum;
          result.relation = valueDes;
          break;
        case r'birth_date':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(Date),
                  )
                  as Date;
          result.birthDate = valueDes;
          break;
        case r'gender':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DependentGenderEnum),
                  )
                  as DependentGenderEnum;
          result.gender = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Dependent deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DependentBuilder();
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

class DependentRelationEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'child')
  static const DependentRelationEnum child = _$dependentRelationEnum_child;
  @BuiltValueEnumConst(wireName: r'spouse')
  static const DependentRelationEnum spouse = _$dependentRelationEnum_spouse;
  @BuiltValueEnumConst(wireName: r'parent')
  static const DependentRelationEnum parent = _$dependentRelationEnum_parent;
  @BuiltValueEnumConst(wireName: r'other')
  static const DependentRelationEnum other = _$dependentRelationEnum_other;

  static Serializer<DependentRelationEnum> get serializer =>
      _$dependentRelationEnumSerializer;

  const DependentRelationEnum._(String name) : super(name);

  static BuiltSet<DependentRelationEnum> get values =>
      _$dependentRelationEnumValues;
  static DependentRelationEnum valueOf(String name) =>
      _$dependentRelationEnumValueOf(name);
}

class DependentGenderEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'male')
  static const DependentGenderEnum male = _$dependentGenderEnum_male;
  @BuiltValueEnumConst(wireName: r'female')
  static const DependentGenderEnum female = _$dependentGenderEnum_female;

  static Serializer<DependentGenderEnum> get serializer =>
      _$dependentGenderEnumSerializer;

  const DependentGenderEnum._(String name) : super(name);

  static BuiltSet<DependentGenderEnum> get values =>
      _$dependentGenderEnumValues;
  static DependentGenderEnum valueOf(String name) =>
      _$dependentGenderEnumValueOf(name);
}
