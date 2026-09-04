import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../constants/registration_countries.dart';
import 'generated/app_localizations.dart';

/// Auth-flow localized copy delegates dynamically to code-generated [AppLocalizations].
class AuthStrings {
  const AuthStrings(this._localizations);

  final AppLocalizations _localizations;

  static AuthStrings of(BuildContext context) {
    return Localizations.of<AuthStrings>(context, AuthStrings) ??
        AuthStrings(lookupAppLocalizations(const Locale('fr')));
  }

  static const LocalizationsDelegate<AuthStrings> delegate =
      _AuthStringsDelegate();

  String get splashSubtitle => _localizations.splashSubtitle;
  String get chooseLanguage => _localizations.chooseLanguage;
  String get continueLabel => _localizations.continueLabel;
  String get skip => _localizations.skip;
  String get next => _localizations.next;
  String get start => _localizations.start;
  String get back => _localizations.bookingBack;
  String get needHelp => _localizations.needHelp;
  String get viewGuide => _localizations.viewGuide;
  String get securedLabel => _localizations.securedLabel;
  String get instantLabel => _localizations.instantLabel;

  String onboardingTitle(int step) => switch (step) {
    1 => _localizations.onboardingTitle1,
    2 => _localizations.onboardingTitle2,
    3 => _localizations.onboardingTitle3,
    _ => '',
  };

  String onboardingBody(int step) => switch (step) {
    1 => _localizations.onboardingBody1,
    2 => _localizations.onboardingBody2,
    3 => _localizations.onboardingBody3,
    _ => '',
  };

  String onboardingSmartTitle(String brand) =>
      _localizations.onboardingSmartTitle(brand);

  String onboardingSmartBody(String brand) =>
      _localizations.onboardingSmartBody(brand);

  String get onboardingFeatureGuidanceTitle =>
      _localizations.onboardingFeatureGuidanceTitle;
  String get onboardingFeatureGuidanceBody =>
      _localizations.onboardingFeatureGuidanceBody;
  String get onboardingFeatureMonitoringTitle =>
      _localizations.onboardingFeatureMonitoringTitle;
  String get onboardingFeatureMonitoringBody =>
      _localizations.onboardingFeatureMonitoringBody;
  String get onboardingStepPainTitle => _localizations.onboardingStepPainTitle;
  String get onboardingStepPainBody => _localizations.onboardingStepPainBody;
  String get onboardingStepScreeningTitle =>
      _localizations.onboardingStepScreeningTitle;
  String get onboardingStepScreeningBody =>
      _localizations.onboardingStepScreeningBody;
  String get onboardingStepPrepareTitle =>
      _localizations.onboardingStepPrepareTitle;
  String get onboardingStepPrepareBody =>
      _localizations.onboardingStepPrepareBody;
  String get onboardingStepExpertTitle =>
      _localizations.onboardingStepExpertTitle;
  String get onboardingStepExpertBody =>
      _localizations.onboardingStepExpertBody;
  String get onboardingBadgeHosting => _localizations.onboardingBadgeHosting;
  String get onboardingBadgeEncryption =>
      _localizations.onboardingBadgeEncryption;
  String get onboardingBadgeDoctors => _localizations.onboardingBadgeDoctors;
  String get onboardingBadgeDoctorsSubtitle =>
      _localizations.onboardingBadgeDoctorsSubtitle;
  String get onboardingTrustHosting => _localizations.onboardingTrustHosting;
  String get onboardingTrustEncryption =>
      _localizations.onboardingTrustEncryption;
  String get onboardingTrustDoctors => _localizations.onboardingTrustDoctors;
  String get onboardingHeroGuidanceTitle =>
      _localizations.onboardingHeroGuidanceTitle;
  String get onboardingHeroGuidanceSubtitle =>
      _localizations.onboardingHeroGuidanceSubtitle;
  String get onboardingHeroSampleDoctorName =>
      _localizations.onboardingHeroSampleDoctorName;
  String get onboardingHeroSampleDoctorSpecialty =>
      _localizations.onboardingHeroSampleDoctorSpecialty;
  String get onboardingHeroSampleDoctorRating =>
      _localizations.onboardingHeroSampleDoctorRating;
  String get onboardingHeroAiStatusLabel =>
      _localizations.onboardingHeroAiStatusLabel;
  String get onboardingHeroAiStatusValue =>
      _localizations.onboardingHeroAiStatusValue;
  String get onboardingHeroPathTitle => _localizations.onboardingHeroPathTitle;
  String get onboardingHeroPathSteps => _localizations.onboardingHeroPathSteps;

  String get welcomeTitle => _localizations.welcomeTitle;
  String get welcomeSubtitle => _localizations.welcomeSubtitle;
  String get createAccount => _localizations.createAccount;
  String get alreadyHaveAccount => _localizations.alreadyHaveAccount;
  String get notRegisteredYet => _localizations.notRegisteredYet;
  String get signIn => _localizations.signIn;
  String get signInWithBiometrics => _localizations.signInWithBiometrics;
  String get orSeparator => _localizations.orSeparator;
  String get authToastTitle => _localizations.authToastTitle;
  String get welcomeHeroGpsLabel => _localizations.welcomeHeroGpsLabel;
  String get welcomeHeroGpsCaption => _localizations.welcomeHeroGpsCaption;
  String get welcomeHeroRecordsLabel => _localizations.welcomeHeroRecordsLabel;
  String get welcomeHeroRecordsCaption =>
      _localizations.welcomeHeroRecordsCaption;
  String get welcomeHeroAnalysisTitle =>
      _localizations.welcomeHeroAnalysisTitle;
  String get welcomeHeroAnalysisCaption =>
      _localizations.welcomeHeroAnalysisCaption;
  String get loginTitle => _localizations.loginTitle;
  String get loginSubtitle => _localizations.loginSubtitle;
  String get phoneLabel => _localizations.phoneLabel;
  String get passwordLabel => _localizations.passwordLabel;
  String get confirmPasswordLabel => _localizations.confirmPasswordLabel;
  String get forgotPassword => _localizations.forgotPassword;
  String get registration => _localizations.registration;
  String get verification => _localizations.verification;
  String get ninTitle => _localizations.ninTitle;
  String get ninSubtitle => _localizations.ninSubtitle;
  String get ninHint => _localizations.ninHint;
  String get ninFieldLabel => _localizations.ninFieldLabel;
  String get ninDigitsCount => _localizations.ninDigitsCount;
  String get ninVisualGuideLabel => _localizations.ninVisualGuideLabel;
  String get ninVisualGuideBody => _localizations.ninVisualGuideBody;
  String get ninWhyLink => _localizations.ninWhyLink;
  String get phoneTitle => _localizations.phoneTitle;
  String get phoneSubtitle => _localizations.phoneSubtitle;
  String get phoneFormatHint => _localizations.phoneFormatHint;
  String get sendCode => _localizations.sendCode;
  String get otpTitle => _localizations.otpTitle;

  String otpSubtitle(String phone) => _localizations.otpSubtitle(phone);

  String get ninVerificationPendingBanner =>
      _localizations.ninVerificationPendingBanner;

  String get resendCode => _localizations.resendCode;

  String resendIn(int seconds) =>
      _localizations.resendIn(seconds.toString().padLeft(2, '0'));

  String get otpHelpBody => _localizations.otpHelpBody;
  String get verify => _localizations.verify;
  String get passwordTitle => _localizations.passwordTitle;
  String get passwordEncryptionNotice =>
      _localizations.passwordEncryptionNotice;
  String get passwordStrengthLabel => _localizations.passwordStrengthLabel;
  String get passwordStrengthWeak => _localizations.passwordStrengthWeak;
  String get passwordStrengthMedium => _localizations.passwordStrengthMedium;
  String get passwordStrengthStrong => _localizations.passwordStrengthStrong;
  String get passwordRuleMinLength => _localizations.passwordRuleMinLength;
  String get passwordRuleUppercase => _localizations.passwordRuleUppercase;
  String get passwordRuleDigit => _localizations.passwordRuleDigit;
  String get passwordRuleSpecial => _localizations.passwordRuleSpecial;
  String get consentTitle => _localizations.consentTitle;
  String get consentSubtitle => _localizations.consentSubtitle;
  String get consentHealth => _localizations.consentHealth;
  String get consentHealthSubtitle => _localizations.consentHealthSubtitle;
  String get consentData => _localizations.consentData;
  String get consentDataSubtitle => _localizations.consentDataSubtitle;
  String get consentTerms => _localizations.consentTerms;
  String get consentMarketing => _localizations.consentMarketing;
  String get consentMarketingSubtitle =>
      _localizations.consentMarketingSubtitle;
  String get acceptTerms => _localizations.acceptTerms;
  String get createMyAccount => _localizations.createMyAccount;
  String get biometricTitle => _localizations.biometricTitle;
  String get biometricSubtitle => _localizations.biometricSubtitle;
  String get biometricEnableTitle => _localizations.biometricEnableTitle;
  String get biometricEnableSubtitle => _localizations.biometricEnableSubtitle;
  String get enable => _localizations.enable;
  String get later => _localizations.later;
  String get successTitle => _localizations.successTitle;
  String get successSubtitle => _localizations.successSubtitle;
  String get successFeatureNavigationLabel =>
      _localizations.successFeatureNavigationLabel;
  String get successFeatureNavigationBody =>
      _localizations.successFeatureNavigationBody;
  String get successFeatureAppointmentsLabel =>
      _localizations.successFeatureAppointmentsLabel;
  String get successFeatureAppointmentsBody =>
      _localizations.successFeatureAppointmentsBody;
  String get discoverApp => _localizations.discoverApp;
  String get forgotTitle => _localizations.forgotTitle;
  String get resetTitle => _localizations.resetTitle;
  String get resetAction => _localizations.resetAction;
  String get invalidPhone => _localizations.invalidPhone;
  String get invalidNin => _localizations.invalidNin;
  String get fullNameTitle => _localizations.fullNameTitle;
  String get fullNameSubtitle => _localizations.fullNameSubtitle;
  String get fullNameHint => _localizations.fullNameHint;
  String get invalidFullName => _localizations.invalidFullName;
  String get passwordsMismatch => _localizations.passwordsMismatch;
  String get requiredConsents => _localizations.requiredConsents;
  String get networkError => _localizations.networkError;
  String get errorInvalidCredentials => _localizations.errorInvalidCredentials;
  String get errorAccessDenied => _localizations.errorAccessDenied;
  String get errorTooManyRequests => _localizations.errorTooManyRequests;
  String get errorInternalServer => _localizations.errorInternalServer;
  String get errorNetworkTimeout => _localizations.errorNetworkTimeout;
  String get errorNetworkConnection => _localizations.errorNetworkConnection;
  String get errorPasswordRequired => _localizations.errorPasswordRequired;
  String get errorRegistrationIncomplete =>
      _localizations.errorRegistrationIncomplete;
  String get errorEmptyResponse => _localizations.errorEmptyResponse;
  String get errorConflict => _localizations.errorConflict;
  String get errorInvalidInput => _localizations.errorInvalidInput;
  String get errorUnexpected => _localizations.errorUnexpected;
  String get errorPasswordUpdatedSignInAgain =>
      _localizations.errorPasswordUpdatedSignInAgain;

  String get profileSignOut => _localizations.profileSignOut;
  String get profilePlaceholderTitle => _localizations.profilePlaceholderTitle;
  String get profilePlaceholderSession =>
      _localizations.profilePlaceholderSession;
  String get profilePlaceholderSimulateExpiry =>
      _localizations.profilePlaceholderSimulateExpiry;

  String profilePlaceholderRole(String role) =>
      _localizations.profilePlaceholderRole(role);

  String get countryTitle => _localizations.countryTitle;
  String get countrySubtitle => _localizations.countrySubtitle;
  String get countryImmutableNotice => _localizations.countryImmutableNotice;
  String get countryAlgeria => _localizations.countryAlgeria;
  String get countryTunisia => _localizations.countryTunisia;
  String get phoneCountryMismatch => _localizations.phoneCountryMismatch;
  String get countryNotSupportedForRole =>
      _localizations.countryNotSupportedForRole;
  String get consentSubtitleTn => _localizations.consentSubtitleTn;
  String get consentTermsTn => _localizations.consentTermsTn;
  String get invalidPhoneTn => _localizations.invalidPhoneTn;
  String get phoneFormatHintTn => _localizations.phoneFormatHintTn;

  String consentLegalVersion(String version) =>
      _localizations.consentLegalVersion(version);

  String countryName(RegistrationCountry country) => switch (country) {
    RegistrationCountry.dz => countryAlgeria,
    RegistrationCountry.tn => countryTunisia,
  };

  String phoneFormatHintFor(RegistrationCountry country) => switch (country) {
    RegistrationCountry.dz => phoneFormatHint,
    RegistrationCountry.tn => phoneFormatHintTn,
  };

  String invalidPhoneFor(RegistrationCountry country) => switch (country) {
    RegistrationCountry.dz => invalidPhone,
    RegistrationCountry.tn => invalidPhoneTn,
  };

  String consentSubtitleFor(RegistrationCountry country) => switch (country) {
    RegistrationCountry.dz => consentSubtitle,
    RegistrationCountry.tn => consentSubtitleTn,
  };

  String consentTermsFor(RegistrationCountry country) => switch (country) {
    RegistrationCountry.dz => consentTerms,
    RegistrationCountry.tn => consentTermsTn,
  };
}

class _AuthStringsDelegate extends LocalizationsDelegate<AuthStrings> {
  const _AuthStringsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<AuthStrings> load(Locale locale) async {
    const supportedLanguageCodes = [
      'ar',
      'ber',
      'fr',
      'en',
      'es',
      'it',
      'de',
      'nl',
      'ru',
      'pt',
    ];
    final resolvedLocale = supportedLanguageCodes.contains(locale.languageCode)
        ? locale
        : const Locale('fr');
    return AuthStrings(lookupAppLocalizations(resolvedLocale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AuthStrings> old) => false;
}

/// A fallback material delegate that handles locales unsupported by
/// GlobalMaterialLocalizations (like 'ber' Tamazight), defaulting to French.
class FallbackMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return await GlobalMaterialLocalizations.delegate.load(const Locale('fr'));
  }

  @override
  bool shouldReload(
    covariant LocalizationsDelegate<MaterialLocalizations> old,
  ) => false;
}

/// A fallback cupertino delegate that handles locales unsupported by
/// GlobalCupertinoLocalizations (like 'ber' Tamazight), defaulting to French.
class FallbackCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    return await GlobalCupertinoLocalizations.delegate.load(const Locale('fr'));
  }

  @override
  bool shouldReload(
    covariant LocalizationsDelegate<CupertinoLocalizations> old,
  ) => false;
}
