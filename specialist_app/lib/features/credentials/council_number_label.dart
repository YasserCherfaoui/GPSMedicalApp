import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Country-aware medical council / ordre number label (A-A2.1).
String specialistCouncilNumberLabel(
  AppLocalizations l10n,
  CountryCode? country,
) {
  switch (country) {
    case CountryCode.TN:
      return l10n.specialistCredentialsCouncilNumberTn;
    case CountryCode.FR:
      return l10n.specialistCredentialsCouncilNumberFr;
    case CountryCode.DE:
      return l10n.specialistCredentialsCouncilNumberDe;
    case CountryCode.IT:
      return l10n.specialistCredentialsCouncilNumberIt;
    case CountryCode.ES:
      return l10n.specialistCredentialsCouncilNumberEs;
    case CountryCode.DZ:
    case null:
      return l10n.specialistCredentialsCouncilNumber;
    default:
      return l10n.specialistCredentialsCouncilNumberEu;
  }
}
