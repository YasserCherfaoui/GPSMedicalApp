import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/cached_appointment_review.dart';

const _storageKey = 'gps_appointment_reviews';

class AppointmentReviewStore {
  Future<CachedAppointmentReview?> read(String appointmentId) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);
    if (raw == null || raw.isEmpty) return null;
    final map = jsonDecode(raw) as Map<String, dynamic>;
    final entry = map[appointmentId];
    if (entry is! Map<String, dynamic>) return null;
    return CachedAppointmentReview.fromJson(entry);
  }

  Future<void> save(CachedAppointmentReview review) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);
    final map = raw == null || raw.isEmpty
        ? <String, dynamic>{}
        : Map<String, dynamic>.from(jsonDecode(raw) as Map);
    map[review.appointmentId] = review.toJson();
    await prefs.setString(_storageKey, jsonEncode(map));
  }

  Future<void> clear(String appointmentId) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);
    if (raw == null || raw.isEmpty) return;
    final map = Map<String, dynamic>.from(jsonDecode(raw) as Map);
    map.remove(appointmentId);
    if (map.isEmpty) {
      await prefs.remove(_storageKey);
    } else {
      await prefs.setString(_storageKey, jsonEncode(map));
    }
  }
}
