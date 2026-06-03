//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'address.g.dart';

/// Address
///
/// Properties:
/// * [line1] 
/// * [line2] 
/// * [communeId] 
/// * [communeName] 
/// * [wilayaCode] 
/// * [wilayaName] 
/// * [postalCode] 
/// * [latitude] 
/// * [longitude] 
@BuiltValue()
abstract class Address implements Built<Address, AddressBuilder> {
  @BuiltValueField(wireName: r'line1')
  String? get line1;

  @BuiltValueField(wireName: r'line2')
  String? get line2;

  @BuiltValueField(wireName: r'commune_id')
  String? get communeId;

  @BuiltValueField(wireName: r'commune_name')
  String? get communeName;

  @BuiltValueField(wireName: r'wilaya_code')
  String? get wilayaCode;

  @BuiltValueField(wireName: r'wilaya_name')
  String? get wilayaName;

  @BuiltValueField(wireName: r'postal_code')
  String? get postalCode;

  @BuiltValueField(wireName: r'latitude')
  double? get latitude;

  @BuiltValueField(wireName: r'longitude')
  double? get longitude;

  Address._();

  factory Address([void updates(AddressBuilder b)]) = _$Address;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddressBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Address> get serializer => _$AddressSerializer();
}

class _$AddressSerializer implements PrimitiveSerializer<Address> {
  @override
  final Iterable<Type> types = const [Address, _$Address];

  @override
  final String wireName = r'Address';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Address object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.line1 != null) {
      yield r'line1';
      yield serializers.serialize(
        object.line1,
        specifiedType: const FullType(String),
      );
    }
    if (object.line2 != null) {
      yield r'line2';
      yield serializers.serialize(
        object.line2,
        specifiedType: const FullType(String),
      );
    }
    if (object.communeId != null) {
      yield r'commune_id';
      yield serializers.serialize(
        object.communeId,
        specifiedType: const FullType(String),
      );
    }
    if (object.communeName != null) {
      yield r'commune_name';
      yield serializers.serialize(
        object.communeName,
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
    if (object.wilayaName != null) {
      yield r'wilaya_name';
      yield serializers.serialize(
        object.wilayaName,
        specifiedType: const FullType(String),
      );
    }
    if (object.postalCode != null) {
      yield r'postal_code';
      yield serializers.serialize(
        object.postalCode,
        specifiedType: const FullType(String),
      );
    }
    if (object.latitude != null) {
      yield r'latitude';
      yield serializers.serialize(
        object.latitude,
        specifiedType: const FullType(double),
      );
    }
    if (object.longitude != null) {
      yield r'longitude';
      yield serializers.serialize(
        object.longitude,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Address object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddressBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'line1':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.line1 = valueDes;
          break;
        case r'line2':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.line2 = valueDes;
          break;
        case r'commune_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.communeId = valueDes;
          break;
        case r'commune_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.communeName = valueDes;
          break;
        case r'wilaya_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.wilayaCode = valueDes;
          break;
        case r'wilaya_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.wilayaName = valueDes;
          break;
        case r'postal_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.postalCode = valueDes;
          break;
        case r'latitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.latitude = valueDes;
          break;
        case r'longitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.longitude = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Address deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddressBuilder();
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

