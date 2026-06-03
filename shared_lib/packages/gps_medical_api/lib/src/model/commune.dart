//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'commune.g.dart';

/// Commune
///
/// Properties:
/// * [id] 
/// * [wilayaCode] 
/// * [nameFr] 
/// * [nameAr] 
@BuiltValue()
abstract class Commune implements Built<Commune, CommuneBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'wilaya_code')
  String? get wilayaCode;

  @BuiltValueField(wireName: r'name_fr')
  String? get nameFr;

  @BuiltValueField(wireName: r'name_ar')
  String? get nameAr;

  Commune._();

  factory Commune([void updates(CommuneBuilder b)]) = _$Commune;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CommuneBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Commune> get serializer => _$CommuneSerializer();
}

class _$CommuneSerializer implements PrimitiveSerializer<Commune> {
  @override
  final Iterable<Type> types = const [Commune, _$Commune];

  @override
  final String wireName = r'Commune';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Commune object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
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
    if (object.nameFr != null) {
      yield r'name_fr';
      yield serializers.serialize(
        object.nameFr,
        specifiedType: const FullType(String),
      );
    }
    if (object.nameAr != null) {
      yield r'name_ar';
      yield serializers.serialize(
        object.nameAr,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Commune object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CommuneBuilder result,
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
        case r'wilaya_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.wilayaCode = valueDes;
          break;
        case r'name_fr':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nameFr = valueDes;
          break;
        case r'name_ar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nameAr = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Commune deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CommuneBuilder();
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

