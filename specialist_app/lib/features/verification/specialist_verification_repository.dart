import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../routing/specialist_verification_status.dart';
import 'specialist_verification_state.dart';

class SpecialistVerificationRepository {
  SpecialistVerificationRepository(this._client);

  final GpsMedicalClient _client;

  SpecialistVerificationStatus mapApiStatus(
    DoctorPrivateVerificationStatusEnum? api,
  ) {
    return switch (api) {
      DoctorPrivateVerificationStatusEnum.approved =>
        SpecialistVerificationStatus.verified,
      DoctorPrivateVerificationStatusEnum.rejected =>
        SpecialistVerificationStatus.rejected,
      DoctorPrivateVerificationStatusEnum.inReview =>
        SpecialistVerificationStatus.moreInfo,
      DoctorPrivateVerificationStatusEnum.pending =>
        SpecialistVerificationStatus.pending,
      null => SpecialistVerificationStatus.pending,
      _ => SpecialistVerificationStatus.pending,
    };
  }

  Future<SpecialistVerificationState> fetch() async {
    try {
      final response = await _client.v1.dio.get<Map<String, dynamic>>(
        '/doctors/me',
      );
      final raw = response.data;
      if (raw == null) {
        return const SpecialistVerificationState(
          status: SpecialistVerificationStatus.pending,
        );
      }

      final profile =
          standardSerializers.deserialize(
                raw,
                specifiedType: const FullType(DoctorPrivate),
              )
              as DoctorPrivate;

      final comment = raw['verification_comment'] as String?;
      final credentials = profile.credentials?.toList() ?? const <Credential>[];

      return SpecialistVerificationState(
        status: mapApiStatus(profile.verificationStatus),
        comment: (comment != null && comment.trim().isNotEmpty)
            ? comment.trim()
            : null,
        hasSubmittedCredentials: credentials.isNotEmpty,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const SpecialistVerificationState(
          status: SpecialistVerificationStatus.pending,
        );
      }
      rethrow;
    }
  }
}
