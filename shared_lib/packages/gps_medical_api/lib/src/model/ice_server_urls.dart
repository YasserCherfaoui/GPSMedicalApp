//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'dart:core';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'ice_server_urls.g.dart';

/// IceServerUrls
@BuiltValue()
abstract class IceServerUrls implements Built<IceServerUrls, IceServerUrlsBuilder> {
  /// One Of [BuiltList<String>], [String]
  OneOf get oneOf;

  IceServerUrls._();

  factory IceServerUrls([void updates(IceServerUrlsBuilder b)]) = _$IceServerUrls;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IceServerUrlsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IceServerUrls> get serializer => _$IceServerUrlsSerializer();
}

class _$IceServerUrlsSerializer implements PrimitiveSerializer<IceServerUrls> {
  @override
  final Iterable<Type> types = const [IceServerUrls, _$IceServerUrls];

  @override
  final String wireName = r'IceServerUrls';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IceServerUrls object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
  }

  @override
  Object serialize(
    Serializers serializers,
    IceServerUrls object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value, specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  IceServerUrls deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IceServerUrlsBuilder();
    Object? oneOfDataSrc;
    final targetType = const FullType(OneOf, [FullType(String), FullType(BuiltList, [FullType(String)]), ]);
    oneOfDataSrc = serialized;
    result.oneOf = serializers.deserialize(oneOfDataSrc, specifiedType: targetType) as OneOf;
    return result.build();
  }
}

