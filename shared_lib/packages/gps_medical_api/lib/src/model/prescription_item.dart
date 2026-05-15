//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'prescription_item.g.dart';

/// PrescriptionItem
///
/// Properties:
/// * [drugName]
/// * [activeIngredient]
/// * [dosage]
/// * [frequency]
/// * [durationDays]
/// * [instructions]
@BuiltValue()
abstract class PrescriptionItem
    implements Built<PrescriptionItem, PrescriptionItemBuilder> {
  @BuiltValueField(wireName: r'drug_name')
  String get drugName;

  @BuiltValueField(wireName: r'active_ingredient')
  String? get activeIngredient;

  @BuiltValueField(wireName: r'dosage')
  String get dosage;

  @BuiltValueField(wireName: r'frequency')
  String get frequency;

  @BuiltValueField(wireName: r'duration_days')
  int get durationDays;

  @BuiltValueField(wireName: r'instructions')
  String? get instructions;

  PrescriptionItem._();

  factory PrescriptionItem([void updates(PrescriptionItemBuilder b)]) =
      _$PrescriptionItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PrescriptionItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PrescriptionItem> get serializer =>
      _$PrescriptionItemSerializer();
}

class _$PrescriptionItemSerializer
    implements PrimitiveSerializer<PrescriptionItem> {
  @override
  final Iterable<Type> types = const [PrescriptionItem, _$PrescriptionItem];

  @override
  final String wireName = r'PrescriptionItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PrescriptionItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'drug_name';
    yield serializers.serialize(
      object.drugName,
      specifiedType: const FullType(String),
    );
    if (object.activeIngredient != null) {
      yield r'active_ingredient';
      yield serializers.serialize(
        object.activeIngredient,
        specifiedType: const FullType(String),
      );
    }
    yield r'dosage';
    yield serializers.serialize(
      object.dosage,
      specifiedType: const FullType(String),
    );
    yield r'frequency';
    yield serializers.serialize(
      object.frequency,
      specifiedType: const FullType(String),
    );
    yield r'duration_days';
    yield serializers.serialize(
      object.durationDays,
      specifiedType: const FullType(int),
    );
    if (object.instructions != null) {
      yield r'instructions';
      yield serializers.serialize(
        object.instructions,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PrescriptionItem object, {
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
    required PrescriptionItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'drug_name':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.drugName = valueDes;
          break;
        case r'active_ingredient':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.activeIngredient = valueDes;
          break;
        case r'dosage':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.dosage = valueDes;
          break;
        case r'frequency':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.frequency = valueDes;
          break;
        case r'duration_days':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.durationDays = valueDes;
          break;
        case r'instructions':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.instructions = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PrescriptionItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PrescriptionItemBuilder();
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
