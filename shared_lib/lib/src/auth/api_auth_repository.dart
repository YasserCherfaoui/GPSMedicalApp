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
    if (e.response == null) {
      final String networkMessage;
      final AuthErrorCode errorCode;
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        networkMessage =
            'Connexion expirée. Veuillez vérifier votre connexion Internet et réessayer.';
        errorCode = AuthErrorCode.connectionTimeout;
      } else if (e.type == DioExceptionType.connectionError) {
        networkMessage =
            'Impossible de se connecter au serveur. Veuillez vérifier votre connexion Internet.';
        errorCode = AuthErrorCode.connectionError;
      } else {
        networkMessage =
            'Erreur réseau. Veuillez vérifier votre connexion Internet et réessayer.';
        errorCode = AuthErrorCode.unknownNetwork;
      }
      return AuthNetworkException(networkMessage, errorCode: errorCode);
    }

    final response = e.response!;
    final statusCode = response.statusCode ?? 0;

    final parsedMessage = _parseErrorPayload(response.data);
    final String fallback;

    if (statusCode == 401) {
      fallback =
          'Identifiants incorrects. Veuillez vérifier votre numéro de téléphone et votre mot de passe.';
    } else if (statusCode == 403) {
      fallback = 'Accès refusé. Vous n\'avez pas les permissions nécessaires.';
    } else if (statusCode == 409) {
      fallback =
          'Un conflit est survenu (cette ressource existe peut-être déjà).';
    } else if (statusCode == 422 || statusCode == 400) {
      fallback = 'Les informations fournies sont invalides.';
    } else if (statusCode == 429) {
      fallback =
          'Trop de tentatives. Veuillez réessayer dans quelques minutes.';
    } else if (statusCode >= 500) {
      fallback = 'Erreur interne du serveur. Veuillez réessayer plus tard.';
    } else {
      fallback = 'Une erreur inattendue est survenue (Code: $statusCode).';
    }

    final message = parsedMessage ?? fallback;

    if (statusCode == 401) {
      return AuthUnauthorizedException(
        message,
        errorCode: AuthErrorCode.invalidCredentials,
      );
    }
    if (statusCode == 403) {
      return AuthUnauthorizedException(
        message,
        errorCode: AuthErrorCode.accessDenied,
      );
    }
    if (statusCode == 409) {
      return AuthConflictException(
        message,
        errorCode: AuthErrorCode.conflictError,
      );
    }
    if (statusCode == 400 || statusCode == 422) {
      return AuthValidationException(
        message,
        errorCode: AuthErrorCode.validationError,
      );
    }
    if (statusCode == 429) {
      return AuthNetworkException(
        message,
        errorCode: AuthErrorCode.tooManyRequests,
      );
    }
    if (statusCode >= 500) {
      return AuthNetworkException(
        message,
        errorCode: AuthErrorCode.internalServerError,
      );
    }
    return AuthNetworkException(
      message,
      errorCode: AuthErrorCode.unknownNetwork,
    );
  }
}

String? _parseErrorPayload(Object? data) {
  if (data is! Map) {
    if (data is String && data.isNotEmpty) {
      return data;
    }
    return null;
  }
  final raw = Map<String, Object?>.from(data);

  final keys = ['detail', 'message', 'error', 'error_description', 'title'];
  for (final key in keys) {
    final val = raw[key];
    if (val is String && val.isNotEmpty) {
      return val;
    }
  }

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
