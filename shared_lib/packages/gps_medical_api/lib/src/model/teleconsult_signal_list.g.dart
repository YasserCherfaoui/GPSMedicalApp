// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teleconsult_signal_list.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TeleconsultSignalList extends TeleconsultSignalList {
  @override
  final BuiltList<TeleconsultSignal> signals;

  factory _$TeleconsultSignalList([
    void Function(TeleconsultSignalListBuilder)? updates,
  ]) => (TeleconsultSignalListBuilder()..update(updates))._build();

  _$TeleconsultSignalList._({required this.signals}) : super._();
  @override
  TeleconsultSignalList rebuild(
    void Function(TeleconsultSignalListBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  TeleconsultSignalListBuilder toBuilder() =>
      TeleconsultSignalListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TeleconsultSignalList && signals == other.signals;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, signals.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
      r'TeleconsultSignalList',
    )..add('signals', signals)).toString();
  }
}

class TeleconsultSignalListBuilder
    implements Builder<TeleconsultSignalList, TeleconsultSignalListBuilder> {
  _$TeleconsultSignalList? _$v;

  ListBuilder<TeleconsultSignal>? _signals;
  ListBuilder<TeleconsultSignal> get signals =>
      _$this._signals ??= ListBuilder<TeleconsultSignal>();
  set signals(ListBuilder<TeleconsultSignal>? signals) =>
      _$this._signals = signals;

  TeleconsultSignalListBuilder() {
    TeleconsultSignalList._defaults(this);
  }

  TeleconsultSignalListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _signals = $v.signals.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TeleconsultSignalList other) {
    _$v = other as _$TeleconsultSignalList;
  }

  @override
  void update(void Function(TeleconsultSignalListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TeleconsultSignalList build() => _build();

  _$TeleconsultSignalList _build() {
    _$TeleconsultSignalList _$result;
    try {
      _$result = _$v ?? _$TeleconsultSignalList._(signals: signals.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'signals';
        signals.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'TeleconsultSignalList',
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
