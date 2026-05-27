import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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

  String get welcomeTitle => _localizations.welcomeTitle;
  String get welcomeSubtitle => _localizations.welcomeSubtitle;
  String get createAccount => _localizations.createAccount;
  String get signIn => _localizations.signIn;
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
  String get phoneTitle => _localizations.phoneTitle;
  String get phoneSubtitle => _localizations.phoneSubtitle;
  String get phoneFormatHint => _localizations.phoneFormatHint;
  String get sendCode => _localizations.sendCode;
  String get otpTitle => _localizations.otpTitle;

  String otpSubtitle(String phone) => _localizations.otpSubtitle(phone);

  String get resendCode => _localizations.resendCode;

  String resendIn(int seconds) => _localizations.resendIn(seconds.toString());

  String get verify => _localizations.verify;
  String get passwordTitle => _localizations.passwordTitle;
  String get consentTitle => _localizations.consentTitle;
  String get consentSubtitle => _localizations.consentSubtitle;
  String get consentHealth => _localizations.consentHealth;
  String get consentData => _localizations.consentData;
  String get consentTerms => _localizations.consentTerms;
  String get consentMarketing => _localizations.consentMarketing;
  String get acceptTerms => _localizations.acceptTerms;
  String get createMyAccount => _localizations.createMyAccount;
  String get biometricTitle => _localizations.biometricTitle;
  String get biometricSubtitle => _localizations.biometricSubtitle;
  String get enable => _localizations.enable;
  String get later => _localizations.later;
  String get successTitle => _localizations.successTitle;
  String get successSubtitle => _localizations.successSubtitle;
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
}

class _AuthStringsDelegate extends LocalizationsDelegate<AuthStrings> {
  const _AuthStringsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<AuthStrings> load(Locale locale) async {
    const supportedLanguageCodes = ['ar', 'ber', 'fr'];
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
