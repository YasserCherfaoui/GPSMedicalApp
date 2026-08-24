// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teleconsult_signal.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TeleconsultSignal extends TeleconsultSignal {
  @override
  final int seq;
  @override
  final TeleconsultSignalType type;
  @override
  final String? sdp;
  @override
  final TeleconsultIceCandidate? candidate;
  @override
  final DateTime createdAt;

  factory _$TeleconsultSignal([
    void Function(TeleconsultSignalBuilder)? updates,
  ]) => (TeleconsultSignalBuilder()..update(updates))._build();

  _$TeleconsultSignal._({
    required this.seq,
    required this.type,
    this.sdp,
    this.candidate,
    required this.createdAt,
  }) : super._();
  @override
  TeleconsultSignal rebuild(void Function(TeleconsultSignalBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TeleconsultSignalBuilder toBuilder() =>
      TeleconsultSignalBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TeleconsultSignal &&
        seq == other.seq &&
        type == other.type &&
        sdp == other.sdp &&
        candidate == other.candidate &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, seq.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, sdp.hashCode);
    _$hash = $jc(_$hash, candidate.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TeleconsultSignal')
          ..add('seq', seq)
          ..add('type', type)
          ..add('sdp', sdp)
          ..add('candidate', candidate)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class TeleconsultSignalBuilder
    implements Builder<TeleconsultSignal, TeleconsultSignalBuilder> {
  _$TeleconsultSignal? _$v;

  int? _seq;
  int? get seq => _$this._seq;
  set seq(int? seq) => _$this._seq = seq;

  TeleconsultSignalType? _type;
  TeleconsultSignalType? get type => _$this._type;
  set type(TeleconsultSignalType? type) => _$this._type = type;

  String? _sdp;
  String? get sdp => _$this._sdp;
  set sdp(String? sdp) => _$this._sdp = sdp;

  TeleconsultIceCandidateBuilder? _candidate;
  TeleconsultIceCandidateBuilder get candidate =>
      _$this._candidate ??= TeleconsultIceCandidateBuilder();
  set candidate(TeleconsultIceCandidateBuilder? candidate) =>
      _$this._candidate = candidate;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  TeleconsultSignalBuilder() {
    TeleconsultSignal._defaults(this);
  }

  TeleconsultSignalBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _seq = $v.seq;
      _type = $v.type;
      _sdp = $v.sdp;
      _candidate = $v.candidate?.toBuilder();
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TeleconsultSignal other) {
    _$v = other as _$TeleconsultSignal;
  }

  @override
  void update(void Function(TeleconsultSignalBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TeleconsultSignal build() => _build();

  _$TeleconsultSignal _build() {
    _$TeleconsultSignal _$result;
    try {
      _$result =
          _$v ??
          _$TeleconsultSignal._(
            seq: BuiltValueNullFieldError.checkNotNull(
              seq,
              r'TeleconsultSignal',
              'seq',
            ),
            type: BuiltValueNullFieldError.checkNotNull(
              type,
              r'TeleconsultSignal',
              'type',
            ),
            sdp: sdp,
            candidate: _candidate?.build(),
            createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt,
              r'TeleconsultSignal',
              'createdAt',
            ),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'candidate';
        _candidate?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'TeleconsultSignal',
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
