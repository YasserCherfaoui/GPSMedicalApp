// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funnel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Funnel extends Funnel {
  @override
  final int? searches;
  @override
  final int? doctorViews;
  @override
  final int? bookingStarted;
  @override
  final int? bookingCompleted;
  @override
  final int? consultationsCompleted;

  factory _$Funnel([void Function(FunnelBuilder)? updates]) =>
      (FunnelBuilder()..update(updates))._build();

  _$Funnel._({
    this.searches,
    this.doctorViews,
    this.bookingStarted,
    this.bookingCompleted,
    this.consultationsCompleted,
  }) : super._();
  @override
  Funnel rebuild(void Function(FunnelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FunnelBuilder toBuilder() => FunnelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Funnel &&
        searches == other.searches &&
        doctorViews == other.doctorViews &&
        bookingStarted == other.bookingStarted &&
        bookingCompleted == other.bookingCompleted &&
        consultationsCompleted == other.consultationsCompleted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, searches.hashCode);
    _$hash = $jc(_$hash, doctorViews.hashCode);
    _$hash = $jc(_$hash, bookingStarted.hashCode);
    _$hash = $jc(_$hash, bookingCompleted.hashCode);
    _$hash = $jc(_$hash, consultationsCompleted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Funnel')
          ..add('searches', searches)
          ..add('doctorViews', doctorViews)
          ..add('bookingStarted', bookingStarted)
          ..add('bookingCompleted', bookingCompleted)
          ..add('consultationsCompleted', consultationsCompleted))
        .toString();
  }
}

class FunnelBuilder implements Builder<Funnel, FunnelBuilder> {
  _$Funnel? _$v;

  int? _searches;
  int? get searches => _$this._searches;
  set searches(int? searches) => _$this._searches = searches;

  int? _doctorViews;
  int? get doctorViews => _$this._doctorViews;
  set doctorViews(int? doctorViews) => _$this._doctorViews = doctorViews;

  int? _bookingStarted;
  int? get bookingStarted => _$this._bookingStarted;
  set bookingStarted(int? bookingStarted) =>
      _$this._bookingStarted = bookingStarted;

  int? _bookingCompleted;
  int? get bookingCompleted => _$this._bookingCompleted;
  set bookingCompleted(int? bookingCompleted) =>
      _$this._bookingCompleted = bookingCompleted;

  int? _consultationsCompleted;
  int? get consultationsCompleted => _$this._consultationsCompleted;
  set consultationsCompleted(int? consultationsCompleted) =>
      _$this._consultationsCompleted = consultationsCompleted;

  FunnelBuilder() {
    Funnel._defaults(this);
  }

  FunnelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _searches = $v.searches;
      _doctorViews = $v.doctorViews;
      _bookingStarted = $v.bookingStarted;
      _bookingCompleted = $v.bookingCompleted;
      _consultationsCompleted = $v.consultationsCompleted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Funnel other) {
    _$v = other as _$Funnel;
  }

  @override
  void update(void Function(FunnelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Funnel build() => _build();

  _$Funnel _build() {
    final _$result =
        _$v ??
        _$Funnel._(
          searches: searches,
          doctorViews: doctorViews,
          bookingStarted: bookingStarted,
          bookingCompleted: bookingCompleted,
          consultationsCompleted: consultationsCompleted,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
