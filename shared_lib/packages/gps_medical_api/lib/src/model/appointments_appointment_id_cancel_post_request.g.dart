// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_appointment_id_cancel_post_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppointmentsAppointmentIdCancelPostRequest
    extends AppointmentsAppointmentIdCancelPostRequest {
  @override
  final String? reason;

  factory _$AppointmentsAppointmentIdCancelPostRequest([
    void Function(AppointmentsAppointmentIdCancelPostRequestBuilder)? updates,
  ]) => (AppointmentsAppointmentIdCancelPostRequestBuilder()..update(updates))
      ._build();

  _$AppointmentsAppointmentIdCancelPostRequest._({this.reason}) : super._();
  @override
  AppointmentsAppointmentIdCancelPostRequest rebuild(
    void Function(AppointmentsAppointmentIdCancelPostRequestBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  AppointmentsAppointmentIdCancelPostRequestBuilder toBuilder() =>
      AppointmentsAppointmentIdCancelPostRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppointmentsAppointmentIdCancelPostRequest &&
        reason == other.reason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
      r'AppointmentsAppointmentIdCancelPostRequest',
    )..add('reason', reason)).toString();
  }
}

class AppointmentsAppointmentIdCancelPostRequestBuilder
    implements
        Builder<
          AppointmentsAppointmentIdCancelPostRequest,
          AppointmentsAppointmentIdCancelPostRequestBuilder
        > {
  _$AppointmentsAppointmentIdCancelPostRequest? _$v;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  AppointmentsAppointmentIdCancelPostRequestBuilder() {
    AppointmentsAppointmentIdCancelPostRequest._defaults(this);
  }

  AppointmentsAppointmentIdCancelPostRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reason = $v.reason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppointmentsAppointmentIdCancelPostRequest other) {
    _$v = other as _$AppointmentsAppointmentIdCancelPostRequest;
  }

  @override
  void update(
    void Function(AppointmentsAppointmentIdCancelPostRequestBuilder)? updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  AppointmentsAppointmentIdCancelPostRequest build() => _build();

  _$AppointmentsAppointmentIdCancelPostRequest _build() {
    final _$result =
        _$v ?? _$AppointmentsAppointmentIdCancelPostRequest._(reason: reason);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
