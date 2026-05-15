// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_series.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TimeSeries extends TimeSeries {
  @override
  final String? metric;
  @override
  final String? granularity;
  @override
  final BuiltList<TimeSeriesPoint>? points;

  factory _$TimeSeries([void Function(TimeSeriesBuilder)? updates]) =>
      (TimeSeriesBuilder()..update(updates))._build();

  _$TimeSeries._({this.metric, this.granularity, this.points}) : super._();
  @override
  TimeSeries rebuild(void Function(TimeSeriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TimeSeriesBuilder toBuilder() => TimeSeriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TimeSeries &&
        metric == other.metric &&
        granularity == other.granularity &&
        points == other.points;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, metric.hashCode);
    _$hash = $jc(_$hash, granularity.hashCode);
    _$hash = $jc(_$hash, points.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TimeSeries')
          ..add('metric', metric)
          ..add('granularity', granularity)
          ..add('points', points))
        .toString();
  }
}

class TimeSeriesBuilder implements Builder<TimeSeries, TimeSeriesBuilder> {
  _$TimeSeries? _$v;

  String? _metric;
  String? get metric => _$this._metric;
  set metric(String? metric) => _$this._metric = metric;

  String? _granularity;
  String? get granularity => _$this._granularity;
  set granularity(String? granularity) => _$this._granularity = granularity;

  ListBuilder<TimeSeriesPoint>? _points;
  ListBuilder<TimeSeriesPoint> get points =>
      _$this._points ??= ListBuilder<TimeSeriesPoint>();
  set points(ListBuilder<TimeSeriesPoint>? points) => _$this._points = points;

  TimeSeriesBuilder() {
    TimeSeries._defaults(this);
  }

  TimeSeriesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _metric = $v.metric;
      _granularity = $v.granularity;
      _points = $v.points?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TimeSeries other) {
    _$v = other as _$TimeSeries;
  }

  @override
  void update(void Function(TimeSeriesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TimeSeries build() => _build();

  _$TimeSeries _build() {
    _$TimeSeries _$result;
    try {
      _$result =
          _$v ??
          _$TimeSeries._(
            metric: metric,
            granularity: granularity,
            points: _points?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'points';
        _points?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'TimeSeries',
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
