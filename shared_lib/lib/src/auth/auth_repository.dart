import 'package:gps_medical_api/gps_medical_api.dart';

import '../models/app_info.dart';
import 'auth_exception.dart';
import 'registration_draft.dart';

/// Auth operations used by onboarding and login screens.
abstract interface class AuthRepository {
  Future<RegisterResponse> register({
    required RegistrationDraft draft,
    required GpsMedicalClientKind role,
  });

  Future<TokenPair> verifyRegistrationOtp({
    required String phoneE164,
    required String code,
  });

  Future<void> resendOtp({required String phoneE164});

  Future<TokenPair> login({
    required String phoneE164,
    required String password,
  });

  Future<void> forgotPassword({required String phoneE164});

  Future<TokenPair> resetPassword({
    required String phoneE164,
    required String code,
    required String newPassword,
  });
}

/// Week 3 mock — deterministic OTP `123456`, simulated latency.
class MockAuthRepository implements AuthRepository {
  MockAuthRepository({
    this.otpCode = '123456',
    this.simulatedDelay = const Duration(milliseconds: 400),
    this.failNextCall = false,
  });

  final String otpCode;
  final Duration simulatedDelay;
  bool failNextCall;

  static const mockOtpHint = '123456';

  @override
  Future<RegisterResponse> register({
    required RegistrationDraft draft,
    required GpsMedicalClientKind role,
  }) async {
    await Future<void>.delayed(simulatedDelay);
    if (failNextCall) {
      failNextCall = false;
      throw const AuthNetworkException('Réseau indisponible (mock).');
    }
    if (!draft.readyToRegister) {
      throw const AuthValidationException(
        'Informations d\'inscription incomplètes.',
      );
    }
    return RegisterResponse(
      (b) => b
        ..userId = '00000000-0000-4000-8000-000000000001'
        ..otpExpiresAt = DateTime.now().add(const Duration(minutes: 5))
        ..ninVerificationStatus =
            RegisterResponseNinVerificationStatusEnum.pending,
    );
  }

  @override
  Future<TokenPair> verifyRegistrationOtp({
    required String phoneE164,
    required String code,
  }) async {
    await Future<void>.delayed(simulatedDelay);
    if (failNextCall) {
      failNextCall = false;
      throw const AuthNetworkException('Réseau indisponible (mock).');
    }
    if (code != otpCode) {
      throw const AuthUnauthorizedException('Code OTP incorrect.');
    }
    return _mockTokens();
  }

  @override
  Future<void> resendOtp({required String phoneE164}) async {
    await Future<void>.delayed(simulatedDelay);
    if (failNextCall) {
      failNextCall = false;
      throw const AuthNetworkException('Réseau indisponible (mock).');
    }
  }

  @override
  Future<TokenPair> login({
    required String phoneE164,
    required String password,
  }) async {
    await Future<void>.delayed(simulatedDelay);
    if (failNextCall) {
      failNextCall = false;
      throw const AuthNetworkException('Réseau indisponible (mock).');
    }
    if (password.length < 10) {
      throw const AuthUnauthorizedException('Identifiants incorrects.');
    }
    return _mockTokens();
  }

  @override
  Future<void> forgotPassword({required String phoneE164}) async {
    await Future<void>.delayed(simulatedDelay);
    if (failNextCall) {
      failNextCall = false;
      throw const AuthNetworkException('Réseau indisponible (mock).');
    }
  }

  @override
  Future<TokenPair> resetPassword({
    required String phoneE164,
    required String code,
    required String newPassword,
  }) async {
    await Future<void>.delayed(simulatedDelay);
    if (failNextCall) {
      failNextCall = false;
      throw const AuthNetworkException('Réseau indisponible (mock).');
    }
    if (code != otpCode) {
      throw const AuthUnauthorizedException('Code OTP incorrect.');
    }
    return _mockTokens();
  }

  TokenPair _mockTokens() => TokenPair(
    (b) => b
      ..accessToken = 'mock-access-token'
      ..refreshToken = 'mock-refresh-token'
      ..expiresIn = 3600,
  );
}
