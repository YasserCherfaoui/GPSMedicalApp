// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teleconsult_lab_signal_list.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TeleconsultLabSignalList extends TeleconsultLabSignalList {
  @override
  final BuiltList<TeleconsultSignal> signals;
  @override
  final int peerCount;

  factory _$TeleconsultLabSignalList([
    void Function(TeleconsultLabSignalListBuilder)? updates,
  ]) => (TeleconsultLabSignalListBuilder()..update(updates))._build();

  _$TeleconsultLabSignalList._({required this.signals, required this.peerCount})
    : super._();
  @override
  TeleconsultLabSignalList rebuild(
    void Function(TeleconsultLabSignalListBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  TeleconsultLabSignalListBuilder toBuilder() =>
      TeleconsultLabSignalListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TeleconsultLabSignalList &&
        signals == other.signals &&
        peerCount == other.peerCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, signals.hashCode);
    _$hash = $jc(_$hash, peerCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TeleconsultLabSignalList')
          ..add('signals', signals)
          ..add('peerCount', peerCount))
        .toString();
  }
}

class TeleconsultLabSignalListBuilder
    implements
        Builder<TeleconsultLabSignalList, TeleconsultLabSignalListBuilder> {
  _$TeleconsultLabSignalList? _$v;

  ListBuilder<TeleconsultSignal>? _signals;
  ListBuilder<TeleconsultSignal> get signals =>
      _$this._signals ??= ListBuilder<TeleconsultSignal>();
  set signals(ListBuilder<TeleconsultSignal>? signals) =>
      _$this._signals = signals;

  int? _peerCount;
  int? get peerCount => _$this._peerCount;
  set peerCount(int? peerCount) => _$this._peerCount = peerCount;

  TeleconsultLabSignalListBuilder() {
    TeleconsultLabSignalList._defaults(this);
  }

  TeleconsultLabSignalListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _signals = $v.signals.toBuilder();
      _peerCount = $v.peerCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TeleconsultLabSignalList other) {
    _$v = other as _$TeleconsultLabSignalList;
  }

  @override
  void update(void Function(TeleconsultLabSignalListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TeleconsultLabSignalList build() => _build();

  _$TeleconsultLabSignalList _build() {
    _$TeleconsultLabSignalList _$result;
    try {
      _$result =
          _$v ??
          _$TeleconsultLabSignalList._(
            signals: signals.build(),
            peerCount: BuiltValueNullFieldError.checkNotNull(
              peerCount,
              r'TeleconsultLabSignalList',
              'peerCount',
            ),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'signals';
        signals.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'TeleconsultLabSignalList',
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
