import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Joins up to three public service names for clinic search cards.
String? clinicServiceSummary(Clinic clinic) {
  final names =
      clinic.serviceTeasers
          ?.map((teaser) => teaser.name?.trim())
          .whereType<String>()
          .where((name) => name.isNotEmpty)
          .toList() ??
      const <String>[];
  if (names.isEmpty) return null;
  return names.take(3).join(' · ');
}

/// Lowest published teaser price, if any.
int? clinicStartingFee(Clinic clinic) {
  final prices =
      clinic.serviceTeasers
          ?.map((teaser) => teaser.priceAmount)
          .whereType<int>()
          .toList() ??
      const <int>[];
  if (prices.isEmpty) return null;
  prices.sort();
  return prices.first;
}

String clinicCurrencyLabel(CurrencyCode? code) {
  return switch (code) {
    CurrencyCode.TND => 'TND',
    CurrencyCode.EUR => 'EUR',
    CurrencyCode.DZD => 'DZD',
    _ => 'DZD',
  };
}

String clinicStartingCurrency(Clinic clinic) {
  final teasers =
      clinic.serviceTeasers?.toList() ?? const <ClinicServiceTeaser>[];
  if (teasers.isEmpty) return 'DZD';
  final starting = clinicStartingFee(clinic);
  for (final teaser in teasers) {
    if (starting != null && teaser.priceAmount == starting) {
      return clinicCurrencyLabel(teaser.currency);
    }
  }
  return clinicCurrencyLabel(teasers.first.currency);
}

int? clinicServiceDurationMinutes(ClinicServiceDurationMinutesEnum? value) {
  return switch (value) {
    ClinicServiceDurationMinutesEnum.number10 => 10,
    ClinicServiceDurationMinutesEnum.number15 => 15,
    ClinicServiceDurationMinutesEnum.number20 => 20,
    ClinicServiceDurationMinutesEnum.number30 => 30,
    ClinicServiceDurationMinutesEnum.number45 => 45,
    ClinicServiceDurationMinutesEnum.number60 => 60,
    _ => null,
  };
}

String formatClinicSpecialistName(ClinicSpecialistTeaser specialist) {
  final title = specialist.title?.trim();
  final name = specialist.fullName?.trim() ?? '';
  if (title == null || title.isEmpty) return name;
  return '$title $name'.trim();
}
