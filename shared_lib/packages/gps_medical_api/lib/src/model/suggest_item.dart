//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'suggest_item.g.dart';

/// SuggestItem
///
/// Properties:
/// * [id]
/// * [label]
/// * [kind]
@BuiltValue()
abstract class SuggestItem implements Built<SuggestItem, SuggestItemBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'label')
  String? get label;

  @BuiltValueField(wireName: r'kind')
  SuggestItemKindEnum? get kind;
  // enum kindEnum {  doctor,  specialty,  location,  };

  SuggestItem._();

  factory SuggestItem([void updates(SuggestItemBuilder b)]) = _$SuggestItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SuggestItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SuggestItem> get serializer => _$SuggestItemSerializer();
}

class _$SuggestItemSerializer implements PrimitiveSerializer<SuggestItem> {
  @override
  final Iterable<Type> types = const [SuggestItem, _$SuggestItem];

  @override
  final String wireName = r'SuggestItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SuggestItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.label != null) {
      yield r'label';
      yield serializers.serialize(
        object.label,
        specifiedType: const FullType(String),
      );
    }
    if (object.kind != null) {
      yield r'kind';
      yield serializers.serialize(
        object.kind,
        specifiedType: const FullType(SuggestItemKindEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SuggestItem object, {
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
    required SuggestItemBuilder result,
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
        case r'label':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.label = valueDes;
          break;
        case r'kind':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(SuggestItemKindEnum),
                  )
                  as SuggestItemKindEnum;
          result.kind = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SuggestItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SuggestItemBuilder();
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

class SuggestItemKindEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'doctor')
  static const SuggestItemKindEnum doctor = _$suggestItemKindEnum_doctor;
  @BuiltValueEnumConst(wireName: r'specialty')
  static const SuggestItemKindEnum specialty = _$suggestItemKindEnum_specialty;
  @BuiltValueEnumConst(wireName: r'location')
  static const SuggestItemKindEnum location = _$suggestItemKindEnum_location;

  static Serializer<SuggestItemKindEnum> get serializer =>
      _$suggestItemKindEnumSerializer;

  const SuggestItemKindEnum._(String name) : super(name);

  static BuiltSet<SuggestItemKindEnum> get values =>
      _$suggestItemKindEnumValues;
  static SuggestItemKindEnum valueOf(String name) =>
      _$suggestItemKindEnumValueOf(name);
}
