// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_test_push_device_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AdminTestPushDeviceResultPlatformEnum
_$adminTestPushDeviceResultPlatformEnum_ios =
    const AdminTestPushDeviceResultPlatformEnum._('ios');
const AdminTestPushDeviceResultPlatformEnum
_$adminTestPushDeviceResultPlatformEnum_android =
    const AdminTestPushDeviceResultPlatformEnum._('android');
const AdminTestPushDeviceResultPlatformEnum
_$adminTestPushDeviceResultPlatformEnum_web =
    const AdminTestPushDeviceResultPlatformEnum._('web');

AdminTestPushDeviceResultPlatformEnum
_$adminTestPushDeviceResultPlatformEnumValueOf(String name) {
  switch (name) {
    case 'ios':
      return _$adminTestPushDeviceResultPlatformEnum_ios;
    case 'android':
      return _$adminTestPushDeviceResultPlatformEnum_android;
    case 'web':
      return _$adminTestPushDeviceResultPlatformEnum_web;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AdminTestPushDeviceResultPlatformEnum>
_$adminTestPushDeviceResultPlatformEnumValues =
    BuiltSet<AdminTestPushDeviceResultPlatformEnum>(
      const <AdminTestPushDeviceResultPlatformEnum>[
        _$adminTestPushDeviceResultPlatformEnum_ios,
        _$adminTestPushDeviceResultPlatformEnum_android,
        _$adminTestPushDeviceResultPlatformEnum_web,
      ],
    );

Serializer<AdminTestPushDeviceResultPlatformEnum>
_$adminTestPushDeviceResultPlatformEnumSerializer =
    _$AdminTestPushDeviceResultPlatformEnumSerializer();

class _$AdminTestPushDeviceResultPlatformEnumSerializer
    implements PrimitiveSerializer<AdminTestPushDeviceResultPlatformEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'ios': 'ios',
    'android': 'android',
    'web': 'web',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ios': 'ios',
    'android': 'android',
    'web': 'web',
  };

  @override
  final Iterable<Type> types = const <Type>[
    AdminTestPushDeviceResultPlatformEnum,
  ];
  @override
  final String wireName = 'AdminTestPushDeviceResultPlatformEnum';

  @override
  Object serialize(
    Serializers serializers,
    AdminTestPushDeviceResultPlatformEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  AdminTestPushDeviceResultPlatformEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => AdminTestPushDeviceResultPlatformEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$AdminTestPushDeviceResult extends AdminTestPushDeviceResult {
  @override
  final String deviceId;
  @override
  final AdminTestPushDeviceResultPlatformEnum platform;
  @override
  final bool ok;
  @override
  final String? error;

  factory _$AdminTestPushDeviceResult([
    void Function(AdminTestPushDeviceResultBuilder)? updates,
  ]) => (AdminTestPushDeviceResultBuilder()..update(updates))._build();

  _$AdminTestPushDeviceResult._({
    required this.deviceId,
    required this.platform,
    required this.ok,
    this.error,
  }) : super._();
  @override
  AdminTestPushDeviceResult rebuild(
    void Function(AdminTestPushDeviceResultBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  AdminTestPushDeviceResultBuilder toBuilder() =>
      AdminTestPushDeviceResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminTestPushDeviceResult &&
        deviceId == other.deviceId &&
        platform == other.platform &&
        ok == other.ok &&
        error == other.error;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, platform.hashCode);
    _$hash = $jc(_$hash, ok.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminTestPushDeviceResult')
          ..add('deviceId', deviceId)
          ..add('platform', platform)
          ..add('ok', ok)
          ..add('error', error))
        .toString();
  }
}

class AdminTestPushDeviceResultBuilder
    implements
        Builder<AdminTestPushDeviceResult, AdminTestPushDeviceResultBuilder> {
  _$AdminTestPushDeviceResult? _$v;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  AdminTestPushDeviceResultPlatformEnum? _platform;
  AdminTestPushDeviceResultPlatformEnum? get platform => _$this._platform;
  set platform(AdminTestPushDeviceResultPlatformEnum? platform) =>
      _$this._platform = platform;

  bool? _ok;
  bool? get ok => _$this._ok;
  set ok(bool? ok) => _$this._ok = ok;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  AdminTestPushDeviceResultBuilder() {
    AdminTestPushDeviceResult._defaults(this);
  }

  AdminTestPushDeviceResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deviceId = $v.deviceId;
      _platform = $v.platform;
      _ok = $v.ok;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminTestPushDeviceResult other) {
    _$v = other as _$AdminTestPushDeviceResult;
  }

  @override
  void update(void Function(AdminTestPushDeviceResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminTestPushDeviceResult build() => _build();

  _$AdminTestPushDeviceResult _build() {
    final _$result =
        _$v ??
        _$AdminTestPushDeviceResult._(
          deviceId: BuiltValueNullFieldError.checkNotNull(
            deviceId,
            r'AdminTestPushDeviceResult',
            'deviceId',
          ),
          platform: BuiltValueNullFieldError.checkNotNull(
            platform,
            r'AdminTestPushDeviceResult',
            'platform',
          ),
          ok: BuiltValueNullFieldError.checkNotNull(
            ok,
            r'AdminTestPushDeviceResult',
            'ok',
          ),
          error: error,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
