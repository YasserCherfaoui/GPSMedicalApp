// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tele_session.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const TeleSessionStatusEnum _$teleSessionStatusEnum_scheduled =
    const TeleSessionStatusEnum._('scheduled');
const TeleSessionStatusEnum _$teleSessionStatusEnum_ready =
    const TeleSessionStatusEnum._('ready');
const TeleSessionStatusEnum _$teleSessionStatusEnum_inProgress =
    const TeleSessionStatusEnum._('inProgress');
const TeleSessionStatusEnum _$teleSessionStatusEnum_ended =
    const TeleSessionStatusEnum._('ended');

TeleSessionStatusEnum _$teleSessionStatusEnumValueOf(String name) {
  switch (name) {
    case 'scheduled':
      return _$teleSessionStatusEnum_scheduled;
    case 'ready':
      return _$teleSessionStatusEnum_ready;
    case 'inProgress':
      return _$teleSessionStatusEnum_inProgress;
    case 'ended':
      return _$teleSessionStatusEnum_ended;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<TeleSessionStatusEnum> _$teleSessionStatusEnumValues =
    BuiltSet<TeleSessionStatusEnum>(const <TeleSessionStatusEnum>[
      _$teleSessionStatusEnum_scheduled,
      _$teleSessionStatusEnum_ready,
      _$teleSessionStatusEnum_inProgress,
      _$teleSessionStatusEnum_ended,
    ]);

Serializer<TeleSessionStatusEnum> _$teleSessionStatusEnumSerializer =
    _$TeleSessionStatusEnumSerializer();

class _$TeleSessionStatusEnumSerializer
    implements PrimitiveSerializer<TeleSessionStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'scheduled': 'scheduled',
    'ready': 'ready',
    'inProgress': 'in_progress',
    'ended': 'ended',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'scheduled': 'scheduled',
    'ready': 'ready',
    'in_progress': 'inProgress',
    'ended': 'ended',
  };

  @override
  final Iterable<Type> types = const <Type>[TeleSessionStatusEnum];
  @override
  final String wireName = 'TeleSessionStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    TeleSessionStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  TeleSessionStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => TeleSessionStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$TeleSession extends TeleSession {
  @override
  final String? appointmentId;
  @override
  final String? roomId;
  @override
  final TeleSessionStatusEnum? status;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? endedAt;
  @override
  final int? durationSeconds;
  @override
  final BuiltList<IceServer>? iceServers;
  @override
  final String? token;

  factory _$TeleSession([void Function(TeleSessionBuilder)? updates]) =>
      (TeleSessionBuilder()..update(updates))._build();

  _$TeleSession._({
    this.appointmentId,
    this.roomId,
    this.status,
    this.startedAt,
    this.endedAt,
    this.durationSeconds,
    this.iceServers,
    this.token,
  }) : super._();
  @override
  TeleSession rebuild(void Function(TeleSessionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TeleSessionBuilder toBuilder() => TeleSessionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TeleSession &&
        appointmentId == other.appointmentId &&
        roomId == other.roomId &&
        status == other.status &&
        startedAt == other.startedAt &&
        endedAt == other.endedAt &&
        durationSeconds == other.durationSeconds &&
        iceServers == other.iceServers &&
        token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, appointmentId.hashCode);
    _$hash = $jc(_$hash, roomId.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, startedAt.hashCode);
    _$hash = $jc(_$hash, endedAt.hashCode);
    _$hash = $jc(_$hash, durationSeconds.hashCode);
    _$hash = $jc(_$hash, iceServers.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TeleSession')
          ..add('appointmentId', appointmentId)
          ..add('roomId', roomId)
          ..add('status', status)
          ..add('startedAt', startedAt)
          ..add('endedAt', endedAt)
          ..add('durationSeconds', durationSeconds)
          ..add('iceServers', iceServers)
          ..add('token', token))
        .toString();
  }
}

class TeleSessionBuilder implements Builder<TeleSession, TeleSessionBuilder> {
  _$TeleSession? _$v;

  String? _appointmentId;
  String? get appointmentId => _$this._appointmentId;
  set appointmentId(String? appointmentId) =>
      _$this._appointmentId = appointmentId;

  String? _roomId;
  String? get roomId => _$this._roomId;
  set roomId(String? roomId) => _$this._roomId = roomId;

  TeleSessionStatusEnum? _status;
  TeleSessionStatusEnum? get status => _$this._status;
  set status(TeleSessionStatusEnum? status) => _$this._status = status;

  DateTime? _startedAt;
  DateTime? get startedAt => _$this._startedAt;
  set startedAt(DateTime? startedAt) => _$this._startedAt = startedAt;

  DateTime? _endedAt;
  DateTime? get endedAt => _$this._endedAt;
  set endedAt(DateTime? endedAt) => _$this._endedAt = endedAt;

  int? _durationSeconds;
  int? get durationSeconds => _$this._durationSeconds;
  set durationSeconds(int? durationSeconds) =>
      _$this._durationSeconds = durationSeconds;

  ListBuilder<IceServer>? _iceServers;
  ListBuilder<IceServer> get iceServers =>
      _$this._iceServers ??= ListBuilder<IceServer>();
  set iceServers(ListBuilder<IceServer>? iceServers) =>
      _$this._iceServers = iceServers;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  TeleSessionBuilder() {
    TeleSession._defaults(this);
  }

  TeleSessionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appointmentId = $v.appointmentId;
      _roomId = $v.roomId;
      _status = $v.status;
      _startedAt = $v.startedAt;
      _endedAt = $v.endedAt;
      _durationSeconds = $v.durationSeconds;
      _iceServers = $v.iceServers?.toBuilder();
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TeleSession other) {
    _$v = other as _$TeleSession;
  }

  @override
  void update(void Function(TeleSessionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TeleSession build() => _build();

  _$TeleSession _build() {
    _$TeleSession _$result;
    try {
      _$result =
          _$v ??
          _$TeleSession._(
            appointmentId: appointmentId,
            roomId: roomId,
            status: status,
            startedAt: startedAt,
            endedAt: endedAt,
            durationSeconds: durationSeconds,
            iceServers: _iceServers?.build(),
            token: token,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iceServers';
        _iceServers?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'TeleSession',
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
