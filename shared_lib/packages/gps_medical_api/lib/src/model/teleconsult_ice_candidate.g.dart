// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teleconsult_ice_candidate.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TeleconsultIceCandidate extends TeleconsultIceCandidate {
  @override
  final String? candidate;
  @override
  final String? sdpMid;
  @override
  final int? sdpMlineIndex;

  factory _$TeleconsultIceCandidate([
    void Function(TeleconsultIceCandidateBuilder)? updates,
  ]) => (TeleconsultIceCandidateBuilder()..update(updates))._build();

  _$TeleconsultIceCandidate._({this.candidate, this.sdpMid, this.sdpMlineIndex})
    : super._();
  @override
  TeleconsultIceCandidate rebuild(
    void Function(TeleconsultIceCandidateBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  TeleconsultIceCandidateBuilder toBuilder() =>
      TeleconsultIceCandidateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TeleconsultIceCandidate &&
        candidate == other.candidate &&
        sdpMid == other.sdpMid &&
        sdpMlineIndex == other.sdpMlineIndex;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, candidate.hashCode);
    _$hash = $jc(_$hash, sdpMid.hashCode);
    _$hash = $jc(_$hash, sdpMlineIndex.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TeleconsultIceCandidate')
          ..add('candidate', candidate)
          ..add('sdpMid', sdpMid)
          ..add('sdpMlineIndex', sdpMlineIndex))
        .toString();
  }
}

class TeleconsultIceCandidateBuilder
    implements
        Builder<TeleconsultIceCandidate, TeleconsultIceCandidateBuilder> {
  _$TeleconsultIceCandidate? _$v;

  String? _candidate;
  String? get candidate => _$this._candidate;
  set candidate(String? candidate) => _$this._candidate = candidate;

  String? _sdpMid;
  String? get sdpMid => _$this._sdpMid;
  set sdpMid(String? sdpMid) => _$this._sdpMid = sdpMid;

  int? _sdpMlineIndex;
  int? get sdpMlineIndex => _$this._sdpMlineIndex;
  set sdpMlineIndex(int? sdpMlineIndex) =>
      _$this._sdpMlineIndex = sdpMlineIndex;

  TeleconsultIceCandidateBuilder() {
    TeleconsultIceCandidate._defaults(this);
  }

  TeleconsultIceCandidateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _candidate = $v.candidate;
      _sdpMid = $v.sdpMid;
      _sdpMlineIndex = $v.sdpMlineIndex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TeleconsultIceCandidate other) {
    _$v = other as _$TeleconsultIceCandidate;
  }

  @override
  void update(void Function(TeleconsultIceCandidateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TeleconsultIceCandidate build() => _build();

  _$TeleconsultIceCandidate _build() {
    final _$result =
        _$v ??
        _$TeleconsultIceCandidate._(
          candidate: candidate,
          sdpMid: sdpMid,
          sdpMlineIndex: sdpMlineIndex,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
