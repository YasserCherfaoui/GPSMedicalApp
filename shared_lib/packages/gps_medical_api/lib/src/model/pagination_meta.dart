//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pagination_meta.g.dart';

/// PaginationMeta
///
/// Properties:
/// * [page]
/// * [pageSize]
/// * [total]
/// * [totalPages]
@BuiltValue()
abstract class PaginationMeta
    implements Built<PaginationMeta, PaginationMetaBuilder> {
  @BuiltValueField(wireName: r'page')
  int? get page;

  @BuiltValueField(wireName: r'page_size')
  int? get pageSize;

  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'total_pages')
  int? get totalPages;

  PaginationMeta._();

  factory PaginationMeta([void updates(PaginationMetaBuilder b)]) =
      _$PaginationMeta;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginationMetaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginationMeta> get serializer =>
      _$PaginationMetaSerializer();
}

class _$PaginationMetaSerializer
    implements PrimitiveSerializer<PaginationMeta> {
  @override
  final Iterable<Type> types = const [PaginationMeta, _$PaginationMeta];

  @override
  final String wireName = r'PaginationMeta';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginationMeta object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.page != null) {
      yield r'page';
      yield serializers.serialize(
        object.page,
        specifiedType: const FullType(int),
      );
    }
    if (object.pageSize != null) {
      yield r'page_size';
      yield serializers.serialize(
        object.pageSize,
        specifiedType: const FullType(int),
      );
    }
    if (object.total != null) {
      yield r'total';
      yield serializers.serialize(
        object.total,
        specifiedType: const FullType(int),
      );
    }
    if (object.totalPages != null) {
      yield r'total_pages';
      yield serializers.serialize(
        object.totalPages,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PaginationMeta object, {
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
    required PaginationMetaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'page':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.page = valueDes;
          break;
        case r'page_size':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.pageSize = valueDes;
          break;
        case r'total':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.total = valueDes;
          break;
        case r'total_pages':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.totalPages = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaginationMeta deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginationMetaBuilder();
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
