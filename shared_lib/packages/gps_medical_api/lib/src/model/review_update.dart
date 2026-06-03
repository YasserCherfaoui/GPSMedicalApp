//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'review_update.g.dart';

/// ReviewUpdate
///
/// Properties:
/// * [rating] 
/// * [comment] 
@BuiltValue()
abstract class ReviewUpdate implements Built<ReviewUpdate, ReviewUpdateBuilder> {
  @BuiltValueField(wireName: r'rating')
  int? get rating;

  @BuiltValueField(wireName: r'comment')
  String? get comment;

  ReviewUpdate._();

  factory ReviewUpdate([void updates(ReviewUpdateBuilder b)]) = _$ReviewUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReviewUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReviewUpdate> get serializer => _$ReviewUpdateSerializer();
}

class _$ReviewUpdateSerializer implements PrimitiveSerializer<ReviewUpdate> {
  @override
  final Iterable<Type> types = const [ReviewUpdate, _$ReviewUpdate];

  @override
  final String wireName = r'ReviewUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReviewUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.rating != null) {
      yield r'rating';
      yield serializers.serialize(
        object.rating,
        specifiedType: const FullType(int),
      );
    }
    if (object.comment != null) {
      yield r'comment';
      yield serializers.serialize(
        object.comment,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReviewUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReviewUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'rating':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.rating = valueDes;
          break;
        case r'comment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.comment = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReviewUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReviewUpdateBuilder();
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

