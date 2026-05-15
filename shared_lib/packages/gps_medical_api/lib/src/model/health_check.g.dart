// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_check.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const HealthCheckStatusEnum _$healthCheckStatusEnum_ok =
    const HealthCheckStatusEnum._('ok');
const HealthCheckStatusEnum _$healthCheckStatusEnum_degraded =
    const HealthCheckStatusEnum._('degraded');

HealthCheckStatusEnum _$healthCheckStatusEnumValueOf(String name) {
  switch (name) {
    case 'ok':
      return _$healthCheckStatusEnum_ok;
    case 'degraded':
      return _$healthCheckStatusEnum_degraded;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<HealthCheckStatusEnum> _$healthCheckStatusEnumValues =
    BuiltSet<HealthCheckStatusEnum>(const <HealthCheckStatusEnum>[
      _$healthCheckStatusEnum_ok,
      _$healthCheckStatusEnum_degraded,
    ]);

const HealthCheckDbEnum _$healthCheckDbEnum_ok = const HealthCheckDbEnum._(
  'ok',
);
const HealthCheckDbEnum _$healthCheckDbEnum_error = const HealthCheckDbEnum._(
  'error',
);

HealthCheckDbEnum _$healthCheckDbEnumValueOf(String name) {
  switch (name) {
    case 'ok':
      return _$healthCheckDbEnum_ok;
    case 'error':
      return _$healthCheckDbEnum_error;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<HealthCheckDbEnum> _$healthCheckDbEnumValues =
    BuiltSet<HealthCheckDbEnum>(const <HealthCheckDbEnum>[
      _$healthCheckDbEnum_ok,
      _$healthCheckDbEnum_error,
    ]);

const HealthCheckRedisEnum _$healthCheckRedisEnum_ok =
    const HealthCheckRedisEnum._('ok');
const HealthCheckRedisEnum _$healthCheckRedisEnum_error =
    const HealthCheckRedisEnum._('error');

HealthCheckRedisEnum _$healthCheckRedisEnumValueOf(String name) {
  switch (name) {
    case 'ok':
      return _$healthCheckRedisEnum_ok;
    case 'error':
      return _$healthCheckRedisEnum_error;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<HealthCheckRedisEnum> _$healthCheckRedisEnumValues =
    BuiltSet<HealthCheckRedisEnum>(const <HealthCheckRedisEnum>[
      _$healthCheckRedisEnum_ok,
      _$healthCheckRedisEnum_error,
    ]);

const HealthCheckStorageEnum _$healthCheckStorageEnum_ok =
    const HealthCheckStorageEnum._('ok');
const HealthCheckStorageEnum _$healthCheckStorageEnum_error =
    const HealthCheckStorageEnum._('error');
const HealthCheckStorageEnum _$healthCheckStorageEnum_disabled =
    const HealthCheckStorageEnum._('disabled');

HealthCheckStorageEnum _$healthCheckStorageEnumValueOf(String name) {
  switch (name) {
    case 'ok':
      return _$healthCheckStorageEnum_ok;
    case 'error':
      return _$healthCheckStorageEnum_error;
    case 'disabled':
      return _$healthCheckStorageEnum_disabled;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<HealthCheckStorageEnum> _$healthCheckStorageEnumValues =
    BuiltSet<HealthCheckStorageEnum>(const <HealthCheckStorageEnum>[
      _$healthCheckStorageEnum_ok,
      _$healthCheckStorageEnum_error,
      _$healthCheckStorageEnum_disabled,
    ]);

Serializer<HealthCheckStatusEnum> _$healthCheckStatusEnumSerializer =
    _$HealthCheckStatusEnumSerializer();
Serializer<HealthCheckDbEnum> _$healthCheckDbEnumSerializer =
    _$HealthCheckDbEnumSerializer();
Serializer<HealthCheckRedisEnum> _$healthCheckRedisEnumSerializer =
    _$HealthCheckRedisEnumSerializer();
Serializer<HealthCheckStorageEnum> _$healthCheckStorageEnumSerializer =
    _$HealthCheckStorageEnumSerializer();

class _$HealthCheckStatusEnumSerializer
    implements PrimitiveSerializer<HealthCheckStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'ok': 'ok',
    'degraded': 'degraded',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ok': 'ok',
    'degraded': 'degraded',
  };

  @override
  final Iterable<Type> types = const <Type>[HealthCheckStatusEnum];
  @override
  final String wireName = 'HealthCheckStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    HealthCheckStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  HealthCheckStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => HealthCheckStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$HealthCheckDbEnumSerializer
    implements PrimitiveSerializer<HealthCheckDbEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'ok': 'ok',
    'error': 'error',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ok': 'ok',
    'error': 'error',
  };

  @override
  final Iterable<Type> types = const <Type>[HealthCheckDbEnum];
  @override
  final String wireName = 'HealthCheckDbEnum';

  @override
  Object serialize(
    Serializers serializers,
    HealthCheckDbEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  HealthCheckDbEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => HealthCheckDbEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$HealthCheckRedisEnumSerializer
    implements PrimitiveSerializer<HealthCheckRedisEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'ok': 'ok',
    'error': 'error',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ok': 'ok',
    'error': 'error',
  };

  @override
  final Iterable<Type> types = const <Type>[HealthCheckRedisEnum];
  @override
  final String wireName = 'HealthCheckRedisEnum';

  @override
  Object serialize(
    Serializers serializers,
    HealthCheckRedisEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  HealthCheckRedisEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => HealthCheckRedisEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$HealthCheckStorageEnumSerializer
    implements PrimitiveSerializer<HealthCheckStorageEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'ok': 'ok',
    'error': 'error',
    'disabled': 'disabled',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ok': 'ok',
    'error': 'error',
    'disabled': 'disabled',
  };

  @override
  final Iterable<Type> types = const <Type>[HealthCheckStorageEnum];
  @override
  final String wireName = 'HealthCheckStorageEnum';

  @override
  Object serialize(
    Serializers serializers,
    HealthCheckStorageEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  HealthCheckStorageEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => HealthCheckStorageEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$HealthCheck extends HealthCheck {
  @override
  final HealthCheckStatusEnum status;
  @override
  final HealthCheckDbEnum db;
  @override
  final HealthCheckRedisEnum redis;
  @override
  final HealthCheckStorageEnum storage;

  factory _$HealthCheck([void Function(HealthCheckBuilder)? updates]) =>
      (HealthCheckBuilder()..update(updates))._build();

  _$HealthCheck._({
    required this.status,
    required this.db,
    required this.redis,
    required this.storage,
  }) : super._();
  @override
  HealthCheck rebuild(void Function(HealthCheckBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthCheckBuilder toBuilder() => HealthCheckBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthCheck &&
        status == other.status &&
        db == other.db &&
        redis == other.redis &&
        storage == other.storage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, db.hashCode);
    _$hash = $jc(_$hash, redis.hashCode);
    _$hash = $jc(_$hash, storage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HealthCheck')
          ..add('status', status)
          ..add('db', db)
          ..add('redis', redis)
          ..add('storage', storage))
        .toString();
  }
}

class HealthCheckBuilder implements Builder<HealthCheck, HealthCheckBuilder> {
  _$HealthCheck? _$v;

  HealthCheckStatusEnum? _status;
  HealthCheckStatusEnum? get status => _$this._status;
  set status(HealthCheckStatusEnum? status) => _$this._status = status;

  HealthCheckDbEnum? _db;
  HealthCheckDbEnum? get db => _$this._db;
  set db(HealthCheckDbEnum? db) => _$this._db = db;

  HealthCheckRedisEnum? _redis;
  HealthCheckRedisEnum? get redis => _$this._redis;
  set redis(HealthCheckRedisEnum? redis) => _$this._redis = redis;

  HealthCheckStorageEnum? _storage;
  HealthCheckStorageEnum? get storage => _$this._storage;
  set storage(HealthCheckStorageEnum? storage) => _$this._storage = storage;

  HealthCheckBuilder() {
    HealthCheck._defaults(this);
  }

  HealthCheckBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _db = $v.db;
      _redis = $v.redis;
      _storage = $v.storage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthCheck other) {
    _$v = other as _$HealthCheck;
  }

  @override
  void update(void Function(HealthCheckBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HealthCheck build() => _build();

  _$HealthCheck _build() {
    final _$result =
        _$v ??
        _$HealthCheck._(
          status: BuiltValueNullFieldError.checkNotNull(
            status,
            r'HealthCheck',
            'status',
          ),
          db: BuiltValueNullFieldError.checkNotNull(db, r'HealthCheck', 'db'),
          redis: BuiltValueNullFieldError.checkNotNull(
            redis,
            r'HealthCheck',
            'redis',
          ),
          storage: BuiltValueNullFieldError.checkNotNull(
            storage,
            r'HealthCheck',
            'storage',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
