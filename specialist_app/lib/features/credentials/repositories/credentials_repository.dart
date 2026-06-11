import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_parser/http_parser.dart';

import '../utils/credential_file.dart';
import '../utils/credential_validation.dart';
import '../utils/credentials_api_error.dart';

class CredentialsRepository {
  CredentialsRepository(this._client);

  final GpsMedicalClient _client;

  Future<DoctorPrivate> fetchDoctorProfile() async {
    try {
      final response = await _client.doctors.doctorsMeGet();
      final profile = response.data;
      if (profile == null) {
        throw StateError('Empty doctor profile response');
      }
      return profile;
    } catch (e) {
      rethrowCredentialsApiError(e);
    }
  }

  Future<Credential> upload({
    required Uint8List bytes,
    required String fileName,
    required String mimeType,
    required CredentialTypeEnum type,
    int? issuedYear,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final response = await _client.doctors.doctorsMeCredentialsPost(
        file: MultipartFile.fromBytes(
          bytes,
          filename: fileName,
          contentType: MediaType.parse(mimeType),
        ),
        type: credentialTypeWireName(type),
        issuedYear: issuedYear,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
      );
      final credential = response.data;
      if (credential == null) {
        throw StateError('Empty credential response');
      }
      return credential;
    } catch (e) {
      rethrowCredentialsApiError(e);
    }
  }

  Future<Uint8List> fetchFileBytes(Credential credential) async {
    final link = parseSignedCredentialFileUrl(credential.fileUrl);
    try {
      final response = await _client.doctors.getDoctorCredentialFile(
        credentialId: link.credentialId,
        exp: link.exp,
        token: link.token,
      );
      final bytes = response.data;
      if (bytes == null || bytes.isEmpty) {
        throw StateError('Empty credential file response');
      }
      return bytes;
    } catch (e) {
      rethrowCredentialsApiError(e);
    }
  }
}
