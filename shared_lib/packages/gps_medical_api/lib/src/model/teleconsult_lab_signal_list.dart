//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/teleconsult_signal.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'teleconsult_lab_signal_list.g.dart';

/// TeleconsultLabSignalList
///
/// Properties:
/// * [signals] 
/// * [peerCount] 
@BuiltValue()
abstract class TeleconsultLabSignalList implements Built<TeleconsultLabSignalList, TeleconsultLabSignalListBuilder> {
  @BuiltValueField(wireName: r'signals')
  BuiltList<TeleconsultSignal> get signals;

  @BuiltValueField(wireName: r'peer_count')
  int get peerCount;

  TeleconsultLabSignalList._();

  factory TeleconsultLabSignalList([void updates(TeleconsultLabSignalListBuilder b)]) = _$TeleconsultLabSignalList;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TeleconsultLabSignalListBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TeleconsultLabSignalList> get serializer => _$TeleconsultLabSignalListSerializer();
}

class _$TeleconsultLabSignalListSerializer implements PrimitiveSerializer<TeleconsultLabSignalList> {
  @override
  final Iterable<Type> types = const [TeleconsultLabSignalList, _$TeleconsultLabSignalList];

  @override
  final String wireName = r'TeleconsultLabSignalList';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TeleconsultLabSignalList object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'signals';
    yield serializers.serialize(
      object.signals,
      specifiedType: const FullType(BuiltList, [FullType(TeleconsultSignal)]),
    );
    yield r'peer_count';
    yield serializers.serialize(
      object.peerCount,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TeleconsultLabSignalList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TeleconsultLabSignalListBuilder result,
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
        case r'peer_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.peerCount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TeleconsultLabSignalList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TeleconsultLabSignalListBuilder();
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

