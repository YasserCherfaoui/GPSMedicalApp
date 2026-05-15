//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/suggest_item.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_suggest_get200_response.g.dart';

/// SearchSuggestGet200Response
///
/// Properties:
/// * [doctors]
/// * [specialties]
/// * [locations]
@BuiltValue()
abstract class SearchSuggestGet200Response
    implements
        Built<SearchSuggestGet200Response, SearchSuggestGet200ResponseBuilder> {
  @BuiltValueField(wireName: r'doctors')
  BuiltList<SuggestItem>? get doctors;

  @BuiltValueField(wireName: r'specialties')
  BuiltList<SuggestItem>? get specialties;

  @BuiltValueField(wireName: r'locations')
  BuiltList<SuggestItem>? get locations;

  SearchSuggestGet200Response._();

  factory SearchSuggestGet200Response([
    void updates(SearchSuggestGet200ResponseBuilder b),
  ]) = _$SearchSuggestGet200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SearchSuggestGet200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SearchSuggestGet200Response> get serializer =>
      _$SearchSuggestGet200ResponseSerializer();
}

class _$SearchSuggestGet200ResponseSerializer
    implements PrimitiveSerializer<SearchSuggestGet200Response> {
  @override
  final Iterable<Type> types = const [
    SearchSuggestGet200Response,
    _$SearchSuggestGet200Response,
  ];

  @override
  final String wireName = r'SearchSuggestGet200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SearchSuggestGet200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.doctors != null) {
      yield r'doctors';
      yield serializers.serialize(
        object.doctors,
        specifiedType: const FullType(BuiltList, [FullType(SuggestItem)]),
      );
    }
    if (object.specialties != null) {
      yield r'specialties';
      yield serializers.serialize(
        object.specialties,
        specifiedType: const FullType(BuiltList, [FullType(SuggestItem)]),
      );
    }
    if (object.locations != null) {
      yield r'locations';
      yield serializers.serialize(
        object.locations,
        specifiedType: const FullType(BuiltList, [FullType(SuggestItem)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SearchSuggestGet200Response object, {
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
    required SearchSuggestGet200ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'doctors':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(SuggestItem),
                    ]),
                  )
                  as BuiltList<SuggestItem>;
          result.doctors.replace(valueDes);
          break;
        case r'specialties':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(SuggestItem),
                    ]),
                  )
                  as BuiltList<SuggestItem>;
          result.specialties.replace(valueDes);
          break;
        case r'locations':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(SuggestItem),
                    ]),
                  )
                  as BuiltList<SuggestItem>;
          result.locations.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SearchSuggestGet200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SearchSuggestGet200ResponseBuilder();
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
