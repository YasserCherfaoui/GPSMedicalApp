import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

import '../client/phase1_api.dart';
import '../models/app_info.dart';
import 'auth_exception.dart';
import 'auth_repository.dart';
import 'registration_draft.dart';

/// [AuthRepository] backed by the Phase 1 HTTP API (OpenAPI client).
class ApiAuthRepository implements AuthRepository {
  ApiAuthRepository(this._phase1);

  final Phase1Api _phase1;

  RegisterRequestRoleEnum _role(GpsMedicalClientKind role) {
    switch (role) {
      case GpsMedicalClientKind.patient:
        return RegisterRequestRoleEnum.patient;
      case GpsMedicalClientKind.specialist:
        return RegisterRequestRoleEnum.specialist;
    }
  }

  void _throwIfNotNoContent(Response<dynamic> response) {
    if (response.statusCode == 204) {
      return;
    }
    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      type: DioExceptionType.badResponse,
    );
  }

  @override
  Future<void> checkRegisterNin(String nin) async {
    try {
      final response = await _phase1.checkRegisterNin(nin: nin);
      _throwIfNotNoContent(response);
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  @override
  Future<void> checkRegisterPhone(String phoneE164) async {
    try {
      final response = await _phase1.checkRegisterPhone(phone: phoneE164);
      _throwIfNotNoContent(response);
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  @override
  Future<RegisterResponse> register({
    required RegistrationDraft draft,
    required GpsMedicalClientKind role,
  }) async {
    if (!draft.readyToRegister) {
      throw const AuthValidationException(
        'Informations d\'inscription incomplètes.',
      );
    }
    final phone = draft.phoneE164!;
    final nin = draft.nin!;
    final password = draft.password!;
    final fullName = draft.fullName!.trim();

    try {
      final response = await _phase1.registerUser(
        registerRequest: RegisterRequest(
          (b) => b
            ..phone = phone
            ..nin = nin
            ..password = password
            ..role = _role(role)
            ..fullName = fullName
            ..consentDataProcessing = draft.consentDataProcessing
            ..consentHealthData = draft.consentHealthData
            ..consentAnpdpTerms = draft.consentAnpdpTerms
            ..consentMarketing = draft.consentMarketing,
        ),
      );
      final data = response.data;
      if (data == null) {
        throw const AuthNetworkException('Réponse vide du serveur.');
      }
      return data;
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  @override
  Future<TokenPair> verifyRegistrationOtp({
    required String phoneE164,
    required String code,
  }) async {
    try {
      final response = await _phase1.verifyOtp(
        otpVerifyRequest: OtpVerifyRequest(
          (b) => b
            ..phone = phoneE164
            ..code = code,
        ),
      );
      final data = response.data;
      if (data == null) {
        throw const AuthNetworkException('Réponse vide du serveur.');
      }
      return data;
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  @override
  Future<void> resendOtp({required String phoneE164}) async {
    try {
      await _phase1.resendOtp(
        resendOtpRequest: ResendOtpRequest((b) => b..phone = phoneE164),
      );
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  @override
  Future<TokenPair> login({
    required String phoneE164,
    required String password,
  }) async {
    try {
      final response = await _phase1.login(
        loginRequest: LoginRequest(
          (b) => b
            ..phone = phoneE164
            ..password = password,
        ),
      );
      final data = response.data;
      if (data == null) {
        throw const AuthNetworkException('Réponse vide du serveur.');
      }
      return data;
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  @override
  Future<void> forgotPassword({required String phoneE164}) async {
    try {
      await _phase1.forgotPassword(
        resendOtpRequest: ResendOtpRequest((b) => b..phone = phoneE164),
      );
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  @override
  Future<TokenPair> resetPassword({
    required String phoneE164,
    required String code,
    required String newPassword,
  }) async {
    try {
      await _phase1.resetPassword(
        passwordResetRequest: PasswordResetRequest(
          (b) => b
            ..phone = phoneE164
            ..code = code
            ..newPassword = newPassword,
        ),
      );
    } on DioException catch (e) {
      throw _mapDio(e);
    }
    try {
      final loginResponse = await _phase1.login(
        loginRequest: LoginRequest(
          (b) => b
            ..phone = phoneE164
            ..password = newPassword,
        ),
      );
      final data = loginResponse.data;
      if (data == null) {
        throw const AuthNetworkException(
          'Mot de passe mis à jour. Connectez-vous avec votre nouveau mot de passe.',
        );
      }
      return data;
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  AuthException _mapDio(DioException e) {
    const fallback = 'Erreur réseau. Réessayez.';
    if (e.response == null &&
        (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.connectionError ||
            e.type == DioExceptionType.unknown)) {
      return const AuthNetworkException(fallback);
    }

    final response = e.response;
    if (response == null) {
      return const AuthNetworkException(fallback);
    }

    final statusCode = response.statusCode ?? 0;
    final message = _parseErrorPayload(response.data) ?? fallback;

    if (statusCode == 401 || statusCode == 403) {
      return AuthUnauthorizedException(message);
    }
    if (statusCode == 409) {
      return AuthConflictException(message);
    }
    if (statusCode == 400 || statusCode == 422) {
      return AuthValidationException(message);
    }
    return AuthNetworkException(message);
  }
}

String? _parseErrorPayload(Object? data) {
  if (data is! Map) {
    return null;
  }
  final raw = Map<String, Object?>.from(data);

  try {
    final deserialized = standardSerializers.deserialize(
      raw,
      specifiedType: const FullType(ValidationProblem),
    );
    if (deserialized is ValidationProblem) {
      return _validationProblemMessage(deserialized);
    }
  } catch (_) {}

  try {
    final deserialized = standardSerializers.deserialize(
      raw,
      specifiedType: const FullType($Problem),
    );
    if (deserialized is $Problem) {
      final detail = deserialized.detail;
      if (detail != null && detail.isNotEmpty) {
        return detail;
      }
      return deserialized.title;
    }
  } catch (_) {}

  return null;
}

String _validationProblemMessage(ValidationProblem vp) {
  final errors = vp.errors;
  if (errors != null && errors.isNotEmpty) {
    final first = errors.first.message;
    if (first != null && first.isNotEmpty) {
      return first;
    }
  }
  final detail = vp.detail;
  if (detail != null && detail.isNotEmpty) {
    return detail;
  }
  return vp.title;
}
