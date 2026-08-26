import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persists the last successful clinic list / profile payloads for offline reads
/// (Phase 2 pattern: soft-fail to cache when the network is down).
class ClinicOfflineCache {
  ClinicOfflineCache({SharedPreferences? prefs}) : _prefsOverride = prefs;

  static const _listKey = 'gps.clinic.offline.list.v1';
  static const _detailPrefix = 'gps.clinic.offline.detail.v1.';

  final SharedPreferences? _prefsOverride;

  Future<SharedPreferences> get _prefs async =>
      _prefsOverride ?? SharedPreferences.getInstance();

  Future<void> saveList(List<Clinic> clinics) async {
    final prefs = await _prefs;
    final encoded = clinics
        .map(
          (clinic) => standardSerializers.serialize(
            clinic,
            specifiedType: const FullType(Clinic),
          ),
        )
        .toList();
    await prefs.setString(_listKey, jsonEncode(encoded));
  }

  Future<List<Clinic>> readList() async {
    final prefs = await _prefs;
    final raw = prefs.getString(_listKey);
    if (raw == null || raw.isEmpty) return const [];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return const [];
      return decoded
          .map(
            (item) => standardSerializers.deserialize(
              item,
              specifiedType: const FullType(Clinic),
            ) as Clinic,
          )
          .toList();
    } catch (_) {
      return const [];
    }
  }

  Future<void> saveDetail({
    required Clinic clinic,
    required List<ClinicService> services,
    required List<ClinicSpecialistTeaser> specialists,
  }) async {
    final id = clinic.id;
    if (id == null || id.isEmpty) return;
    final prefs = await _prefs;
    final payload = {
      'clinic': standardSerializers.serialize(
        clinic,
        specifiedType: const FullType(Clinic),
      ),
      'services': services
          .map(
            (s) => standardSerializers.serialize(
              s,
              specifiedType: const FullType(ClinicService),
            ),
          )
          .toList(),
      'specialists': specialists
          .map(
            (s) => standardSerializers.serialize(
              s,
              specifiedType: const FullType(ClinicSpecialistTeaser),
            ),
          )
          .toList(),
    };
    await prefs.setString('$_detailPrefix$id', jsonEncode(payload));
  }

  Future<
      ({
        Clinic clinic,
        List<ClinicService> services,
        List<ClinicSpecialistTeaser> specialists,
      })?>
      readDetail(String clinicId) async {
    final prefs = await _prefs;
    final raw = prefs.getString('$_detailPrefix$clinicId');
    if (raw == null || raw.isEmpty) return null;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return null;
      final clinic = standardSerializers.deserialize(
        decoded['clinic'],
        specifiedType: const FullType(Clinic),
      ) as Clinic;
      final servicesRaw = decoded['services'];
      final specialistsRaw = decoded['specialists'];
      final services = servicesRaw is List
          ? servicesRaw
              .map(
                (item) => standardSerializers.deserialize(
                  item,
                  specifiedType: const FullType(ClinicService),
                ) as ClinicService,
              )
              .toList()
          : <ClinicService>[];
      final specialists = specialistsRaw is List
          ? specialistsRaw
              .map(
                (item) => standardSerializers.deserialize(
                  item,
                  specifiedType: const FullType(ClinicSpecialistTeaser),
                ) as ClinicSpecialistTeaser,
              )
              .toList()
          : <ClinicSpecialistTeaser>[];
      return (
        clinic: clinic,
        services: services,
        specialists: specialists,
      );
    } catch (_) {
      return null;
    }
  }
}
