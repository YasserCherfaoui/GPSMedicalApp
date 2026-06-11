import 'package:gps_medical_shared/gps_medical_shared.dart';

String credentialTypeLabel(CredentialTypeEnum? type, AppLocalizations l10n) {
  return switch (type) {
    CredentialTypeEnum.diploma => l10n.specialistCredentialTypeDiploma,
    CredentialTypeEnum.councilCard => l10n.specialistCredentialTypeCouncilCard,
    CredentialTypeEnum.specialtyCert =>
      l10n.specialistCredentialTypeSpecialtyCert,
    CredentialTypeEnum.other => l10n.specialistCredentialTypeOther,
    null => '—',
    _ => l10n.specialistCredentialTypeOther,
  };
}

String credentialStatusLabel(
  CredentialStatusEnum? status,
  AppLocalizations l10n,
) {
  return switch (status) {
    CredentialStatusEnum.pending => l10n.specialistCredentialStatusPending,
    CredentialStatusEnum.approved => l10n.specialistCredentialStatusApproved,
    CredentialStatusEnum.rejected => l10n.specialistCredentialStatusRejected,
    null => '—',
    _ => l10n.specialistCredentialStatusPending,
  };
}

const credentialUploadTypes = <CredentialTypeEnum>[
  CredentialTypeEnum.councilCard,
  CredentialTypeEnum.diploma,
  CredentialTypeEnum.specialtyCert,
  CredentialTypeEnum.other,
];
