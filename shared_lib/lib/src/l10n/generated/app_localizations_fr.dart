// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get splashSubtitle => 'De l\'errance à l\'orientation intelligente';

  @override
  String get chooseLanguage => 'Choisissez votre langue';

  @override
  String get continueLabel => 'Continuer';

  @override
  String get skip => 'Passer';

  @override
  String get next => 'Suivant';

  @override
  String get start => 'Commencer';

  @override
  String get onboardingTitle1 => 'De l\'errance à l\'orientation intelligente';

  @override
  String get onboardingTitle2 => 'Comment ça fonctionne ?';

  @override
  String get onboardingTitle3 => 'Vos données, protégées en Algérie';

  @override
  String get onboardingBody1 =>
      'Fini le nomadisme médical. Le bon spécialiste, au bon moment.';

  @override
  String get onboardingBody2 =>
      'Parcours en 4 étapes : localisation, dépistage, coaching, orientation.';

  @override
  String get onboardingBody3 =>
      'Hébergement local ANPDP, chiffrement, médecins vérifiés.';

  @override
  String get welcomeTitle => 'Bienvenue';

  @override
  String get welcomeSubtitle => 'Votre parcours santé commence ici';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get signIn => 'Se connecter';

  @override
  String get loginTitle => 'Connexion';

  @override
  String get loginSubtitle => 'Heureux de vous revoir';

  @override
  String get phoneLabel => 'Téléphone';

  @override
  String get passwordLabel => 'Mot de passe';

  @override
  String get confirmPasswordLabel => 'Confirmer le mot de passe';

  @override
  String get forgotPassword => 'Mot de passe oublié ?';

  @override
  String get registration => 'Inscription';

  @override
  String get verification => 'Vérification';

  @override
  String get ninTitle => 'Votre identité';

  @override
  String get ninSubtitle => 'Numéro d\'Identification National (18 chiffres)';

  @override
  String get ninHint => 'Visible sur votre carte d\'identité biométrique';

  @override
  String get phoneTitle => 'Votre numéro de téléphone';

  @override
  String get phoneSubtitle =>
      'Nous vous enverrons un code de vérification par SMS';

  @override
  String get phoneFormatHint => 'Format : +213 5XX, 6XX ou 7XX';

  @override
  String get sendCode => 'Envoyer le code';

  @override
  String get otpTitle => 'Entrez le code reçu';

  @override
  String otpSubtitle(String phone) {
    return 'Code à 6 chiffres envoyé au $phone';
  }

  @override
  String get resendCode => 'Renvoyer le code';

  @override
  String resendIn(String seconds) {
    return 'Renvoyer dans 0:$seconds';
  }

  @override
  String get verify => 'Vérifier';

  @override
  String get passwordTitle => 'Créez votre mot de passe';

  @override
  String get consentTitle => 'Vos consentements';

  @override
  String get consentSubtitle => 'Conformément à la loi algérienne ANPDP';

  @override
  String get consentHealth => 'Traitement de mes données de santé';

  @override
  String get consentData => 'Traitement de mes données personnelles';

  @override
  String get consentTerms => 'Conditions et politique ANPDP';

  @override
  String get consentMarketing => 'Communications marketing (optionnel)';

  @override
  String get acceptTerms =>
      'J\'accepte les CGU et la Politique de confidentialité';

  @override
  String get createMyAccount => 'Créer mon compte';

  @override
  String get biometricTitle => 'Connexion biométrique';

  @override
  String get biometricSubtitle =>
      'Face ID ou empreinte pour vous connecter plus vite';

  @override
  String get enable => 'Activer';

  @override
  String get later => 'Plus tard';

  @override
  String get successTitle => 'Bienvenue sur GPS Médical !';

  @override
  String get successSubtitle => 'Votre compte a été créé avec succès.';

  @override
  String get discoverApp => 'Découvrir l\'application';

  @override
  String get forgotTitle => 'Récupération du compte';

  @override
  String get resetTitle => 'Nouveau mot de passe';

  @override
  String get resetAction => 'Réinitialiser';

  @override
  String get invalidPhone => 'Numéro invalide (+213 5/6/7 + 8 chiffres)';

  @override
  String get invalidNin => 'NIN invalide (18 chiffres)';

  @override
  String get passwordsMismatch => 'Les mots de passe ne correspondent pas';

  @override
  String get requiredConsents =>
      'Veuillez accepter tous les consentements obligatoires';

  @override
  String get networkError => 'Erreur réseau. Réessayez.';
}
