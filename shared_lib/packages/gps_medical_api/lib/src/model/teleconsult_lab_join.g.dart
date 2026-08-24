// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teleconsult_lab_join.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const TeleconsultLabJoinRoleEnum _$teleconsultLabJoinRoleEnum_offerer =
    const TeleconsultLabJoinRoleEnum._('offerer');
const TeleconsultLabJoinRoleEnum _$teleconsultLabJoinRoleEnum_answerer =
    const TeleconsultLabJoinRoleEnum._('answerer');

TeleconsultLabJoinRoleEnum _$teleconsultLabJoinRoleEnumValueOf(String name) {
  switch (name) {
    case 'offerer':
      return _$teleconsultLabJoinRoleEnum_offerer;
    case 'answerer':
      return _$teleconsultLabJoinRoleEnum_answerer;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<TeleconsultLabJoinRoleEnum> _$teleconsultLabJoinRoleEnumValues =
    BuiltSet<TeleconsultLabJoinRoleEnum>(const <TeleconsultLabJoinRoleEnum>[
      _$teleconsultLabJoinRoleEnum_offerer,
      _$teleconsultLabJoinRoleEnum_answerer,
    ]);

const TeleconsultLabJoinStatusEnum _$teleconsultLabJoinStatusEnum_waiting =
    const TeleconsultLabJoinStatusEnum._('waiting');
const TeleconsultLabJoinStatusEnum _$teleconsultLabJoinStatusEnum_ready =
    const TeleconsultLabJoinStatusEnum._('ready');

TeleconsultLabJoinStatusEnum _$teleconsultLabJoinStatusEnumValueOf(
  String name,
) {
  switch (name) {
    case 'waiting':
      return _$teleconsultLabJoinStatusEnum_waiting;
    case 'ready':
      return _$teleconsultLabJoinStatusEnum_ready;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<TeleconsultLabJoinStatusEnum>
_$teleconsultLabJoinStatusEnumValues = BuiltSet<TeleconsultLabJoinStatusEnum>(
  const <TeleconsultLabJoinStatusEnum>[
    _$teleconsultLabJoinStatusEnum_waiting,
    _$teleconsultLabJoinStatusEnum_ready,
  ],
);

Serializer<TeleconsultLabJoinRoleEnum> _$teleconsultLabJoinRoleEnumSerializer =
    _$TeleconsultLabJoinRoleEnumSerializer();
Serializer<TeleconsultLabJoinStatusEnum>
_$teleconsultLabJoinStatusEnumSerializer =
    _$TeleconsultLabJoinStatusEnumSerializer();

class _$TeleconsultLabJoinRoleEnumSerializer
    implements PrimitiveSerializer<TeleconsultLabJoinRoleEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'offerer': 'offerer',
    'answerer': 'answerer',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'offerer': 'offerer',
    'answerer': 'answerer',
  };

  @override
  final Iterable<Type> types = const <Type>[TeleconsultLabJoinRoleEnum];
  @override
  final String wireName = 'TeleconsultLabJoinRoleEnum';

  @override
  Object serialize(
    Serializers serializers,
    TeleconsultLabJoinRoleEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  TeleconsultLabJoinRoleEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => TeleconsultLabJoinRoleEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$TeleconsultLabJoinStatusEnumSerializer
    implements PrimitiveSerializer<TeleconsultLabJoinStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'waiting': 'waiting',
    'ready': 'ready',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'waiting': 'waiting',
    'ready': 'ready',
  };

  @override
  final Iterable<Type> types = const <Type>[TeleconsultLabJoinStatusEnum];
  @override
  final String wireName = 'TeleconsultLabJoinStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    TeleconsultLabJoinStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  TeleconsultLabJoinStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => TeleconsultLabJoinStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$TeleconsultLabJoin extends TeleconsultLabJoin {
  @override
  final String roomId;
  @override
  final String peerId;
  @override
  final TeleconsultLabJoinRoleEnum role;
  @override
  final int peerCount;
  @override
  final TeleconsultLabJoinStatusEnum status;
  @override
  final DateTime startedAt;
  @override
  final BuiltList<IceServer> iceServers;
  @override
  final TurnCredentials? turn;

  factory _$TeleconsultLabJoin([
    void Function(TeleconsultLabJoinBuilder)? updates,
  ]) => (TeleconsultLabJoinBuilder()..update(updates))._build();

  _$TeleconsultLabJoin._({
    required this.roomId,
    required this.peerId,
    required this.role,
    required this.peerCount,
    required this.status,
    required this.startedAt,
    required this.iceServers,
    this.turn,
  }) : super._();
  @override
  TeleconsultLabJoin rebuild(
    void Function(TeleconsultLabJoinBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  TeleconsultLabJoinBuilder toBuilder() =>
      TeleconsultLabJoinBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TeleconsultLabJoin &&
        roomId == other.roomId &&
        peerId == other.peerId &&
        role == other.role &&
        peerCount == other.peerCount &&
        status == other.status &&
        startedAt == other.startedAt &&
        iceServers == other.iceServers &&
        turn == other.turn;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, roomId.hashCode);
    _$hash = $jc(_$hash, peerId.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, peerCount.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, startedAt.hashCode);
    _$hash = $jc(_$hash, iceServers.hashCode);
    _$hash = $jc(_$hash, turn.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TeleconsultLabJoin')
          ..add('roomId', roomId)
          ..add('peerId', peerId)
          ..add('role', role)
          ..add('peerCount', peerCount)
          ..add('status', status)
          ..add('startedAt', startedAt)
          ..add('iceServers', iceServers)
          ..add('turn', turn))
        .toString();
  }
}

class TeleconsultLabJoinBuilder
    implements Builder<TeleconsultLabJoin, TeleconsultLabJoinBuilder> {
  _$TeleconsultLabJoin? _$v;

  String? _roomId;
  String? get roomId => _$this._roomId;
  set roomId(String? roomId) => _$this._roomId = roomId;

  String? _peerId;
  String? get peerId => _$this._peerId;
  set peerId(String? peerId) => _$this._peerId = peerId;

  TeleconsultLabJoinRoleEnum? _role;
  TeleconsultLabJoinRoleEnum? get role => _$this._role;
  set role(TeleconsultLabJoinRoleEnum? role) => _$this._role = role;

  int? _peerCount;
  int? get peerCount => _$this._peerCount;
  set peerCount(int? peerCount) => _$this._peerCount = peerCount;

  TeleconsultLabJoinStatusEnum? _status;
  TeleconsultLabJoinStatusEnum? get status => _$this._status;
  set status(TeleconsultLabJoinStatusEnum? status) => _$this._status = status;

  DateTime? _startedAt;
  DateTime? get startedAt => _$this._startedAt;
  set startedAt(DateTime? startedAt) => _$this._startedAt = startedAt;

  ListBuilder<IceServer>? _iceServers;
  ListBuilder<IceServer> get iceServers =>
      _$this._iceServers ??= ListBuilder<IceServer>();
  set iceServers(ListBuilder<IceServer>? iceServers) =>
      _$this._iceServers = iceServers;

  TurnCredentialsBuilder? _turn;
  TurnCredentialsBuilder get turn => _$this._turn ??= TurnCredentialsBuilder();
  set turn(TurnCredentialsBuilder? turn) => _$this._turn = turn;

  TeleconsultLabJoinBuilder() {
    TeleconsultLabJoin._defaults(this);
  }

  TeleconsultLabJoinBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _roomId = $v.roomId;
      _peerId = $v.peerId;
      _role = $v.role;
      _peerCount = $v.peerCount;
      _status = $v.status;
      _startedAt = $v.startedAt;
      _iceServers = $v.iceServers.toBuilder();
      _turn = $v.turn?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TeleconsultLabJoin other) {
    _$v = other as _$TeleconsultLabJoin;
  }

  @override
  void update(void Function(TeleconsultLabJoinBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TeleconsultLabJoin build() => _build();

  _$TeleconsultLabJoin _build() {
    _$TeleconsultLabJoin _$result;
    try {
      _$result =
          _$v ??
          _$TeleconsultLabJoin._(
            roomId: BuiltValueNullFieldError.checkNotNull(
              roomId,
              r'TeleconsultLabJoin',
              'roomId',
            ),
            peerId: BuiltValueNullFieldError.checkNotNull(
              peerId,
              r'TeleconsultLabJoin',
              'peerId',
            ),
            role: BuiltValueNullFieldError.checkNotNull(
              role,
              r'TeleconsultLabJoin',
              'role',
            ),
            peerCount: BuiltValueNullFieldError.checkNotNull(
              peerCount,
              r'TeleconsultLabJoin',
              'peerCount',
            ),
            status: BuiltValueNullFieldError.checkNotNull(
              status,
              r'TeleconsultLabJoin',
              'status',
            ),
            startedAt: BuiltValueNullFieldError.checkNotNull(
              startedAt,
              r'TeleconsultLabJoin',
              'startedAt',
            ),
            iceServers: iceServers.build(),
            turn: _turn?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iceServers';
        iceServers.build();
        _$failedField = 'turn';
        _turn?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'TeleconsultLabJoin',
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
