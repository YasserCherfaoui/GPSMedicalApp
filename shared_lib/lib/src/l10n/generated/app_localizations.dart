import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_ber.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('ber'),
    Locale('fr'),
  ];

  /// No description provided for @splashSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'De l\'errance à l\'orientation intelligente'**
  String get splashSubtitle;

  /// No description provided for @chooseLanguage.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez votre langue'**
  String get chooseLanguage;

  /// No description provided for @continueLabel.
  ///
  /// In fr, this message translates to:
  /// **'Continuer'**
  String get continueLabel;

  /// No description provided for @skip.
  ///
  /// In fr, this message translates to:
  /// **'Passer'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In fr, this message translates to:
  /// **'Suivant'**
  String get next;

  /// No description provided for @start.
  ///
  /// In fr, this message translates to:
  /// **'Commencer'**
  String get start;

  /// No description provided for @onboardingTitle1.
  ///
  /// In fr, this message translates to:
  /// **'De l\'errance à l\'orientation intelligente'**
  String get onboardingTitle1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In fr, this message translates to:
  /// **'Comment ça fonctionne ?'**
  String get onboardingTitle2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In fr, this message translates to:
  /// **'Vos données, protégées en Algérie'**
  String get onboardingTitle3;

  /// No description provided for @onboardingBody1.
  ///
  /// In fr, this message translates to:
  /// **'Fini le nomadisme médical. Le bon spécialiste, au bon moment.'**
  String get onboardingBody1;

  /// No description provided for @onboardingBody2.
  ///
  /// In fr, this message translates to:
  /// **'Parcours en 4 étapes : localisation, dépistage, coaching, orientation.'**
  String get onboardingBody2;

  /// No description provided for @onboardingBody3.
  ///
  /// In fr, this message translates to:
  /// **'Hébergement local ANPDP, chiffrement, médecins vérifiés.'**
  String get onboardingBody3;

  /// No description provided for @welcomeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bienvenue'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Votre parcours santé commence ici'**
  String get welcomeSubtitle;

  /// No description provided for @createAccount.
  ///
  /// In fr, this message translates to:
  /// **'Créer un compte'**
  String get createAccount;

  /// No description provided for @signIn.
  ///
  /// In fr, this message translates to:
  /// **'Se connecter'**
  String get signIn;

  /// No description provided for @loginTitle.
  ///
  /// In fr, this message translates to:
  /// **'Connexion'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Heureux de vous revoir'**
  String get loginSubtitle;

  /// No description provided for @phoneLabel.
  ///
  /// In fr, this message translates to:
  /// **'Téléphone'**
  String get phoneLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe'**
  String get passwordLabel;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le mot de passe'**
  String get confirmPasswordLabel;

  /// No description provided for @forgotPassword.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe oublié ?'**
  String get forgotPassword;

  /// No description provided for @registration.
  ///
  /// In fr, this message translates to:
  /// **'Inscription'**
  String get registration;

  /// No description provided for @verification.
  ///
  /// In fr, this message translates to:
  /// **'Vérification'**
  String get verification;

  /// No description provided for @ninTitle.
  ///
  /// In fr, this message translates to:
  /// **'Votre identité'**
  String get ninTitle;

  /// No description provided for @ninSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Numéro d\'Identification National (18 chiffres)'**
  String get ninSubtitle;

  /// No description provided for @ninHint.
  ///
  /// In fr, this message translates to:
  /// **'Visible sur votre carte d\'identité biométrique'**
  String get ninHint;

  /// No description provided for @phoneTitle.
  ///
  /// In fr, this message translates to:
  /// **'Votre numéro de téléphone'**
  String get phoneTitle;

  /// No description provided for @phoneSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Nous vous enverrons un code de vérification par SMS'**
  String get phoneSubtitle;

  /// No description provided for @phoneFormatHint.
  ///
  /// In fr, this message translates to:
  /// **'Format : +213 5XX, 6XX ou 7XX'**
  String get phoneFormatHint;

  /// No description provided for @sendCode.
  ///
  /// In fr, this message translates to:
  /// **'Envoyer le code'**
  String get sendCode;

  /// No description provided for @otpTitle.
  ///
  /// In fr, this message translates to:
  /// **'Entrez le code reçu'**
  String get otpTitle;

  /// No description provided for @otpSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Code à 6 chiffres envoyé au {phone}'**
  String otpSubtitle(String phone);

  /// No description provided for @resendCode.
  ///
  /// In fr, this message translates to:
  /// **'Renvoyer le code'**
  String get resendCode;

  /// No description provided for @resendIn.
  ///
  /// In fr, this message translates to:
  /// **'Renvoyer dans 0:{seconds}'**
  String resendIn(String seconds);

  /// No description provided for @verify.
  ///
  /// In fr, this message translates to:
  /// **'Vérifier'**
  String get verify;

  /// No description provided for @passwordTitle.
  ///
  /// In fr, this message translates to:
  /// **'Créez votre mot de passe'**
  String get passwordTitle;

  /// No description provided for @consentTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vos consentements'**
  String get consentTitle;

  /// No description provided for @consentSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Conformément à la loi algérienne ANPDP'**
  String get consentSubtitle;

  /// No description provided for @consentHealth.
  ///
  /// In fr, this message translates to:
  /// **'Traitement de mes données de santé'**
  String get consentHealth;

  /// No description provided for @consentData.
  ///
  /// In fr, this message translates to:
  /// **'Traitement de mes données personnelles'**
  String get consentData;

  /// No description provided for @consentTerms.
  ///
  /// In fr, this message translates to:
  /// **'Conditions et politique ANPDP'**
  String get consentTerms;

  /// No description provided for @consentMarketing.
  ///
  /// In fr, this message translates to:
  /// **'Communications marketing (optionnel)'**
  String get consentMarketing;

  /// No description provided for @acceptTerms.
  ///
  /// In fr, this message translates to:
  /// **'J\'accepte les CGU et la Politique de confidentialité'**
  String get acceptTerms;

  /// No description provided for @createMyAccount.
  ///
  /// In fr, this message translates to:
  /// **'Créer mon compte'**
  String get createMyAccount;

  /// No description provided for @biometricTitle.
  ///
  /// In fr, this message translates to:
  /// **'Connexion biométrique'**
  String get biometricTitle;

  /// No description provided for @biometricSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Face ID ou empreinte pour vous connecter plus vite'**
  String get biometricSubtitle;

  /// No description provided for @enable.
  ///
  /// In fr, this message translates to:
  /// **'Activer'**
  String get enable;

  /// No description provided for @later.
  ///
  /// In fr, this message translates to:
  /// **'Plus tard'**
  String get later;

  /// No description provided for @successTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bienvenue sur GPS Médical !'**
  String get successTitle;

  /// No description provided for @successSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Votre compte a été créé avec succès.'**
  String get successSubtitle;

  /// No description provided for @discoverApp.
  ///
  /// In fr, this message translates to:
  /// **'Découvrir l\'application'**
  String get discoverApp;

  /// No description provided for @forgotTitle.
  ///
  /// In fr, this message translates to:
  /// **'Récupération du compte'**
  String get forgotTitle;

  /// No description provided for @resetTitle.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau mot de passe'**
  String get resetTitle;

  /// No description provided for @resetAction.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser'**
  String get resetAction;

  /// No description provided for @invalidPhone.
  ///
  /// In fr, this message translates to:
  /// **'Numéro invalide (+213 5/6/7 + 8 chiffres)'**
  String get invalidPhone;

  /// No description provided for @invalidNin.
  ///
  /// In fr, this message translates to:
  /// **'NIN invalide (18 chiffres)'**
  String get invalidNin;

  /// No description provided for @passwordsMismatch.
  ///
  /// In fr, this message translates to:
  /// **'Les mots de passe ne correspondent pas'**
  String get passwordsMismatch;

  /// No description provided for @requiredConsents.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez accepter tous les consentements obligatoires'**
  String get requiredConsents;

  /// No description provided for @networkError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur réseau. Réessayez.'**
  String get networkError;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'ber', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'ber':
      return AppLocalizationsBer();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
