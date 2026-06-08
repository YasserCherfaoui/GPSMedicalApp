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

  /// No description provided for @fullNameTitle.
  ///
  /// In fr, this message translates to:
  /// **'Votre nom complet'**
  String get fullNameTitle;

  /// No description provided for @fullNameSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Tel qu\'indiqué sur vos documents officiels (2 à 120 caractères).'**
  String get fullNameSubtitle;

  /// No description provided for @fullNameHint.
  ///
  /// In fr, this message translates to:
  /// **'Nom et prénom'**
  String get fullNameHint;

  /// No description provided for @invalidFullName.
  ///
  /// In fr, this message translates to:
  /// **'Nom invalide (2 à 120 caractères).'**
  String get invalidFullName;

  /// No description provided for @errorInvalidCredentials.
  ///
  /// In fr, this message translates to:
  /// **'Identifiants incorrects. Veuillez vérifier votre numéro de téléphone et votre mot de passe.'**
  String get errorInvalidCredentials;

  /// No description provided for @errorAccessDenied.
  ///
  /// In fr, this message translates to:
  /// **'Accès refusé. Vous n\'avez pas l\'autorisation d\'accéder à cette application.'**
  String get errorAccessDenied;

  /// No description provided for @errorTooManyRequests.
  ///
  /// In fr, this message translates to:
  /// **'Trop de tentatives. Veuillez réessayer dans quelques minutes.'**
  String get errorTooManyRequests;

  /// No description provided for @errorInternalServer.
  ///
  /// In fr, this message translates to:
  /// **'Erreur interne du serveur. Veuillez réessayer plus tard.'**
  String get errorInternalServer;

  /// No description provided for @errorNetworkTimeout.
  ///
  /// In fr, this message translates to:
  /// **'Connexion expirée. Veuillez vérifier votre connexion Internet et réessayer.'**
  String get errorNetworkTimeout;

  /// No description provided for @errorNetworkConnection.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de se connecter au serveur. Veuillez vérifier votre connexion Internet.'**
  String get errorNetworkConnection;

  /// No description provided for @errorPasswordRequired.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez saisir votre mot de passe.'**
  String get errorPasswordRequired;

  /// No description provided for @bookingAvailabilityTitle.
  ///
  /// In fr, this message translates to:
  /// **'Choisir un créneau'**
  String get bookingAvailabilityTitle;

  /// No description provided for @bookingPreviousWeek.
  ///
  /// In fr, this message translates to:
  /// **'Semaine précédente'**
  String get bookingPreviousWeek;

  /// No description provided for @bookingNextWeek.
  ///
  /// In fr, this message translates to:
  /// **'Semaine suivante'**
  String get bookingNextWeek;

  /// No description provided for @bookingSlotsCount.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =0{Aucun créneau} =1{1 créneau} other{{count} créneaux}}'**
  String bookingSlotsCount(int count);

  /// No description provided for @bookingReserve.
  ///
  /// In fr, this message translates to:
  /// **'Réserver'**
  String get bookingReserve;

  /// No description provided for @bookingSlotDuration.
  ///
  /// In fr, this message translates to:
  /// **'Durée : {minutes} min'**
  String bookingSlotDuration(int minutes);

  /// No description provided for @bookingModeInPerson.
  ///
  /// In fr, this message translates to:
  /// **'En présentiel'**
  String get bookingModeInPerson;

  /// No description provided for @bookingModeTelehealth.
  ///
  /// In fr, this message translates to:
  /// **'Téléconsultation'**
  String get bookingModeTelehealth;

  /// No description provided for @bookingModeAll.
  ///
  /// In fr, this message translates to:
  /// **'Tous'**
  String get bookingModeAll;

  /// No description provided for @bookingWeekRange.
  ///
  /// In fr, this message translates to:
  /// **'{from} – {to}'**
  String bookingWeekRange(String from, String to);

  /// No description provided for @bookingSelectMode.
  ///
  /// In fr, this message translates to:
  /// **'Choisir le mode de consultation'**
  String get bookingSelectMode;

  /// No description provided for @bookingLockExpires.
  ///
  /// In fr, this message translates to:
  /// **'Créneau réservé — expire dans {time}'**
  String bookingLockExpires(String time);

  /// No description provided for @bookingLockExpired.
  ///
  /// In fr, this message translates to:
  /// **'Votre réservation de créneau a expiré.'**
  String get bookingLockExpired;

  /// No description provided for @bookingBack.
  ///
  /// In fr, this message translates to:
  /// **'Retour'**
  String get bookingBack;

  /// No description provided for @bookingStepConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le créneau'**
  String get bookingStepConfirm;

  /// No description provided for @bookingStepPatient.
  ///
  /// In fr, this message translates to:
  /// **'Pour qui ?'**
  String get bookingStepPatient;

  /// No description provided for @bookingStepReview.
  ///
  /// In fr, this message translates to:
  /// **'Récapitulatif'**
  String get bookingStepReview;

  /// No description provided for @bookingForMe.
  ///
  /// In fr, this message translates to:
  /// **'Pour moi'**
  String get bookingForMe;

  /// No description provided for @bookingReasonHint.
  ///
  /// In fr, this message translates to:
  /// **'Motif de consultation (optionnel)'**
  String get bookingReasonHint;

  /// No description provided for @bookingSubmit.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le rendez-vous'**
  String get bookingSubmit;

  /// No description provided for @bookingRescheduleSubmit.
  ///
  /// In fr, this message translates to:
  /// **'Reporter le rendez-vous'**
  String get bookingRescheduleSubmit;

  /// No description provided for @bookingSlotTakenTitle.
  ///
  /// In fr, this message translates to:
  /// **'Créneau indisponible'**
  String get bookingSlotTakenTitle;

  /// No description provided for @bookingSlotTakenMessage.
  ///
  /// In fr, this message translates to:
  /// **'Ce créneau vient d\'être pris. Choisir un autre créneau ?'**
  String get bookingSlotTakenMessage;

  /// No description provided for @bookingChooseAnotherSlot.
  ///
  /// In fr, this message translates to:
  /// **'Choisir un autre créneau'**
  String get bookingChooseAnotherSlot;

  /// No description provided for @bookingOfflineBanner.
  ///
  /// In fr, this message translates to:
  /// **'Hors ligne — la réservation nécessite une connexion'**
  String get bookingOfflineBanner;

  /// No description provided for @bookingOfflineSubmit.
  ///
  /// In fr, this message translates to:
  /// **'Connexion requise pour confirmer le rendez-vous'**
  String get bookingOfflineSubmit;

  /// No description provided for @bookingResumeDraftTitle.
  ///
  /// In fr, this message translates to:
  /// **'Reprendre votre réservation ?'**
  String get bookingResumeDraftTitle;

  /// No description provided for @bookingResumeDraftMessage.
  ///
  /// In fr, this message translates to:
  /// **'Une réservation en cours a été enregistrée. La connexion est nécessaire pour confirmer le créneau.'**
  String get bookingResumeDraftMessage;

  /// No description provided for @bookingOnlineRestored.
  ///
  /// In fr, this message translates to:
  /// **'Connexion rétablie — vous pouvez confirmer le rendez-vous'**
  String get bookingOnlineRestored;

  /// No description provided for @bookingResume.
  ///
  /// In fr, this message translates to:
  /// **'Reprendre'**
  String get bookingResume;

  /// No description provided for @bookingDiscard.
  ///
  /// In fr, this message translates to:
  /// **'Abandonner'**
  String get bookingDiscard;

  /// No description provided for @appointmentsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Rendez-vous'**
  String get appointmentsTitle;

  /// No description provided for @appointmentsUpcoming.
  ///
  /// In fr, this message translates to:
  /// **'À venir'**
  String get appointmentsUpcoming;

  /// No description provided for @appointmentsHistory.
  ///
  /// In fr, this message translates to:
  /// **'Historique'**
  String get appointmentsHistory;

  /// No description provided for @appointmentsEmptyUpcoming.
  ///
  /// In fr, this message translates to:
  /// **'Aucun rendez-vous à venir'**
  String get appointmentsEmptyUpcoming;

  /// No description provided for @appointmentsEmptyUpcomingCta.
  ///
  /// In fr, this message translates to:
  /// **'Trouver un spécialiste'**
  String get appointmentsEmptyUpcomingCta;

  /// No description provided for @appointmentsEmptyHistory.
  ///
  /// In fr, this message translates to:
  /// **'Aucun rendez-vous passé'**
  String get appointmentsEmptyHistory;

  /// No description provided for @appointmentDetailTitle.
  ///
  /// In fr, this message translates to:
  /// **'Détail du rendez-vous'**
  String get appointmentDetailTitle;

  /// No description provided for @appointmentCancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get appointmentCancel;

  /// No description provided for @appointmentReschedule.
  ///
  /// In fr, this message translates to:
  /// **'Reporter'**
  String get appointmentReschedule;

  /// No description provided for @appointmentCancelReasonHint.
  ///
  /// In fr, this message translates to:
  /// **'Motif d\'annulation (optionnel)'**
  String get appointmentCancelReasonHint;

  /// No description provided for @appointmentConfirmCancel.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer l\'annulation'**
  String get appointmentConfirmCancel;

  /// No description provided for @appointmentDirections.
  ///
  /// In fr, this message translates to:
  /// **'Itinéraire'**
  String get appointmentDirections;

  /// No description provided for @appointmentJoinTelehealth.
  ///
  /// In fr, this message translates to:
  /// **'Rejoindre'**
  String get appointmentJoinTelehealth;

  /// No description provided for @appointmentJoinTelehealthHint.
  ///
  /// In fr, this message translates to:
  /// **'La téléconsultation sera disponible dans une prochaine version.'**
  String get appointmentJoinTelehealthHint;

  /// No description provided for @appointmentLeaveReview.
  ///
  /// In fr, this message translates to:
  /// **'Laisser un avis'**
  String get appointmentLeaveReview;

  /// No description provided for @appointmentStatusPending.
  ///
  /// In fr, this message translates to:
  /// **'En attente'**
  String get appointmentStatusPending;

  /// No description provided for @appointmentStatusConfirmed.
  ///
  /// In fr, this message translates to:
  /// **'Confirmé'**
  String get appointmentStatusConfirmed;

  /// No description provided for @appointmentStatusCancelled.
  ///
  /// In fr, this message translates to:
  /// **'Annulé'**
  String get appointmentStatusCancelled;

  /// No description provided for @appointmentStatusCompleted.
  ///
  /// In fr, this message translates to:
  /// **'Terminé'**
  String get appointmentStatusCompleted;

  /// No description provided for @appointmentStatusNoShow.
  ///
  /// In fr, this message translates to:
  /// **'Absent'**
  String get appointmentStatusNoShow;

  /// No description provided for @appointmentPaymentUnpaid.
  ///
  /// In fr, this message translates to:
  /// **'Non payé'**
  String get appointmentPaymentUnpaid;

  /// No description provided for @appointmentPaymentDeposit.
  ///
  /// In fr, this message translates to:
  /// **'Acompte versé'**
  String get appointmentPaymentDeposit;

  /// No description provided for @appointmentPaymentPaid.
  ///
  /// In fr, this message translates to:
  /// **'Payé'**
  String get appointmentPaymentPaid;

  /// No description provided for @appointmentPaymentRefunded.
  ///
  /// In fr, this message translates to:
  /// **'Remboursé'**
  String get appointmentPaymentRefunded;

  /// No description provided for @bookingLoadError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger les créneaux.'**
  String get bookingLoadError;

  /// No description provided for @appointmentsLoadError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger les rendez-vous.'**
  String get appointmentsLoadError;

  /// No description provided for @appointmentDetailLoadError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger le rendez-vous.'**
  String get appointmentDetailLoadError;

  /// No description provided for @bookingFeeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Honoraires'**
  String get bookingFeeLabel;

  /// No description provided for @bookingSummaryDoctor.
  ///
  /// In fr, this message translates to:
  /// **'Médecin'**
  String get bookingSummaryDoctor;

  /// No description provided for @bookingSummarySlot.
  ///
  /// In fr, this message translates to:
  /// **'Créneau'**
  String get bookingSummarySlot;

  /// No description provided for @bookingSummaryPatient.
  ///
  /// In fr, this message translates to:
  /// **'Patient'**
  String get bookingSummaryPatient;

  /// No description provided for @bookingSummaryReason.
  ///
  /// In fr, this message translates to:
  /// **'Motif'**
  String get bookingSummaryReason;

  /// No description provided for @errorGenericTitle.
  ///
  /// In fr, this message translates to:
  /// **'Erreur'**
  String get errorGenericTitle;

  /// No description provided for @retry.
  ///
  /// In fr, this message translates to:
  /// **'Réessayer'**
  String get retry;

  /// No description provided for @specialtiesEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune spécialité trouvée.'**
  String get specialtiesEmpty;

  /// No description provided for @specialtiesLoadError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger les spécialités.'**
  String get specialtiesLoadError;

  /// No description provided for @specialtiesPickerParentAll.
  ///
  /// In fr, this message translates to:
  /// **'Toute la spécialité ({name})'**
  String specialtiesPickerParentAll(String name);

  /// No description provided for @geoWilayaPickerTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionner la wilaya'**
  String get geoWilayaPickerTitle;

  /// No description provided for @geoCommunePickerTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionner la commune'**
  String get geoCommunePickerTitle;

  /// No description provided for @geoClear.
  ///
  /// In fr, this message translates to:
  /// **'Effacer'**
  String get geoClear;

  /// No description provided for @geoSearchWilayaHint.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher une wilaya…'**
  String get geoSearchWilayaHint;

  /// No description provided for @geoSearchCommuneHint.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher une commune…'**
  String get geoSearchCommuneHint;

  /// No description provided for @geoWilayaEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune wilaya trouvée.'**
  String get geoWilayaEmpty;

  /// No description provided for @geoCommuneEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune commune trouvée.'**
  String get geoCommuneEmpty;

  /// No description provided for @geoWilayasLoadError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger les wilayas.'**
  String get geoWilayasLoadError;

  /// No description provided for @geoCommunesLoadError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger les communes.'**
  String get geoCommunesLoadError;

  /// No description provided for @geoUseWilayaCenter.
  ///
  /// In fr, this message translates to:
  /// **'Utiliser le centre de la wilaya'**
  String get geoUseWilayaCenter;

  /// No description provided for @discoveryAppBarTitle.
  ///
  /// In fr, this message translates to:
  /// **'MedNavigator'**
  String get discoveryAppBarTitle;

  /// No description provided for @discoveryRecommendedTitle.
  ///
  /// In fr, this message translates to:
  /// **'Spécialistes recommandés'**
  String get discoveryRecommendedTitle;

  /// No description provided for @discoveryViewList.
  ///
  /// In fr, this message translates to:
  /// **'Liste'**
  String get discoveryViewList;

  /// No description provided for @discoveryViewMap.
  ///
  /// In fr, this message translates to:
  /// **'Carte'**
  String get discoveryViewMap;

  /// No description provided for @discoveryDoctorsEmptyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Aucun médecin trouvé'**
  String get discoveryDoctorsEmptyTitle;

  /// No description provided for @discoveryDoctorsEmptyMessage.
  ///
  /// In fr, this message translates to:
  /// **'Aucun spécialiste ne correspond pour le moment.'**
  String get discoveryDoctorsEmptyMessage;

  /// No description provided for @discoverySearchAction.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher'**
  String get discoverySearchAction;

  /// No description provided for @discoveryDoctorsLoadError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger la liste des spécialistes.'**
  String get discoveryDoctorsLoadError;

  /// No description provided for @discoveryRateLimitTitle.
  ///
  /// In fr, this message translates to:
  /// **'Trop de requêtes'**
  String get discoveryRateLimitTitle;

  /// No description provided for @discoveryRateLimitMessage.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez patienter {seconds} seconde(s) avant de réessayer.'**
  String discoveryRateLimitMessage(int seconds);

  /// No description provided for @doctorCardBookCta.
  ///
  /// In fr, this message translates to:
  /// **'Prendre RDV'**
  String get doctorCardBookCta;

  /// No description provided for @doctorCardTelehealth.
  ///
  /// In fr, this message translates to:
  /// **'Téléconsultation'**
  String get doctorCardTelehealth;

  /// No description provided for @doctorCardVerifiedBadge.
  ///
  /// In fr, this message translates to:
  /// **'Agréé'**
  String get doctorCardVerifiedBadge;

  /// No description provided for @doctorCardMatchPercent.
  ///
  /// In fr, this message translates to:
  /// **'{percent}% de compatibilité'**
  String doctorCardMatchPercent(int percent);

  /// No description provided for @searchHint.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher un médecin, spécialité…'**
  String get searchHint;

  /// No description provided for @searchEmptyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Aucun médecin ne correspond'**
  String get searchEmptyTitle;

  /// No description provided for @searchEmptyMessage.
  ///
  /// In fr, this message translates to:
  /// **'Élargir la zone ou modifier vos filtres ?'**
  String get searchEmptyMessage;

  /// No description provided for @searchClearFilters.
  ///
  /// In fr, this message translates to:
  /// **'Effacer les filtres'**
  String get searchClearFilters;

  /// No description provided for @searchLoadError.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur s\'est produite lors de la recherche.'**
  String get searchLoadError;

  /// No description provided for @searchSuggestionsEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune suggestion.'**
  String get searchSuggestionsEmpty;

  /// No description provided for @searchSuggestionsLoadError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur lors du chargement des suggestions.'**
  String get searchSuggestionsLoadError;

  /// No description provided for @searchSuggestionsSpecialties.
  ///
  /// In fr, this message translates to:
  /// **'Spécialités'**
  String get searchSuggestionsSpecialties;

  /// No description provided for @searchSuggestionsDoctors.
  ///
  /// In fr, this message translates to:
  /// **'Médecins'**
  String get searchSuggestionsDoctors;

  /// No description provided for @searchSuggestionsLocations.
  ///
  /// In fr, this message translates to:
  /// **'Localisations'**
  String get searchSuggestionsLocations;

  /// No description provided for @searchFiltersTitle.
  ///
  /// In fr, this message translates to:
  /// **'Filtres de recherche'**
  String get searchFiltersTitle;

  /// No description provided for @searchFiltersReset.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser'**
  String get searchFiltersReset;

  /// No description provided for @searchFiltersApply.
  ///
  /// In fr, this message translates to:
  /// **'Appliquer les filtres'**
  String get searchFiltersApply;

  /// No description provided for @searchFilterSpecialty.
  ///
  /// In fr, this message translates to:
  /// **'Spécialité'**
  String get searchFilterSpecialty;

  /// No description provided for @searchFilterSpecialtyAll.
  ///
  /// In fr, this message translates to:
  /// **'Toutes les spécialités'**
  String get searchFilterSpecialtyAll;

  /// No description provided for @searchFilterLocation.
  ///
  /// In fr, this message translates to:
  /// **'Localisation (Wilaya / Commune)'**
  String get searchFilterLocation;

  /// No description provided for @searchFilterLocationAll.
  ///
  /// In fr, this message translates to:
  /// **'Toute l\'Algérie'**
  String get searchFilterLocationAll;

  /// No description provided for @searchFilterGender.
  ///
  /// In fr, this message translates to:
  /// **'Genre'**
  String get searchFilterGender;

  /// No description provided for @searchFilterGenderAny.
  ///
  /// In fr, this message translates to:
  /// **'Tous'**
  String get searchFilterGenderAny;

  /// No description provided for @searchFilterGenderMale.
  ///
  /// In fr, this message translates to:
  /// **'Homme'**
  String get searchFilterGenderMale;

  /// No description provided for @searchFilterGenderFemale.
  ///
  /// In fr, this message translates to:
  /// **'Femme'**
  String get searchFilterGenderFemale;

  /// No description provided for @searchFilterLanguages.
  ///
  /// In fr, this message translates to:
  /// **'Langues parlées'**
  String get searchFilterLanguages;

  /// No description provided for @searchFilterMaxFee.
  ///
  /// In fr, this message translates to:
  /// **'Tarif maximum'**
  String get searchFilterMaxFee;

  /// No description provided for @searchFilterMaxFeeValue.
  ///
  /// In fr, this message translates to:
  /// **'{fee} DZD'**
  String searchFilterMaxFeeValue(int fee);

  /// No description provided for @searchFilterAvailability.
  ///
  /// In fr, this message translates to:
  /// **'Disponibilité'**
  String get searchFilterAvailability;

  /// No description provided for @searchFilterAvailabilityAll.
  ///
  /// In fr, this message translates to:
  /// **'Toutes'**
  String get searchFilterAvailabilityAll;

  /// No description provided for @searchFilterAvailabilityToday.
  ///
  /// In fr, this message translates to:
  /// **'Aujourd\'hui'**
  String get searchFilterAvailabilityToday;

  /// No description provided for @searchFilterAvailability3Days.
  ///
  /// In fr, this message translates to:
  /// **'3 jours'**
  String get searchFilterAvailability3Days;

  /// No description provided for @searchFilterAvailability1Week.
  ///
  /// In fr, this message translates to:
  /// **'1 semaine'**
  String get searchFilterAvailability1Week;

  /// No description provided for @searchFilterAvailability1Month.
  ///
  /// In fr, this message translates to:
  /// **'1 mois'**
  String get searchFilterAvailability1Month;

  /// No description provided for @searchFilterTelehealth.
  ///
  /// In fr, this message translates to:
  /// **'Téléconsultation disponible'**
  String get searchFilterTelehealth;

  /// No description provided for @searchFilterInsurance.
  ///
  /// In fr, this message translates to:
  /// **'Assurances acceptées'**
  String get searchFilterInsurance;

  /// No description provided for @searchFilterInsuranceCnas.
  ///
  /// In fr, this message translates to:
  /// **'Conventionné CNAS'**
  String get searchFilterInsuranceCnas;

  /// No description provided for @searchFilterInsuranceCasnos.
  ///
  /// In fr, this message translates to:
  /// **'Conventionné CASNOS'**
  String get searchFilterInsuranceCasnos;

  /// No description provided for @searchFilterSort.
  ///
  /// In fr, this message translates to:
  /// **'Trier par'**
  String get searchFilterSort;

  /// No description provided for @searchFilterSortRelevance.
  ///
  /// In fr, this message translates to:
  /// **'Pertinence'**
  String get searchFilterSortRelevance;

  /// No description provided for @searchFilterSortRating.
  ///
  /// In fr, this message translates to:
  /// **'Note la plus haute'**
  String get searchFilterSortRating;

  /// No description provided for @searchFilterSortFeeAsc.
  ///
  /// In fr, this message translates to:
  /// **'Tarif croissant'**
  String get searchFilterSortFeeAsc;

  /// No description provided for @searchFilterSortFeeDesc.
  ///
  /// In fr, this message translates to:
  /// **'Tarif décroissant'**
  String get searchFilterSortFeeDesc;

  /// No description provided for @searchFilterSortDistance.
  ///
  /// In fr, this message translates to:
  /// **'Distance croissante'**
  String get searchFilterSortDistance;

  /// No description provided for @doctorDetailTitle.
  ///
  /// In fr, this message translates to:
  /// **'Profil du spécialiste'**
  String get doctorDetailTitle;

  /// No description provided for @doctorDetailBioTitle.
  ///
  /// In fr, this message translates to:
  /// **'Biographie'**
  String get doctorDetailBioTitle;

  /// No description provided for @doctorDetailBioEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune biographie disponible.'**
  String get doctorDetailBioEmpty;

  /// No description provided for @doctorDetailBioExpand.
  ///
  /// In fr, this message translates to:
  /// **'Lire la suite'**
  String get doctorDetailBioExpand;

  /// No description provided for @doctorDetailBioCollapse.
  ///
  /// In fr, this message translates to:
  /// **'Voir moins'**
  String get doctorDetailBioCollapse;

  /// No description provided for @doctorDetailFeeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Tarifs de consultation'**
  String get doctorDetailFeeTitle;

  /// No description provided for @doctorDetailFeeInPerson.
  ///
  /// In fr, this message translates to:
  /// **'Consultation en cabinet'**
  String get doctorDetailFeeInPerson;

  /// No description provided for @doctorDetailFeeValue.
  ///
  /// In fr, this message translates to:
  /// **'{fee} DZD'**
  String doctorDetailFeeValue(int fee);

  /// No description provided for @doctorDetailLanguagesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Langues parlées'**
  String get doctorDetailLanguagesTitle;

  /// No description provided for @doctorDetailLanguagesEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Non renseigné'**
  String get doctorDetailLanguagesEmpty;

  /// No description provided for @doctorDetailAddressTitle.
  ///
  /// In fr, this message translates to:
  /// **'Adresse de pratique'**
  String get doctorDetailAddressTitle;

  /// No description provided for @doctorDetailMapUnavailable.
  ///
  /// In fr, this message translates to:
  /// **'Carte indisponible'**
  String get doctorDetailMapUnavailable;

  /// No description provided for @doctorDetailReviewsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Avis des patients'**
  String get doctorDetailReviewsTitle;

  /// No description provided for @doctorDetailReviewsEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucun avis pour le moment.'**
  String get doctorDetailReviewsEmpty;

  /// No description provided for @doctorDetailReviewsLoadMore.
  ///
  /// In fr, this message translates to:
  /// **'Voir plus'**
  String get doctorDetailReviewsLoadMore;

  /// No description provided for @doctorDetailVerifiedPatient.
  ///
  /// In fr, this message translates to:
  /// **'Patient vérifié'**
  String get doctorDetailVerifiedPatient;

  /// No description provided for @doctorDetailBookCta.
  ///
  /// In fr, this message translates to:
  /// **'Réserver'**
  String get doctorDetailBookCta;

  /// No description provided for @doctorDetailTelehealthCta.
  ///
  /// In fr, this message translates to:
  /// **'Téléconsultation'**
  String get doctorDetailTelehealthCta;

  /// No description provided for @doctorDetailNotFoundTitle.
  ///
  /// In fr, this message translates to:
  /// **'Médecin introuvable'**
  String get doctorDetailNotFoundTitle;

  /// No description provided for @doctorDetailNotFoundMessage.
  ///
  /// In fr, this message translates to:
  /// **'Le profil de ce spécialiste n\'est pas disponible.'**
  String get doctorDetailNotFoundMessage;

  /// No description provided for @doctorDetailLoadError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger le profil de ce spécialiste.'**
  String get doctorDetailLoadError;

  /// No description provided for @mapNearbyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Médecins à proximité'**
  String get mapNearbyTitle;

  /// No description provided for @mapNearbyLoadErrorTitle.
  ///
  /// In fr, this message translates to:
  /// **'Erreur de chargement'**
  String get mapNearbyLoadErrorTitle;

  /// No description provided for @mapNearbyLoadErrorMessage.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur s\'est produite sur la carte.'**
  String get mapNearbyLoadErrorMessage;

  /// No description provided for @mapNearbyPermissionBanner.
  ///
  /// In fr, this message translates to:
  /// **'Autoriser la localisation pour voir les médecins autour de vous.'**
  String get mapNearbyPermissionBanner;

  /// No description provided for @mapNearbyPermissionRationaleTitle.
  ///
  /// In fr, this message translates to:
  /// **'Accès à la localisation'**
  String get mapNearbyPermissionRationaleTitle;

  /// No description provided for @mapNearbyPermissionRationaleBody.
  ///
  /// In fr, this message translates to:
  /// **'MedNavigator utilise votre position pour afficher les spécialistes à proximité. Vous pouvez aussi choisir une wilaya manuellement.'**
  String get mapNearbyPermissionRationaleBody;

  /// No description provided for @mapNearbyPermissionRationaleContinue.
  ///
  /// In fr, this message translates to:
  /// **'Continuer'**
  String get mapNearbyPermissionRationaleContinue;

  /// No description provided for @mapNearbyPermissionRationaleCancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get mapNearbyPermissionRationaleCancel;

  /// No description provided for @mapNearbyPermissionAllow.
  ///
  /// In fr, this message translates to:
  /// **'Autoriser'**
  String get mapNearbyPermissionAllow;

  /// No description provided for @mapNearbyChooseWilaya.
  ///
  /// In fr, this message translates to:
  /// **'Choisir une wilaya'**
  String get mapNearbyChooseWilaya;

  /// No description provided for @mapNearbyMyLocation.
  ///
  /// In fr, this message translates to:
  /// **'Ma position'**
  String get mapNearbyMyLocation;

  /// No description provided for @mapNearbyEdit.
  ///
  /// In fr, this message translates to:
  /// **'Modifier'**
  String get mapNearbyEdit;

  /// No description provided for @mapNearbyWilayaSearch.
  ///
  /// In fr, this message translates to:
  /// **'Recherche par wilaya'**
  String get mapNearbyWilayaSearch;

  /// No description provided for @mapNearbyWilayaSearchNamed.
  ///
  /// In fr, this message translates to:
  /// **'Recherche par wilaya ({wilaya})'**
  String mapNearbyWilayaSearchNamed(String wilaya);

  /// No description provided for @mapNearbyLocationComma.
  ///
  /// In fr, this message translates to:
  /// **'{commune}, {wilaya}'**
  String mapNearbyLocationComma(String commune, String wilaya);

  /// No description provided for @mapNearbyRadiusLabel.
  ///
  /// In fr, this message translates to:
  /// **'Rayon :'**
  String get mapNearbyRadiusLabel;

  /// No description provided for @mapNearbyRadiusValue.
  ///
  /// In fr, this message translates to:
  /// **'{radius} km'**
  String mapNearbyRadiusValue(String radius);

  /// No description provided for @mapNearbyClusterCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} médecins'**
  String mapNearbyClusterCount(int count);

  /// No description provided for @mapNearbyChooseWilayaTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Choisir wilaya'**
  String get mapNearbyChooseWilayaTooltip;

  /// No description provided for @mapNearbySpecialtyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionner une spécialité'**
  String get mapNearbySpecialtyTitle;

  /// No description provided for @mapNearbySpecialtyClear.
  ///
  /// In fr, this message translates to:
  /// **'Effacer'**
  String get mapNearbySpecialtyClear;

  /// No description provided for @profileTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mon profil'**
  String get profileTitle;

  /// No description provided for @profileEdit.
  ///
  /// In fr, this message translates to:
  /// **'Modifier'**
  String get profileEdit;

  /// No description provided for @profileSave.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer'**
  String get profileSave;

  /// No description provided for @profileAccount.
  ///
  /// In fr, this message translates to:
  /// **'Compte'**
  String get profileAccount;

  /// No description provided for @profileSignOut.
  ///
  /// In fr, this message translates to:
  /// **'Se déconnecter'**
  String get profileSignOut;

  /// No description provided for @profileFullName.
  ///
  /// In fr, this message translates to:
  /// **'Nom complet'**
  String get profileFullName;

  /// No description provided for @profilePhone.
  ///
  /// In fr, this message translates to:
  /// **'Téléphone'**
  String get profilePhone;

  /// No description provided for @profileEmail.
  ///
  /// In fr, this message translates to:
  /// **'E-mail'**
  String get profileEmail;

  /// No description provided for @profileBirthDate.
  ///
  /// In fr, this message translates to:
  /// **'Date de naissance'**
  String get profileBirthDate;

  /// No description provided for @profileGender.
  ///
  /// In fr, this message translates to:
  /// **'Genre'**
  String get profileGender;

  /// No description provided for @profileBloodType.
  ///
  /// In fr, this message translates to:
  /// **'Groupe sanguin'**
  String get profileBloodType;

  /// No description provided for @profileAddress.
  ///
  /// In fr, this message translates to:
  /// **'Adresse'**
  String get profileAddress;

  /// No description provided for @profileAddressLine1.
  ///
  /// In fr, this message translates to:
  /// **'Rue et numéro'**
  String get profileAddressLine1;

  /// No description provided for @profileAddressLine2.
  ///
  /// In fr, this message translates to:
  /// **'Complément d\'adresse'**
  String get profileAddressLine2;

  /// No description provided for @profilePostalCode.
  ///
  /// In fr, this message translates to:
  /// **'Code postal'**
  String get profilePostalCode;

  /// No description provided for @profileAllergies.
  ///
  /// In fr, this message translates to:
  /// **'Allergies'**
  String get profileAllergies;

  /// No description provided for @profileChronicConditions.
  ///
  /// In fr, this message translates to:
  /// **'Maladies chroniques'**
  String get profileChronicConditions;

  /// No description provided for @profileInsurance.
  ///
  /// In fr, this message translates to:
  /// **'Assurance'**
  String get profileInsurance;

  /// No description provided for @profileInsuranceProvider.
  ///
  /// In fr, this message translates to:
  /// **'Organisme'**
  String get profileInsuranceProvider;

  /// No description provided for @profileInsuranceNumber.
  ///
  /// In fr, this message translates to:
  /// **'Numéro d\'assuré'**
  String get profileInsuranceNumber;

  /// No description provided for @profileNotSet.
  ///
  /// In fr, this message translates to:
  /// **'Non renseigné'**
  String get profileNotSet;

  /// No description provided for @profileReadOnlyField.
  ///
  /// In fr, this message translates to:
  /// **'Non modifiable'**
  String get profileReadOnlyField;

  /// No description provided for @profileGenderMale.
  ///
  /// In fr, this message translates to:
  /// **'Homme'**
  String get profileGenderMale;

  /// No description provided for @profileGenderFemale.
  ///
  /// In fr, this message translates to:
  /// **'Femme'**
  String get profileGenderFemale;

  /// No description provided for @profileGenderOther.
  ///
  /// In fr, this message translates to:
  /// **'Autre'**
  String get profileGenderOther;

  /// No description provided for @profileInsuranceCnas.
  ///
  /// In fr, this message translates to:
  /// **'CNAS'**
  String get profileInsuranceCnas;

  /// No description provided for @profileInsuranceCasnos.
  ///
  /// In fr, this message translates to:
  /// **'CASNOS'**
  String get profileInsuranceCasnos;

  /// No description provided for @profileInsuranceNone.
  ///
  /// In fr, this message translates to:
  /// **'Aucune'**
  String get profileInsuranceNone;

  /// No description provided for @profileInsurancePrivate.
  ///
  /// In fr, this message translates to:
  /// **'Privée'**
  String get profileInsurancePrivate;

  /// No description provided for @profilePickBirthDate.
  ///
  /// In fr, this message translates to:
  /// **'Choisir une date'**
  String get profilePickBirthDate;

  /// No description provided for @profilePickAddress.
  ///
  /// In fr, this message translates to:
  /// **'Choisir wilaya et commune'**
  String get profilePickAddress;

  /// No description provided for @profileTagHint.
  ///
  /// In fr, this message translates to:
  /// **'Saisir puis Entrée'**
  String get profileTagHint;

  /// No description provided for @profileAddTag.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter'**
  String get profileAddTag;

  /// No description provided for @profileInvalidEmail.
  ///
  /// In fr, this message translates to:
  /// **'Adresse e-mail invalide'**
  String get profileInvalidEmail;

  /// No description provided for @profileInvalidBirthDate.
  ///
  /// In fr, this message translates to:
  /// **'La date de naissance ne peut pas être dans le futur'**
  String get profileInvalidBirthDate;

  /// No description provided for @profileLoadError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger le profil'**
  String get profileLoadError;

  /// No description provided for @profileSaveError.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrement impossible'**
  String get profileSaveError;

  /// No description provided for @profileDeleteAccount.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer mon compte'**
  String get profileDeleteAccount;

  /// No description provided for @profileDeleteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer votre compte ?'**
  String get profileDeleteTitle;

  /// No description provided for @profileDeleteWarning.
  ///
  /// In fr, this message translates to:
  /// **'Cette action programme la suppression définitive de votre compte et de vos données personnelles.'**
  String get profileDeleteWarning;

  /// No description provided for @profileDeleteGracePeriod.
  ///
  /// In fr, this message translates to:
  /// **'Vous disposez d\'un délai de 30 jours pour annuler la suppression en vous reconnectant.'**
  String get profileDeleteGracePeriod;

  /// No description provided for @profileDeleteConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Oui, supprimer mon compte'**
  String get profileDeleteConfirm;

  /// No description provided for @profileDeleteFinalTitle.
  ///
  /// In fr, this message translates to:
  /// **'Confirmation finale'**
  String get profileDeleteFinalTitle;

  /// No description provided for @profileDeleteFinalMessage.
  ///
  /// In fr, this message translates to:
  /// **'Êtes-vous absolument certain ? Votre compte sera programmé pour suppression.'**
  String get profileDeleteFinalMessage;

  /// No description provided for @profileDeleteSuccess.
  ///
  /// In fr, this message translates to:
  /// **'Compte programmé pour suppression'**
  String get profileDeleteSuccess;

  /// No description provided for @profileDeleteError.
  ///
  /// In fr, this message translates to:
  /// **'Suppression impossible'**
  String get profileDeleteError;

  /// No description provided for @profileConsents.
  ///
  /// In fr, this message translates to:
  /// **'Consentements ANPDP'**
  String get profileConsents;

  /// No description provided for @consentManagementTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mes consentements'**
  String get consentManagementTitle;

  /// No description provided for @consentVersionLabel.
  ///
  /// In fr, this message translates to:
  /// **'Version {version}'**
  String consentVersionLabel(String version);

  /// No description provided for @consentGrantedAtLabel.
  ///
  /// In fr, this message translates to:
  /// **'Accordé le {date}'**
  String consentGrantedAtLabel(String date);

  /// No description provided for @consentRevokedAtLabel.
  ///
  /// In fr, this message translates to:
  /// **'Révoqué le {date}'**
  String consentRevokedAtLabel(String date);

  /// No description provided for @consentActive.
  ///
  /// In fr, this message translates to:
  /// **'Actif'**
  String get consentActive;

  /// No description provided for @consentRevoked.
  ///
  /// In fr, this message translates to:
  /// **'Révoqué'**
  String get consentRevoked;

  /// No description provided for @consentRevokeEssential.
  ///
  /// In fr, this message translates to:
  /// **'Retirer mon consentement'**
  String get consentRevokeEssential;

  /// No description provided for @consentRevokeEssentialTitle.
  ///
  /// In fr, this message translates to:
  /// **'Retirer un consentement essentiel ?'**
  String get consentRevokeEssentialTitle;

  /// No description provided for @consentRevokeEssentialMessage.
  ///
  /// In fr, this message translates to:
  /// **'Le retrait d\'un consentement essentiel suspendra votre compte. Vous ne pourrez plus utiliser l\'application tant que le compte n\'est pas réactivé.'**
  String get consentRevokeEssentialMessage;

  /// No description provided for @consentRevokeEssentialConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Retirer et suspendre'**
  String get consentRevokeEssentialConfirm;

  /// No description provided for @consentRevokeError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de révoquer le consentement'**
  String get consentRevokeError;

  /// No description provided for @consentRevokedLandingTitle.
  ///
  /// In fr, this message translates to:
  /// **'Compte suspendu'**
  String get consentRevokedLandingTitle;

  /// No description provided for @consentRevokedLandingMessage.
  ///
  /// In fr, this message translates to:
  /// **'Vous avez retiré un consentement essentiel. Votre compte est suspendu conformément à la réglementation ANPDP.'**
  String get consentRevokedLandingMessage;

  /// No description provided for @consentRevokedLandingAction.
  ///
  /// In fr, this message translates to:
  /// **'Retour à l\'accueil'**
  String get consentRevokedLandingAction;

  /// No description provided for @dependentsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ayants droit'**
  String get dependentsTitle;

  /// No description provided for @dependentsAdd.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un ayant droit'**
  String get dependentsAdd;

  /// No description provided for @dependentsEdit.
  ///
  /// In fr, this message translates to:
  /// **'Modifier l\'ayant droit'**
  String get dependentsEdit;

  /// No description provided for @dependentsEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucun ayant droit enregistré'**
  String get dependentsEmpty;

  /// No description provided for @dependentsDeleteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer cet ayant droit ?'**
  String get dependentsDeleteTitle;

  /// No description provided for @dependentsDeleteMessage.
  ///
  /// In fr, this message translates to:
  /// **'Cette action est définitive. Les rendez-vous passés restent liés à cette personne.'**
  String get dependentsDeleteMessage;

  /// No description provided for @dependentsDeleteConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer'**
  String get dependentsDeleteConfirm;

  /// No description provided for @dependentFullName.
  ///
  /// In fr, this message translates to:
  /// **'Nom complet'**
  String get dependentFullName;

  /// No description provided for @dependentRelation.
  ///
  /// In fr, this message translates to:
  /// **'Lien de parenté'**
  String get dependentRelation;

  /// No description provided for @dependentBirthDate.
  ///
  /// In fr, this message translates to:
  /// **'Date de naissance'**
  String get dependentBirthDate;

  /// No description provided for @dependentGender.
  ///
  /// In fr, this message translates to:
  /// **'Genre'**
  String get dependentGender;

  /// No description provided for @dependentRelationChild.
  ///
  /// In fr, this message translates to:
  /// **'Enfant'**
  String get dependentRelationChild;

  /// No description provided for @dependentRelationSpouse.
  ///
  /// In fr, this message translates to:
  /// **'Conjoint(e)'**
  String get dependentRelationSpouse;

  /// No description provided for @dependentRelationParent.
  ///
  /// In fr, this message translates to:
  /// **'Parent'**
  String get dependentRelationParent;

  /// No description provided for @dependentRelationOther.
  ///
  /// In fr, this message translates to:
  /// **'Autre'**
  String get dependentRelationOther;

  /// No description provided for @dependentAgeYears.
  ///
  /// In fr, this message translates to:
  /// **'{age} ans'**
  String dependentAgeYears(int age);

  /// No description provided for @dependentSaveError.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrement impossible'**
  String get dependentSaveError;

  /// No description provided for @dependentDeleteError.
  ///
  /// In fr, this message translates to:
  /// **'Suppression impossible'**
  String get dependentDeleteError;

  /// No description provided for @medicalRecordsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Dossier médical'**
  String get medicalRecordsTitle;

  /// No description provided for @medicalRecordsEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucun document'**
  String get medicalRecordsEmpty;

  /// No description provided for @medicalRecordsLoadError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger les documents'**
  String get medicalRecordsLoadError;

  /// No description provided for @medicalRecordsFilterAll.
  ///
  /// In fr, this message translates to:
  /// **'Tous'**
  String get medicalRecordsFilterAll;

  /// No description provided for @medicalRecordTypePrescription.
  ///
  /// In fr, this message translates to:
  /// **'Ordonnance'**
  String get medicalRecordTypePrescription;

  /// No description provided for @medicalRecordTypeReport.
  ///
  /// In fr, this message translates to:
  /// **'Compte-rendu'**
  String get medicalRecordTypeReport;

  /// No description provided for @medicalRecordTypeLabResult.
  ///
  /// In fr, this message translates to:
  /// **'Analyse'**
  String get medicalRecordTypeLabResult;

  /// No description provided for @medicalRecordTypeImaging.
  ///
  /// In fr, this message translates to:
  /// **'Imagerie'**
  String get medicalRecordTypeImaging;

  /// No description provided for @medicalRecordTypeCertificate.
  ///
  /// In fr, this message translates to:
  /// **'Certificat'**
  String get medicalRecordTypeCertificate;

  /// No description provided for @medicalRecordTypeOther.
  ///
  /// In fr, this message translates to:
  /// **'Autre'**
  String get medicalRecordTypeOther;

  /// No description provided for @medicalRecordAuthorPatient.
  ///
  /// In fr, this message translates to:
  /// **'Patient'**
  String get medicalRecordAuthorPatient;

  /// No description provided for @medicalRecordAuthorSpecialist.
  ///
  /// In fr, this message translates to:
  /// **'Médecin'**
  String get medicalRecordAuthorSpecialist;

  /// No description provided for @medicalRecordAuthorConcierge.
  ///
  /// In fr, this message translates to:
  /// **'Concierge'**
  String get medicalRecordAuthorConcierge;

  /// No description provided for @medicalRecordViewerPlaceholder.
  ///
  /// In fr, this message translates to:
  /// **'L\'aperçu du document sera disponible prochainement.'**
  String get medicalRecordViewerPlaceholder;

  /// No description provided for @medicalRecordFileSizeBytes.
  ///
  /// In fr, this message translates to:
  /// **'{size} o'**
  String medicalRecordFileSizeBytes(int size);

  /// No description provided for @medicalRecordFileSizeKb.
  ///
  /// In fr, this message translates to:
  /// **'{size} Ko'**
  String medicalRecordFileSizeKb(String size);

  /// No description provided for @medicalRecordFileSizeMb.
  ///
  /// In fr, this message translates to:
  /// **'{size} Mo'**
  String medicalRecordFileSizeMb(String size);

  /// No description provided for @medicalRecordsUpload.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un document'**
  String get medicalRecordsUpload;

  /// No description provided for @medicalRecordsUploadAddCamera.
  ///
  /// In fr, this message translates to:
  /// **'Appareil photo'**
  String get medicalRecordsUploadAddCamera;

  /// No description provided for @medicalRecordsUploadAddGallery.
  ///
  /// In fr, this message translates to:
  /// **'Galerie'**
  String get medicalRecordsUploadAddGallery;

  /// No description provided for @medicalRecordsUploadAddFiles.
  ///
  /// In fr, this message translates to:
  /// **'Fichiers PDF'**
  String get medicalRecordsUploadAddFiles;

  /// No description provided for @medicalRecordUploadType.
  ///
  /// In fr, this message translates to:
  /// **'Type de document'**
  String get medicalRecordUploadType;

  /// No description provided for @medicalRecordUploadTitle.
  ///
  /// In fr, this message translates to:
  /// **'Titre (optionnel)'**
  String get medicalRecordUploadTitle;

  /// No description provided for @medicalRecordUploadNotes.
  ///
  /// In fr, this message translates to:
  /// **'Notes (optionnel)'**
  String get medicalRecordUploadNotes;

  /// No description provided for @medicalRecordUploadPatient.
  ///
  /// In fr, this message translates to:
  /// **'Patient concerné'**
  String get medicalRecordUploadPatient;

  /// No description provided for @medicalRecordUploadSubmit.
  ///
  /// In fr, this message translates to:
  /// **'Téléverser'**
  String get medicalRecordUploadSubmit;

  /// No description provided for @medicalRecordUploadMaxFiles.
  ///
  /// In fr, this message translates to:
  /// **'Maximum {count} fichiers par envoi'**
  String medicalRecordUploadMaxFiles(int count);

  /// No description provided for @medicalRecordUploadFileTooLarge.
  ///
  /// In fr, this message translates to:
  /// **'Chaque fichier doit faire 20 Mo ou moins.'**
  String get medicalRecordUploadFileTooLarge;

  /// No description provided for @medicalRecordUploadInvalidMime.
  ///
  /// In fr, this message translates to:
  /// **'Formats acceptés : PDF, JPEG ou PNG uniquement.'**
  String get medicalRecordUploadInvalidMime;

  /// No description provided for @medicalRecordUploadTypeRequired.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionnez un type de document.'**
  String get medicalRecordUploadTypeRequired;

  /// No description provided for @medicalRecordUploadNoFiles.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez au moins un fichier.'**
  String get medicalRecordUploadNoFiles;

  /// No description provided for @medicalRecordUploadStorageUnavailable.
  ///
  /// In fr, this message translates to:
  /// **'Le service de fichiers est temporairement indisponible. Réessayer plus tard.'**
  String get medicalRecordUploadStorageUnavailable;

  /// No description provided for @medicalRecordUploadCancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get medicalRecordUploadCancel;

  /// No description provided for @medicalRecordUploadSuccess.
  ///
  /// In fr, this message translates to:
  /// **'Document ajouté'**
  String get medicalRecordUploadSuccess;

  /// No description provided for @medicalRecordUploadFailed.
  ///
  /// In fr, this message translates to:
  /// **'Échec du téléversement'**
  String get medicalRecordUploadFailed;

  /// No description provided for @medicalRecordDownload.
  ///
  /// In fr, this message translates to:
  /// **'Télécharger'**
  String get medicalRecordDownload;

  /// No description provided for @medicalRecordShare.
  ///
  /// In fr, this message translates to:
  /// **'Partager'**
  String get medicalRecordShare;

  /// No description provided for @medicalRecordDownloadSuccess.
  ///
  /// In fr, this message translates to:
  /// **'Fichier enregistré dans Téléchargements'**
  String get medicalRecordDownloadSuccess;

  /// No description provided for @medicalRecordViewerLoadError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d\'ouvrir le document'**
  String get medicalRecordViewerLoadError;

  /// No description provided for @medicalRecordDeleteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer ce document ?'**
  String get medicalRecordDeleteTitle;

  /// No description provided for @medicalRecordDeleteMessage.
  ///
  /// In fr, this message translates to:
  /// **'Cette action est définitive. Le fichier sera retiré de votre dossier.'**
  String get medicalRecordDeleteMessage;

  /// No description provided for @medicalRecordDeleteConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer'**
  String get medicalRecordDeleteConfirm;

  /// No description provided for @medicalRecordDeleteError.
  ///
  /// In fr, this message translates to:
  /// **'Suppression impossible'**
  String get medicalRecordDeleteError;

  /// No description provided for @messagingTitle.
  ///
  /// In fr, this message translates to:
  /// **'Messagerie'**
  String get messagingTitle;

  /// No description provided for @messagingEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune conversation pour le moment'**
  String get messagingEmpty;

  /// No description provided for @messagingLoadError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger les conversations'**
  String get messagingLoadError;

  /// No description provided for @messagingAttachmentPreview.
  ///
  /// In fr, this message translates to:
  /// **'Pièce jointe'**
  String get messagingAttachmentPreview;

  /// No description provided for @messagingThreadPlaceholder.
  ///
  /// In fr, this message translates to:
  /// **'Conversation — détail disponible prochainement'**
  String get messagingThreadPlaceholder;

  /// No description provided for @messagingComposerHint.
  ///
  /// In fr, this message translates to:
  /// **'Écrire un message…'**
  String get messagingComposerHint;

  /// No description provided for @messagingSend.
  ///
  /// In fr, this message translates to:
  /// **'Envoyer'**
  String get messagingSend;

  /// No description provided for @messagingAttach.
  ///
  /// In fr, this message translates to:
  /// **'Joindre un document'**
  String get messagingAttach;

  /// No description provided for @messagingPickAttachments.
  ///
  /// In fr, this message translates to:
  /// **'Choisir des documents'**
  String get messagingPickAttachments;

  /// No description provided for @messagingAttachConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Joindre la sélection'**
  String get messagingAttachConfirm;

  /// No description provided for @messagingMessagePending.
  ///
  /// In fr, this message translates to:
  /// **'Envoi…'**
  String get messagingMessagePending;

  /// No description provided for @messagingMessageSent.
  ///
  /// In fr, this message translates to:
  /// **'Envoyé'**
  String get messagingMessageSent;

  /// No description provided for @messagingMessageRead.
  ///
  /// In fr, this message translates to:
  /// **'Lu'**
  String get messagingMessageRead;

  /// No description provided for @messagingSendError.
  ///
  /// In fr, this message translates to:
  /// **'Échec de l\'envoi'**
  String get messagingSendError;

  /// No description provided for @messagingLoadMessagesError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger les messages'**
  String get messagingLoadMessagesError;

  /// No description provided for @notificationsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune notification'**
  String get notificationsEmpty;

  /// No description provided for @notificationsLoadError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger les notifications'**
  String get notificationsLoadError;

  /// No description provided for @notificationsMarkAllRead.
  ///
  /// In fr, this message translates to:
  /// **'Tout marquer lu'**
  String get notificationsMarkAllRead;

  /// No description provided for @notificationsPreferences.
  ///
  /// In fr, this message translates to:
  /// **'Préférences'**
  String get notificationsPreferences;

  /// No description provided for @notificationsPreferencesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Préférences de notification'**
  String get notificationsPreferencesTitle;

  /// No description provided for @notificationsPrefPush.
  ///
  /// In fr, this message translates to:
  /// **'Notifications push'**
  String get notificationsPrefPush;

  /// No description provided for @notificationsPrefSms.
  ///
  /// In fr, this message translates to:
  /// **'SMS'**
  String get notificationsPrefSms;

  /// No description provided for @notificationsPrefEmail.
  ///
  /// In fr, this message translates to:
  /// **'E-mail'**
  String get notificationsPrefEmail;

  /// No description provided for @notificationsPrefAppointmentReminders.
  ///
  /// In fr, this message translates to:
  /// **'Rappels de rendez-vous'**
  String get notificationsPrefAppointmentReminders;

  /// No description provided for @notificationsPrefMarketing.
  ///
  /// In fr, this message translates to:
  /// **'Offres et actualités'**
  String get notificationsPrefMarketing;

  /// No description provided for @notificationsPrefReminderHours.
  ///
  /// In fr, this message translates to:
  /// **'Rappel avant le rendez-vous'**
  String get notificationsPrefReminderHours;

  /// No description provided for @notificationsPrefReminderHoursValue.
  ///
  /// In fr, this message translates to:
  /// **'{hours} h avant'**
  String notificationsPrefReminderHoursValue(int hours);

  /// No description provided for @notificationsPrefSaveError.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrement impossible'**
  String get notificationsPrefSaveError;

  /// No description provided for @reviewCreateTitle.
  ///
  /// In fr, this message translates to:
  /// **'Laisser un avis'**
  String get reviewCreateTitle;

  /// No description provided for @reviewRatingLabel.
  ///
  /// In fr, this message translates to:
  /// **'Note'**
  String get reviewRatingLabel;

  /// No description provided for @reviewCommentLabel.
  ///
  /// In fr, this message translates to:
  /// **'Commentaire (optionnel)'**
  String get reviewCommentLabel;

  /// No description provided for @reviewCommentHint.
  ///
  /// In fr, this message translates to:
  /// **'Partagez votre expérience…'**
  String get reviewCommentHint;

  /// No description provided for @reviewSubmit.
  ///
  /// In fr, this message translates to:
  /// **'Envoyer'**
  String get reviewSubmit;

  /// No description provided for @reviewSubmitError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d\'envoyer l\'avis.'**
  String get reviewSubmitError;

  /// No description provided for @reviewRatingRequired.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez sélectionner une note.'**
  String get reviewRatingRequired;

  /// No description provided for @reviewCommentTooLong.
  ///
  /// In fr, this message translates to:
  /// **'Le commentaire ne doit pas dépasser {max} caractères.'**
  String reviewCommentTooLong(int max);

  /// No description provided for @reviewConfirmationTitle.
  ///
  /// In fr, this message translates to:
  /// **'Merci pour votre avis'**
  String get reviewConfirmationTitle;

  /// No description provided for @reviewConfirmationBody.
  ///
  /// In fr, this message translates to:
  /// **'Votre avis est en attente de modération. Il sera publié après validation par notre équipe, généralement sous 48 heures.'**
  String get reviewConfirmationBody;

  /// No description provided for @reviewConfirmationStatusPending.
  ///
  /// In fr, this message translates to:
  /// **'En attente de modération'**
  String get reviewConfirmationStatusPending;

  /// No description provided for @reviewAlreadySubmitted.
  ///
  /// In fr, this message translates to:
  /// **'Vous avez déjà laissé un avis'**
  String get reviewAlreadySubmitted;

  /// No description provided for @reviewDelete.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer mon avis'**
  String get reviewDelete;

  /// No description provided for @reviewDeleteConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer cet avis ?'**
  String get reviewDeleteConfirm;

  /// No description provided for @reviewDeleteSuccess.
  ///
  /// In fr, this message translates to:
  /// **'Avis supprimé.'**
  String get reviewDeleteSuccess;

  /// No description provided for @reviewDeleteError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de supprimer l\'avis.'**
  String get reviewDeleteError;

  /// No description provided for @reviewDeleteExpired.
  ///
  /// In fr, this message translates to:
  /// **'La suppression n\'est plus possible après 7 jours.'**
  String get reviewDeleteExpired;

  /// No description provided for @reviewAlreadyExistsError.
  ///
  /// In fr, this message translates to:
  /// **'Un avis existe déjà pour ce rendez-vous.'**
  String get reviewAlreadyExistsError;

  /// No description provided for @reviewNotEligibleError.
  ///
  /// In fr, this message translates to:
  /// **'Ce rendez-vous ne permet pas de publier un avis.'**
  String get reviewNotEligibleError;

  /// No description provided for @reviewBackToAppointment.
  ///
  /// In fr, this message translates to:
  /// **'Retour au rendez-vous'**
  String get reviewBackToAppointment;

  /// No description provided for @reviewStarsLabel.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =1{1 étoile} other{{count} étoiles}}'**
  String reviewStarsLabel(int count);

  /// No description provided for @paymentDepositTitle.
  ///
  /// In fr, this message translates to:
  /// **'Payer l\'acompte'**
  String get paymentDepositTitle;

  /// No description provided for @paymentDepositBody.
  ///
  /// In fr, this message translates to:
  /// **'Un acompte de {amount} DZD est requis pour confirmer ce rendez-vous.'**
  String paymentDepositBody(int amount);

  /// No description provided for @paymentDepositCta.
  ///
  /// In fr, this message translates to:
  /// **'Payer l\'acompte'**
  String get paymentDepositCta;

  /// No description provided for @paymentDepositAmountLabel.
  ///
  /// In fr, this message translates to:
  /// **'{amount} DZD'**
  String paymentDepositAmountLabel(int amount);

  /// No description provided for @paymentDepositProviderStripeTest.
  ///
  /// In fr, this message translates to:
  /// **'Mode test (sandbox)'**
  String get paymentDepositProviderStripeTest;

  /// No description provided for @paymentDepositSandboxHint.
  ///
  /// In fr, this message translates to:
  /// **'Le paiement est simulé en environnement de test.'**
  String get paymentDepositSandboxHint;

  /// No description provided for @paymentDepositSuccess.
  ///
  /// In fr, this message translates to:
  /// **'Paiement réussi. Votre rendez-vous est à jour.'**
  String get paymentDepositSuccess;

  /// No description provided for @paymentDepositFailed.
  ///
  /// In fr, this message translates to:
  /// **'Le paiement a échoué.'**
  String get paymentDepositFailed;

  /// No description provided for @paymentDepositNotEligible.
  ///
  /// In fr, this message translates to:
  /// **'Ce rendez-vous n\'est pas éligible au paiement.'**
  String get paymentDepositNotEligible;
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
