//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/teleconsult_signal.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'teleconsult_signal_list.g.dart';

/// TeleconsultSignalList
///
/// Properties:
/// * [signals] 
@BuiltValue()
abstract class TeleconsultSignalList implements Built<TeleconsultSignalList, TeleconsultSignalListBuilder> {
  @BuiltValueField(wireName: r'signals')
  BuiltList<TeleconsultSignal> get signals;

  TeleconsultSignalList._();

  factory TeleconsultSignalList([void updates(TeleconsultSignalListBuilder b)]) = _$TeleconsultSignalList;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TeleconsultSignalListBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TeleconsultSignalList> get serializer => _$TeleconsultSignalListSerializer();
}

class _$TeleconsultSignalListSerializer implements PrimitiveSerializer<TeleconsultSignalList> {
  @override
  final Iterable<Type> types = const [TeleconsultSignalList, _$TeleconsultSignalList];

  @override
  final String wireName = r'TeleconsultSignalList';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TeleconsultSignalList object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'signals';
    yield serializers.serialize(
      object.signals,
      specifiedType: const FullType(BuiltList, [FullType(TeleconsultSignal)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TeleconsultSignalList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TeleconsultSignalListBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'signals':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(TeleconsultSignal)]),
          ) as BuiltList<TeleconsultSignal>;
          result.signals.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TeleconsultSignalList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TeleconsultSignalListBuilder();
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

