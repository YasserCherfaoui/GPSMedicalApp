// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messaging_realtime_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const MessagingRealtimeEventTypeEnum
_$messagingRealtimeEventTypeEnum_messagePeriodNew =
    const MessagingRealtimeEventTypeEnum._('messagePeriodNew');
const MessagingRealtimeEventTypeEnum
_$messagingRealtimeEventTypeEnum_messagePeriodRead =
    const MessagingRealtimeEventTypeEnum._('messagePeriodRead');

MessagingRealtimeEventTypeEnum _$messagingRealtimeEventTypeEnumValueOf(
  String name,
) {
  switch (name) {
    case 'messagePeriodNew':
      return _$messagingRealtimeEventTypeEnum_messagePeriodNew;
    case 'messagePeriodRead':
      return _$messagingRealtimeEventTypeEnum_messagePeriodRead;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<MessagingRealtimeEventTypeEnum>
_$messagingRealtimeEventTypeEnumValues =
    BuiltSet<MessagingRealtimeEventTypeEnum>(
      const <MessagingRealtimeEventTypeEnum>[
        _$messagingRealtimeEventTypeEnum_messagePeriodNew,
        _$messagingRealtimeEventTypeEnum_messagePeriodRead,
      ],
    );

Serializer<MessagingRealtimeEventTypeEnum>
_$messagingRealtimeEventTypeEnumSerializer =
    _$MessagingRealtimeEventTypeEnumSerializer();

class _$MessagingRealtimeEventTypeEnumSerializer
    implements PrimitiveSerializer<MessagingRealtimeEventTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'messagePeriodNew': 'message.new',
    'messagePeriodRead': 'message.read',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'message.new': 'messagePeriodNew',
    'message.read': 'messagePeriodRead',
  };

  @override
  final Iterable<Type> types = const <Type>[MessagingRealtimeEventTypeEnum];
  @override
  final String wireName = 'MessagingRealtimeEventTypeEnum';

  @override
  Object serialize(
    Serializers serializers,
    MessagingRealtimeEventTypeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  MessagingRealtimeEventTypeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => MessagingRealtimeEventTypeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$MessagingRealtimeEvent extends MessagingRealtimeEvent {
  @override
  final MessagingRealtimeEventTypeEnum type;
  @override
  final String threadId;
  @override
  final BuiltMap<String, JsonObject?> payload;

  factory _$MessagingRealtimeEvent([
    void Function(MessagingRealtimeEventBuilder)? updates,
  ]) => (MessagingRealtimeEventBuilder()..update(updates))._build();

  _$MessagingRealtimeEvent._({
    required this.type,
    required this.threadId,
    required this.payload,
  }) : super._();
  @override
  MessagingRealtimeEvent rebuild(
    void Function(MessagingRealtimeEventBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  MessagingRealtimeEventBuilder toBuilder() =>
      MessagingRealtimeEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessagingRealtimeEvent &&
        type == other.type &&
        threadId == other.threadId &&
        payload == other.payload;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, threadId.hashCode);
    _$hash = $jc(_$hash, payload.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MessagingRealtimeEvent')
          ..add('type', type)
          ..add('threadId', threadId)
          ..add('payload', payload))
        .toString();
  }
}

class MessagingRealtimeEventBuilder
    implements Builder<MessagingRealtimeEvent, MessagingRealtimeEventBuilder> {
  _$MessagingRealtimeEvent? _$v;

  MessagingRealtimeEventTypeEnum? _type;
  MessagingRealtimeEventTypeEnum? get type => _$this._type;
  set type(MessagingRealtimeEventTypeEnum? type) => _$this._type = type;

  String? _threadId;
  String? get threadId => _$this._threadId;
  set threadId(String? threadId) => _$this._threadId = threadId;

  MapBuilder<String, JsonObject?>? _payload;
  MapBuilder<String, JsonObject?> get payload =>
      _$this._payload ??= MapBuilder<String, JsonObject?>();
  set payload(MapBuilder<String, JsonObject?>? payload) =>
      _$this._payload = payload;

  MessagingRealtimeEventBuilder() {
    MessagingRealtimeEvent._defaults(this);
  }

  MessagingRealtimeEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _threadId = $v.threadId;
      _payload = $v.payload.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessagingRealtimeEvent other) {
    _$v = other as _$MessagingRealtimeEvent;
  }

  @override
  void update(void Function(MessagingRealtimeEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MessagingRealtimeEvent build() => _build();

  _$MessagingRealtimeEvent _build() {
    _$MessagingRealtimeEvent _$result;
    try {
      _$result =
          _$v ??
          _$MessagingRealtimeEvent._(
            type: BuiltValueNullFieldError.checkNotNull(
              type,
              r'MessagingRealtimeEvent',
              'type',
            ),
            threadId: BuiltValueNullFieldError.checkNotNull(
              threadId,
              r'MessagingRealtimeEvent',
              'threadId',
            ),
            payload: payload.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'payload';
        payload.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'MessagingRealtimeEvent',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
