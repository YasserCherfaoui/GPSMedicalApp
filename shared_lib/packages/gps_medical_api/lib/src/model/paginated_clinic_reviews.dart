//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/pagination_meta.dart';
import 'package:gps_medical_api/src/model/clinic_review.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_clinic_reviews.g.dart';

/// PaginatedClinicReviews
///
/// Properties:
/// * [data] 
/// * [meta] 
@BuiltValue()
abstract class PaginatedClinicReviews implements Built<PaginatedClinicReviews, PaginatedClinicReviewsBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<ClinicReview>? get data;

  @BuiltValueField(wireName: r'meta')
  PaginationMeta? get meta;

  PaginatedClinicReviews._();

  factory PaginatedClinicReviews([void updates(PaginatedClinicReviewsBuilder b)]) = _$PaginatedClinicReviews;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedClinicReviewsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedClinicReviews> get serializer => _$PaginatedClinicReviewsSerializer();
}

class _$PaginatedClinicReviewsSerializer implements PrimitiveSerializer<PaginatedClinicReviews> {
  @override
  final Iterable<Type> types = const [PaginatedClinicReviews, _$PaginatedClinicReviews];

  @override
  final String wireName = r'PaginatedClinicReviews';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedClinicReviews object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, [FullType(ClinicReview)]),
      );
    }
    if (object.meta != null) {
      yield r'meta';
      yield serializers.serialize(
        object.meta,
        specifiedType: const FullType(PaginationMeta),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PaginatedClinicReviews object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedClinicReviewsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ClinicReview)]),
          ) as BuiltList<ClinicReview>;
          result.data.replace(valueDes);
          break;
        case r'meta':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PaginationMeta),
          ) as PaginationMeta;
          result.meta.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaginatedClinicReviews deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedClinicReviewsBuilder();
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

