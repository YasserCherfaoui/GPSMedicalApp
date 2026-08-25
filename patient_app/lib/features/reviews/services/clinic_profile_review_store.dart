import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/cached_clinic_profile_review.dart';

const _storageKey = 'gps_clinic_profile_reviews';

class ClinicProfileReviewStore {
  Future<CachedClinicProfileReview?> read(String clinicId) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);
    if (raw == null || raw.isEmpty) return null;
    final map = jsonDecode(raw) as Map<String, dynamic>;
    final entry = map[clinicId];
    if (entry is! Map<String, dynamic>) return null;
    return CachedClinicProfileReview.fromJson(entry);
  }

  Future<void> save(CachedClinicProfileReview review) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);
    final map = raw == null || raw.isEmpty
        ? <String, dynamic>{}
        : Map<String, dynamic>.from(jsonDecode(raw) as Map);
    map[review.clinicId] = review.toJson();
    await prefs.setString(_storageKey, jsonEncode(map));
  }
}
