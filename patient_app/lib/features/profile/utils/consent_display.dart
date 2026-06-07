import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

bool isEssentialConsentType(ConsentGrantConsentTypeEnum type) {
  return type == ConsentGrantConsentTypeEnum.dataProcessing ||
      type == ConsentGrantConsentTypeEnum.healthData ||
      type == ConsentGrantConsentTypeEnum.anpdpTerms;
}

bool isActiveConsent(ConsentGrant grant) => grant.revokedAt == null;

String consentTypeLabel(
  ConsentGrantConsentTypeEnum type,
  AppLocalizations l10n,
) {
  if (type == ConsentGrantConsentTypeEnum.dataProcessing) {
    return l10n.consentData;
  }
  if (type == ConsentGrantConsentTypeEnum.healthData) {
    return l10n.consentHealth;
  }
  if (type == ConsentGrantConsentTypeEnum.anpdpTerms) {
    return l10n.consentTerms;
  }
  if (type == ConsentGrantConsentTypeEnum.marketing) {
    return l10n.consentMarketing;
  }
  return type.name;
}

RevokeConsentRequestConsentTypeEnum toRevokeType(
  ConsentGrantConsentTypeEnum type,
) {
  if (type == ConsentGrantConsentTypeEnum.dataProcessing) {
    return RevokeConsentRequestConsentTypeEnum.dataProcessing;
  }
  if (type == ConsentGrantConsentTypeEnum.healthData) {
    return RevokeConsentRequestConsentTypeEnum.healthData;
  }
  if (type == ConsentGrantConsentTypeEnum.anpdpTerms) {
    return RevokeConsentRequestConsentTypeEnum.anpdpTerms;
  }
  return RevokeConsentRequestConsentTypeEnum.marketing;
}

String formatConsentDateTime(DateTime dateTime, String locale) {
  return DateFormat.yMMMd(locale).add_Hm().format(dateTime.toLocal());
}
