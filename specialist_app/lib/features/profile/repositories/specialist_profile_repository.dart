import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/profile_api_error.dart';

class SpecialistProfileRepository {
  SpecialistProfileRepository(this._client);

  final GpsMedicalClient _client;

  Future<DoctorPrivate> getProfile() async {
    try {
      final response = await _client.phase1.getDoctorProfile();
      final profile = response.data;
      if (profile == null) {
        throw StateError('Empty doctor profile response');
      }
      return profile;
    } catch (e) {
      rethrowProfileApiError(e);
    }
  }

  Future<DoctorPrivate> patchProfile(DoctorUpdate update) async {
    try {
      final response = await _client.phase1.patchDoctorProfile(
        doctorUpdate: update,
      );
      final profile = response.data;
      if (profile == null) {
        throw StateError('Empty doctor profile response');
      }
      return profile;
    } catch (e) {
      rethrowProfileApiError(e);
    }
  }

  /// PATCH with extra fields (`full_name`, `title`, `gender`) not yet on generated [DoctorUpdate].
  Future<DoctorPrivate> patchProfileRaw(Map<String, dynamic> body) async {
    try {
      final response = await _client.v1.dio.patch<Map<String, dynamic>>(
        '/doctors/me',
        data: body,
      );
      final raw = response.data;
      if (raw == null) {
        throw StateError('Empty doctor profile response');
      }
      return standardSerializers.deserialize(
            raw,
            specifiedType: const FullType(DoctorPrivate),
          )
          as DoctorPrivate;
    } catch (e) {
      rethrowProfileApiError(e);
    }
  }

  Map<String, dynamic> buildPatchBody({
    String? fullName,
    String? title,
    String? gender,
    String? bio,
    String? photoUrl,
    List<DoctorUpdateLanguagesEnum>? languages,
    int? consultationFeeDzd,
    bool? acceptsCnas,
    bool? acceptsCasnos,
    bool? offersTelehealth,
    Address? practiceAddress,
    DoctorUpdateConfirmationPolicyEnum? confirmationPolicy,
    int? bookingWindowDays,
    String? specialtyId,
  }) {
    final body = <String, dynamic>{};
    if (fullName != null) body['full_name'] = fullName;
    if (title != null) body['title'] = title;
    if (gender != null) body['gender'] = gender;
    if (bio != null) body['bio'] = bio;
    if (photoUrl != null) body['photo_url'] = photoUrl;
    if (languages != null) {
      body['languages'] = languages.map((l) => l.name).toList();
    }
    if (consultationFeeDzd != null) {
      body['consultation_fee_dzd'] = consultationFeeDzd;
    }
    if (acceptsCnas != null) body['accepts_cnas'] = acceptsCnas;
    if (acceptsCasnos != null) body['accepts_casnos'] = acceptsCasnos;
    if (offersTelehealth != null) body['offers_telehealth'] = offersTelehealth;
    if (confirmationPolicy != null) {
      body['confirmation_policy'] = confirmationPolicy.name;
    }
    if (bookingWindowDays != null) {
      body['booking_window_days'] = bookingWindowDays;
    }
    if (specialtyId != null) body['specialty_ids'] = [specialtyId];
    if (practiceAddress != null) {
      body['practice_address'] = standardSerializers.serialize(
        practiceAddress,
        specifiedType: const FullType(Address),
      );
    }
    return body;
  }

  DoctorPrivate mergeOptimistic(
    DoctorPrivate previous,
    Map<String, dynamic> patch,
  ) {
    return previous.rebuild((b) {
      if (patch['full_name'] is String) b.fullName = patch['full_name'] as String;
      if (patch['title'] is String) b.title = patch['title'] as String;
      if (patch['bio'] is String) b.bio = patch['bio'] as String;
      if (patch['photo_url'] is String) b.photoUrl = patch['photo_url'] as String;
      if (patch['consultation_fee_dzd'] is int) {
        b.consultationFeeDzd = patch['consultation_fee_dzd'] as int;
      }
      if (patch['accepts_cnas'] is bool) {
        b.acceptsCnas = patch['accepts_cnas'] as bool;
      }
      if (patch['accepts_casnos'] is bool) {
        b.acceptsCasnos = patch['accepts_casnos'] as bool;
      }
      if (patch['offers_telehealth'] is bool) {
        b.offersTelehealth = patch['offers_telehealth'] as bool;
      }
      if (patch['booking_window_days'] is int) {
        b.bookingWindowDays = patch['booking_window_days'] as int;
      }
      if (patch['languages'] is List) {
        final langs = (patch['languages'] as List)
            .map((e) => DoctorLanguagesEnum.valueOf(e as String))
            .toList();
        b.languages = ListBuilder(langs);
      }
      if (patch['practice_address'] is Map) {
        final addr = standardSerializers.deserialize(
          patch['practice_address'],
          specifiedType: const FullType(Address),
        ) as Address;
        b.practiceAddress.replace(addr);
      }
    });
  }
}
