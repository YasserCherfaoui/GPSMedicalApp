//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'specialty_create.g.dart';

/// SpecialtyCreate
///
/// Properties:
/// * [code]
/// * [nameFr]
/// * [nameAr]
/// * [parentId]
@BuiltValue()
abstract class SpecialtyCreate
    implements Built<SpecialtyCreate, SpecialtyCreateBuilder> {
  @BuiltValueField(wireName: r'code')
  String get code;

  @BuiltValueField(wireName: r'name_fr')
  String get nameFr;

  @BuiltValueField(wireName: r'name_ar')
  String? get nameAr;

  @BuiltValueField(wireName: r'parent_id')
  String? get parentId;

  SpecialtyCreate._();

  factory SpecialtyCreate([void updates(SpecialtyCreateBuilder b)]) =
      _$SpecialtyCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SpecialtyCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SpecialtyCreate> get serializer =>
      _$SpecialtyCreateSerializer();
}

class _$SpecialtyCreateSerializer
    implements PrimitiveSerializer<SpecialtyCreate> {
  @override
  final Iterable<Type> types = const [SpecialtyCreate, _$SpecialtyCreate];

  @override
  final String wireName = r'SpecialtyCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SpecialtyCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'name_fr';
    yield serializers.serialize(
      object.nameFr,
      specifiedType: const FullType(String),
    );
    if (object.nameAr != null) {
      yield r'name_ar';
      yield serializers.serialize(
        object.nameAr,
        specifiedType: const FullType(String),
      );
    }
    if (object.parentId != null) {
      yield r'parent_id';
      yield serializers.serialize(
        object.parentId,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SpecialtyCreate object, {
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
    required SpecialtyCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.code = valueDes;
          break;
        case r'name_fr':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.nameFr = valueDes;
          break;
        case r'name_ar':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.nameAr = valueDes;
          break;
        case r'parent_id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.parentId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SpecialtyCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SpecialtyCreateBuilder();
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
