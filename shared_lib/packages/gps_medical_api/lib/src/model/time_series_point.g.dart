// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_series_point.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TimeSeriesPoint extends TimeSeriesPoint {
  @override
  final DateTime? bucket;
  @override
  final num? value;

  factory _$TimeSeriesPoint([void Function(TimeSeriesPointBuilder)? updates]) =>
      (TimeSeriesPointBuilder()..update(updates))._build();

  _$TimeSeriesPoint._({this.bucket, this.value}) : super._();
  @override
  TimeSeriesPoint rebuild(void Function(TimeSeriesPointBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TimeSeriesPointBuilder toBuilder() => TimeSeriesPointBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TimeSeriesPoint &&
        bucket == other.bucket &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, bucket.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TimeSeriesPoint')
          ..add('bucket', bucket)
          ..add('value', value))
        .toString();
  }
}

class TimeSeriesPointBuilder
    implements Builder<TimeSeriesPoint, TimeSeriesPointBuilder> {
  _$TimeSeriesPoint? _$v;

  DateTime? _bucket;
  DateTime? get bucket => _$this._bucket;
  set bucket(DateTime? bucket) => _$this._bucket = bucket;

  num? _value;
  num? get value => _$this._value;
  set value(num? value) => _$this._value = value;

  TimeSeriesPointBuilder() {
    TimeSeriesPoint._defaults(this);
  }

  TimeSeriesPointBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bucket = $v.bucket;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TimeSeriesPoint other) {
    _$v = other as _$TimeSeriesPoint;
  }

  @override
  void update(void Function(TimeSeriesPointBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TimeSeriesPoint build() => _build();

  _$TimeSeriesPoint _build() {
    final _$result = _$v ?? _$TimeSeriesPoint._(bucket: bucket, value: value);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
