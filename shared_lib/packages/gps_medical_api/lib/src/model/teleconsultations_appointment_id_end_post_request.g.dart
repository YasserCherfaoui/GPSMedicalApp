// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teleconsultations_appointment_id_end_post_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TeleconsultationsAppointmentIdEndPostRequest
    extends TeleconsultationsAppointmentIdEndPostRequest {
  @override
  final int? durationSeconds;
  @override
  final int? qualityScore;

  factory _$TeleconsultationsAppointmentIdEndPostRequest([
    void Function(TeleconsultationsAppointmentIdEndPostRequestBuilder)? updates,
  ]) => (TeleconsultationsAppointmentIdEndPostRequestBuilder()..update(updates))
      ._build();

  _$TeleconsultationsAppointmentIdEndPostRequest._({
    this.durationSeconds,
    this.qualityScore,
  }) : super._();
  @override
  TeleconsultationsAppointmentIdEndPostRequest rebuild(
    void Function(TeleconsultationsAppointmentIdEndPostRequestBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  TeleconsultationsAppointmentIdEndPostRequestBuilder toBuilder() =>
      TeleconsultationsAppointmentIdEndPostRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TeleconsultationsAppointmentIdEndPostRequest &&
        durationSeconds == other.durationSeconds &&
        qualityScore == other.qualityScore;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, durationSeconds.hashCode);
    _$hash = $jc(_$hash, qualityScore.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'TeleconsultationsAppointmentIdEndPostRequest',
          )
          ..add('durationSeconds', durationSeconds)
          ..add('qualityScore', qualityScore))
        .toString();
  }
}

class TeleconsultationsAppointmentIdEndPostRequestBuilder
    implements
        Builder<
          TeleconsultationsAppointmentIdEndPostRequest,
          TeleconsultationsAppointmentIdEndPostRequestBuilder
        > {
  _$TeleconsultationsAppointmentIdEndPostRequest? _$v;

  int? _durationSeconds;
  int? get durationSeconds => _$this._durationSeconds;
  set durationSeconds(int? durationSeconds) =>
      _$this._durationSeconds = durationSeconds;

  int? _qualityScore;
  int? get qualityScore => _$this._qualityScore;
  set qualityScore(int? qualityScore) => _$this._qualityScore = qualityScore;

  TeleconsultationsAppointmentIdEndPostRequestBuilder() {
    TeleconsultationsAppointmentIdEndPostRequest._defaults(this);
  }

  TeleconsultationsAppointmentIdEndPostRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _durationSeconds = $v.durationSeconds;
      _qualityScore = $v.qualityScore;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TeleconsultationsAppointmentIdEndPostRequest other) {
    _$v = other as _$TeleconsultationsAppointmentIdEndPostRequest;
  }

  @override
  void update(
    void Function(TeleconsultationsAppointmentIdEndPostRequestBuilder)? updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  TeleconsultationsAppointmentIdEndPostRequest build() => _build();

  _$TeleconsultationsAppointmentIdEndPostRequest _build() {
    final _$result =
        _$v ??
        _$TeleconsultationsAppointmentIdEndPostRequest._(
          durationSeconds: durationSeconds,
          qualityScore: qualityScore,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
