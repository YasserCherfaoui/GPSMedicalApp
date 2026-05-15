//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dependent_create.g.dart';

/// DependentCreate
///
/// Properties:
/// * [fullName]
/// * [relation]
/// * [birthDate]
/// * [gender]
@BuiltValue()
abstract class DependentCreate
    implements Built<DependentCreate, DependentCreateBuilder> {
  @BuiltValueField(wireName: r'full_name')
  String get fullName;

  @BuiltValueField(wireName: r'relation')
  DependentCreateRelationEnum get relation;
  // enum relationEnum {  child,  spouse,  parent,  other,  };

  @BuiltValueField(wireName: r'birth_date')
  Date get birthDate;

  @BuiltValueField(wireName: r'gender')
  DependentCreateGenderEnum get gender;
  // enum genderEnum {  male,  female,  };

  DependentCreate._();

  factory DependentCreate([void updates(DependentCreateBuilder b)]) =
      _$DependentCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DependentCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DependentCreate> get serializer =>
      _$DependentCreateSerializer();
}

class _$DependentCreateSerializer
    implements PrimitiveSerializer<DependentCreate> {
  @override
  final Iterable<Type> types = const [DependentCreate, _$DependentCreate];

  @override
  final String wireName = r'DependentCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DependentCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'full_name';
    yield serializers.serialize(
      object.fullName,
      specifiedType: const FullType(String),
    );
    yield r'relation';
    yield serializers.serialize(
      object.relation,
      specifiedType: const FullType(DependentCreateRelationEnum),
    );
    yield r'birth_date';
    yield serializers.serialize(
      object.birthDate,
      specifiedType: const FullType(Date),
    );
    yield r'gender';
    yield serializers.serialize(
      object.gender,
      specifiedType: const FullType(DependentCreateGenderEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DependentCreate object, {
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
    required DependentCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
                    specifiedType: const FullType(DependentCreateRelationEnum),
                  )
                  as DependentCreateRelationEnum;
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
                    specifiedType: const FullType(DependentCreateGenderEnum),
                  )
                  as DependentCreateGenderEnum;
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
  DependentCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DependentCreateBuilder();
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

class DependentCreateRelationEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'child')
  static const DependentCreateRelationEnum child =
      _$dependentCreateRelationEnum_child;
  @BuiltValueEnumConst(wireName: r'spouse')
  static const DependentCreateRelationEnum spouse =
      _$dependentCreateRelationEnum_spouse;
  @BuiltValueEnumConst(wireName: r'parent')
  static const DependentCreateRelationEnum parent =
      _$dependentCreateRelationEnum_parent;
  @BuiltValueEnumConst(wireName: r'other')
  static const DependentCreateRelationEnum other =
      _$dependentCreateRelationEnum_other;

  static Serializer<DependentCreateRelationEnum> get serializer =>
      _$dependentCreateRelationEnumSerializer;

  const DependentCreateRelationEnum._(String name) : super(name);

  static BuiltSet<DependentCreateRelationEnum> get values =>
      _$dependentCreateRelationEnumValues;
  static DependentCreateRelationEnum valueOf(String name) =>
      _$dependentCreateRelationEnumValueOf(name);
}

class DependentCreateGenderEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'male')
  static const DependentCreateGenderEnum male =
      _$dependentCreateGenderEnum_male;
  @BuiltValueEnumConst(wireName: r'female')
  static const DependentCreateGenderEnum female =
      _$dependentCreateGenderEnum_female;

  static Serializer<DependentCreateGenderEnum> get serializer =>
      _$dependentCreateGenderEnumSerializer;

  const DependentCreateGenderEnum._(String name) : super(name);

  static BuiltSet<DependentCreateGenderEnum> get values =>
      _$dependentCreateGenderEnumValues;
  static DependentCreateGenderEnum valueOf(String name) =>
      _$dependentCreateGenderEnumValueOf(name);
}
