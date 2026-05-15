// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_registration.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DeviceRegistrationPlatformEnum _$deviceRegistrationPlatformEnum_ios =
    const DeviceRegistrationPlatformEnum._('ios');
const DeviceRegistrationPlatformEnum _$deviceRegistrationPlatformEnum_android =
    const DeviceRegistrationPlatformEnum._('android');
const DeviceRegistrationPlatformEnum _$deviceRegistrationPlatformEnum_web =
    const DeviceRegistrationPlatformEnum._('web');

DeviceRegistrationPlatformEnum _$deviceRegistrationPlatformEnumValueOf(
  String name,
) {
  switch (name) {
    case 'ios':
      return _$deviceRegistrationPlatformEnum_ios;
    case 'android':
      return _$deviceRegistrationPlatformEnum_android;
    case 'web':
      return _$deviceRegistrationPlatformEnum_web;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DeviceRegistrationPlatformEnum>
_$deviceRegistrationPlatformEnumValues =
    BuiltSet<DeviceRegistrationPlatformEnum>(
      const <DeviceRegistrationPlatformEnum>[
        _$deviceRegistrationPlatformEnum_ios,
        _$deviceRegistrationPlatformEnum_android,
        _$deviceRegistrationPlatformEnum_web,
      ],
    );

Serializer<DeviceRegistrationPlatformEnum>
_$deviceRegistrationPlatformEnumSerializer =
    _$DeviceRegistrationPlatformEnumSerializer();

class _$DeviceRegistrationPlatformEnumSerializer
    implements PrimitiveSerializer<DeviceRegistrationPlatformEnum> {
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
  final Iterable<Type> types = const <Type>[DeviceRegistrationPlatformEnum];
  @override
  final String wireName = 'DeviceRegistrationPlatformEnum';

  @override
  Object serialize(
    Serializers serializers,
    DeviceRegistrationPlatformEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  DeviceRegistrationPlatformEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => DeviceRegistrationPlatformEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$DeviceRegistration extends DeviceRegistration {
  @override
  final String fcmToken;
  @override
  final DeviceRegistrationPlatformEnum platform;
  @override
  final String? deviceModel;
  @override
  final String? appVersion;

  factory _$DeviceRegistration([
    void Function(DeviceRegistrationBuilder)? updates,
  ]) => (DeviceRegistrationBuilder()..update(updates))._build();

  _$DeviceRegistration._({
    required this.fcmToken,
    required this.platform,
    this.deviceModel,
    this.appVersion,
  }) : super._();
  @override
  DeviceRegistration rebuild(
    void Function(DeviceRegistrationBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  DeviceRegistrationBuilder toBuilder() =>
      DeviceRegistrationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeviceRegistration &&
        fcmToken == other.fcmToken &&
        platform == other.platform &&
        deviceModel == other.deviceModel &&
        appVersion == other.appVersion;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fcmToken.hashCode);
    _$hash = $jc(_$hash, platform.hashCode);
    _$hash = $jc(_$hash, deviceModel.hashCode);
    _$hash = $jc(_$hash, appVersion.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeviceRegistration')
          ..add('fcmToken', fcmToken)
          ..add('platform', platform)
          ..add('deviceModel', deviceModel)
          ..add('appVersion', appVersion))
        .toString();
  }
}

class DeviceRegistrationBuilder
    implements Builder<DeviceRegistration, DeviceRegistrationBuilder> {
  _$DeviceRegistration? _$v;

  String? _fcmToken;
  String? get fcmToken => _$this._fcmToken;
  set fcmToken(String? fcmToken) => _$this._fcmToken = fcmToken;

  DeviceRegistrationPlatformEnum? _platform;
  DeviceRegistrationPlatformEnum? get platform => _$this._platform;
  set platform(DeviceRegistrationPlatformEnum? platform) =>
      _$this._platform = platform;

  String? _deviceModel;
  String? get deviceModel => _$this._deviceModel;
  set deviceModel(String? deviceModel) => _$this._deviceModel = deviceModel;

  String? _appVersion;
  String? get appVersion => _$this._appVersion;
  set appVersion(String? appVersion) => _$this._appVersion = appVersion;

  DeviceRegistrationBuilder() {
    DeviceRegistration._defaults(this);
  }

  DeviceRegistrationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fcmToken = $v.fcmToken;
      _platform = $v.platform;
      _deviceModel = $v.deviceModel;
      _appVersion = $v.appVersion;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeviceRegistration other) {
    _$v = other as _$DeviceRegistration;
  }

  @override
  void update(void Function(DeviceRegistrationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeviceRegistration build() => _build();

  _$DeviceRegistration _build() {
    final _$result =
        _$v ??
        _$DeviceRegistration._(
          fcmToken: BuiltValueNullFieldError.checkNotNull(
            fcmToken,
            r'DeviceRegistration',
            'fcmToken',
          ),
          platform: BuiltValueNullFieldError.checkNotNull(
            platform,
            r'DeviceRegistration',
            'platform',
          ),
          deviceModel: deviceModel,
          appVersion: appVersion,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
