// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_entry.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuditEntry extends AuditEntry {
  @override
  final String? id;
  @override
  final String? actorId;
  @override
  final String? actorRole;
  @override
  final String? action;
  @override
  final String? targetType;
  @override
  final String? targetId;
  @override
  final String? ipAddress;
  @override
  final String? userAgent;
  @override
  final BuiltMap<String, JsonObject?>? metadata;
  @override
  final DateTime? createdAt;

  factory _$AuditEntry([void Function(AuditEntryBuilder)? updates]) =>
      (AuditEntryBuilder()..update(updates))._build();

  _$AuditEntry._({
    this.id,
    this.actorId,
    this.actorRole,
    this.action,
    this.targetType,
    this.targetId,
    this.ipAddress,
    this.userAgent,
    this.metadata,
    this.createdAt,
  }) : super._();
  @override
  AuditEntry rebuild(void Function(AuditEntryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuditEntryBuilder toBuilder() => AuditEntryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuditEntry &&
        id == other.id &&
        actorId == other.actorId &&
        actorRole == other.actorRole &&
        action == other.action &&
        targetType == other.targetType &&
        targetId == other.targetId &&
        ipAddress == other.ipAddress &&
        userAgent == other.userAgent &&
        metadata == other.metadata &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, actorId.hashCode);
    _$hash = $jc(_$hash, actorRole.hashCode);
    _$hash = $jc(_$hash, action.hashCode);
    _$hash = $jc(_$hash, targetType.hashCode);
    _$hash = $jc(_$hash, targetId.hashCode);
    _$hash = $jc(_$hash, ipAddress.hashCode);
    _$hash = $jc(_$hash, userAgent.hashCode);
    _$hash = $jc(_$hash, metadata.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuditEntry')
          ..add('id', id)
          ..add('actorId', actorId)
          ..add('actorRole', actorRole)
          ..add('action', action)
          ..add('targetType', targetType)
          ..add('targetId', targetId)
          ..add('ipAddress', ipAddress)
          ..add('userAgent', userAgent)
          ..add('metadata', metadata)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class AuditEntryBuilder implements Builder<AuditEntry, AuditEntryBuilder> {
  _$AuditEntry? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _actorId;
  String? get actorId => _$this._actorId;
  set actorId(String? actorId) => _$this._actorId = actorId;

  String? _actorRole;
  String? get actorRole => _$this._actorRole;
  set actorRole(String? actorRole) => _$this._actorRole = actorRole;

  String? _action;
  String? get action => _$this._action;
  set action(String? action) => _$this._action = action;

  String? _targetType;
  String? get targetType => _$this._targetType;
  set targetType(String? targetType) => _$this._targetType = targetType;

  String? _targetId;
  String? get targetId => _$this._targetId;
  set targetId(String? targetId) => _$this._targetId = targetId;

  String? _ipAddress;
  String? get ipAddress => _$this._ipAddress;
  set ipAddress(String? ipAddress) => _$this._ipAddress = ipAddress;

  String? _userAgent;
  String? get userAgent => _$this._userAgent;
  set userAgent(String? userAgent) => _$this._userAgent = userAgent;

  MapBuilder<String, JsonObject?>? _metadata;
  MapBuilder<String, JsonObject?> get metadata =>
      _$this._metadata ??= MapBuilder<String, JsonObject?>();
  set metadata(MapBuilder<String, JsonObject?>? metadata) =>
      _$this._metadata = metadata;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  AuditEntryBuilder() {
    AuditEntry._defaults(this);
  }

  AuditEntryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _actorId = $v.actorId;
      _actorRole = $v.actorRole;
      _action = $v.action;
      _targetType = $v.targetType;
      _targetId = $v.targetId;
      _ipAddress = $v.ipAddress;
      _userAgent = $v.userAgent;
      _metadata = $v.metadata?.toBuilder();
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuditEntry other) {
    _$v = other as _$AuditEntry;
  }

  @override
  void update(void Function(AuditEntryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuditEntry build() => _build();

  _$AuditEntry _build() {
    _$AuditEntry _$result;
    try {
      _$result =
          _$v ??
          _$AuditEntry._(
            id: id,
            actorId: actorId,
            actorRole: actorRole,
            action: action,
            targetType: targetType,
            targetId: targetId,
            ipAddress: ipAddress,
            userAgent: userAgent,
            metadata: _metadata?.build(),
            createdAt: createdAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'metadata';
        _metadata?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'AuditEntry',
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
