// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_test_push_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminTestPushResponse extends AdminTestPushResponse {
  @override
  final String userId;
  @override
  final int deviceCount;
  @override
  final int sent;
  @override
  final int failed;
  @override
  final BuiltList<AdminTestPushDeviceResult> results;

  factory _$AdminTestPushResponse([
    void Function(AdminTestPushResponseBuilder)? updates,
  ]) => (AdminTestPushResponseBuilder()..update(updates))._build();

  _$AdminTestPushResponse._({
    required this.userId,
    required this.deviceCount,
    required this.sent,
    required this.failed,
    required this.results,
  }) : super._();
  @override
  AdminTestPushResponse rebuild(
    void Function(AdminTestPushResponseBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  AdminTestPushResponseBuilder toBuilder() =>
      AdminTestPushResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminTestPushResponse &&
        userId == other.userId &&
        deviceCount == other.deviceCount &&
        sent == other.sent &&
        failed == other.failed &&
        results == other.results;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, deviceCount.hashCode);
    _$hash = $jc(_$hash, sent.hashCode);
    _$hash = $jc(_$hash, failed.hashCode);
    _$hash = $jc(_$hash, results.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminTestPushResponse')
          ..add('userId', userId)
          ..add('deviceCount', deviceCount)
          ..add('sent', sent)
          ..add('failed', failed)
          ..add('results', results))
        .toString();
  }
}

class AdminTestPushResponseBuilder
    implements Builder<AdminTestPushResponse, AdminTestPushResponseBuilder> {
  _$AdminTestPushResponse? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  int? _deviceCount;
  int? get deviceCount => _$this._deviceCount;
  set deviceCount(int? deviceCount) => _$this._deviceCount = deviceCount;

  int? _sent;
  int? get sent => _$this._sent;
  set sent(int? sent) => _$this._sent = sent;

  int? _failed;
  int? get failed => _$this._failed;
  set failed(int? failed) => _$this._failed = failed;

  ListBuilder<AdminTestPushDeviceResult>? _results;
  ListBuilder<AdminTestPushDeviceResult> get results =>
      _$this._results ??= ListBuilder<AdminTestPushDeviceResult>();
  set results(ListBuilder<AdminTestPushDeviceResult>? results) =>
      _$this._results = results;

  AdminTestPushResponseBuilder() {
    AdminTestPushResponse._defaults(this);
  }

  AdminTestPushResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _deviceCount = $v.deviceCount;
      _sent = $v.sent;
      _failed = $v.failed;
      _results = $v.results.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminTestPushResponse other) {
    _$v = other as _$AdminTestPushResponse;
  }

  @override
  void update(void Function(AdminTestPushResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminTestPushResponse build() => _build();

  _$AdminTestPushResponse _build() {
    _$AdminTestPushResponse _$result;
    try {
      _$result =
          _$v ??
          _$AdminTestPushResponse._(
            userId: BuiltValueNullFieldError.checkNotNull(
              userId,
              r'AdminTestPushResponse',
              'userId',
            ),
            deviceCount: BuiltValueNullFieldError.checkNotNull(
              deviceCount,
              r'AdminTestPushResponse',
              'deviceCount',
            ),
            sent: BuiltValueNullFieldError.checkNotNull(
              sent,
              r'AdminTestPushResponse',
              'sent',
            ),
            failed: BuiltValueNullFieldError.checkNotNull(
              failed,
              r'AdminTestPushResponse',
              'failed',
            ),
            results: results.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'AdminTestPushResponse',
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
