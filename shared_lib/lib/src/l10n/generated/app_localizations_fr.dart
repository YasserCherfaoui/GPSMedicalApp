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

  @override
  String get fullNameTitle => 'Votre nom complet';

  @override
  String get fullNameSubtitle =>
      'Tel qu\'indiqué sur vos documents officiels (2 à 120 caractères).';

  @override
  String get fullNameHint => 'Nom et prénom';

  @override
  String get invalidFullName => 'Nom invalide (2 à 120 caractères).';

  @override
  String get errorInvalidCredentials =>
      'Identifiants incorrects. Veuillez vérifier votre numéro de téléphone et votre mot de passe.';

  @override
  String get errorAccessDenied =>
      'Accès refusé. Vous n\'avez pas l\'autorisation d\'accéder à cette application.';

  @override
  String get errorTooManyRequests =>
      'Trop de tentatives. Veuillez réessayer dans quelques minutes.';

  @override
  String get errorInternalServer =>
      'Erreur interne du serveur. Veuillez réessayer plus tard.';

  @override
  String get errorNetworkTimeout =>
      'Connexion expirée. Veuillez vérifier votre connexion Internet et réessayer.';

  @override
  String get errorNetworkConnection =>
      'Impossible de se connecter au serveur. Veuillez vérifier votre connexion Internet.';

  @override
  String get errorPasswordRequired => 'Veuillez saisir votre mot de passe.';

  @override
  String get bookingAvailabilityTitle => 'Choisir un créneau';

  @override
  String get bookingPreviousWeek => 'Semaine précédente';

  @override
  String get bookingNextWeek => 'Semaine suivante';

  @override
  String bookingSlotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count créneaux',
      one: '1 créneau',
      zero: 'Aucun créneau',
    );
    return '$_temp0';
  }

  @override
  String get bookingReserve => 'Réserver';

  @override
  String bookingSlotDuration(int minutes) {
    return 'Durée : $minutes min';
  }

  @override
  String get bookingModeInPerson => 'En présentiel';

  @override
  String get bookingModeTelehealth => 'Téléconsultation';

  @override
  String get bookingModeAll => 'Tous';

  @override
  String bookingWeekRange(String from, String to) {
    return '$from – $to';
  }

  @override
  String get bookingSelectMode => 'Choisir le mode de consultation';

  @override
  String bookingLockExpires(String time) {
    return 'Créneau réservé — expire dans $time';
  }

  @override
  String get bookingLockExpired => 'Votre réservation de créneau a expiré.';

  @override
  String get bookingStepConfirm => 'Confirmer le créneau';

  @override
  String get bookingStepPatient => 'Pour qui ?';

  @override
  String get bookingStepReview => 'Récapitulatif';

  @override
  String get bookingForMe => 'Pour moi';

  @override
  String get bookingReasonHint => 'Motif de consultation (optionnel)';

  @override
  String get bookingSubmit => 'Confirmer le rendez-vous';

  @override
  String get bookingRescheduleSubmit => 'Reporter le rendez-vous';

  @override
  String get bookingSlotTakenTitle => 'Créneau indisponible';

  @override
  String get bookingSlotTakenMessage =>
      'Ce créneau vient d\'être pris. Choisir un autre créneau ?';

  @override
  String get bookingChooseAnotherSlot => 'Choisir un autre créneau';

  @override
  String get bookingOfflineBanner =>
      'Hors ligne — la réservation nécessite une connexion';

  @override
  String get bookingOfflineSubmit =>
      'Connexion requise pour confirmer le rendez-vous';

  @override
  String get bookingResumeDraftTitle => 'Reprendre votre réservation ?';

  @override
  String get bookingResumeDraftMessage =>
      'Une réservation en cours a été enregistrée.';

  @override
  String get bookingResume => 'Reprendre';

  @override
  String get bookingDiscard => 'Abandonner';

  @override
  String get appointmentsTitle => 'Rendez-vous';

  @override
  String get appointmentsUpcoming => 'À venir';

  @override
  String get appointmentsHistory => 'Historique';

  @override
  String get appointmentsEmptyUpcoming => 'Aucun rendez-vous à venir';

  @override
  String get appointmentsEmptyUpcomingCta => 'Trouver un spécialiste';

  @override
  String get appointmentsEmptyHistory => 'Aucun rendez-vous passé';

  @override
  String get appointmentDetailTitle => 'Détail du rendez-vous';

  @override
  String get appointmentCancel => 'Annuler';

  @override
  String get appointmentReschedule => 'Reporter';

  @override
  String get appointmentCancelReasonHint => 'Motif d\'annulation (optionnel)';

  @override
  String get appointmentConfirmCancel => 'Confirmer l\'annulation';

  @override
  String get appointmentDirections => 'Itinéraire';

  @override
  String get appointmentJoinTelehealth => 'Rejoindre';

  @override
  String get appointmentJoinTelehealthHint =>
      'La téléconsultation sera disponible dans une prochaine version.';

  @override
  String get appointmentLeaveReview => 'Laisser un avis';

  @override
  String get appointmentStatusPending => 'En attente';

  @override
  String get appointmentStatusConfirmed => 'Confirmé';

  @override
  String get appointmentStatusCancelled => 'Annulé';

  @override
  String get appointmentStatusCompleted => 'Terminé';

  @override
  String get appointmentStatusNoShow => 'Absent';

  @override
  String get appointmentPaymentUnpaid => 'Non payé';

  @override
  String get appointmentPaymentDeposit => 'Acompte versé';

  @override
  String get appointmentPaymentPaid => 'Payé';

  @override
  String get appointmentPaymentRefunded => 'Remboursé';

  @override
  String get bookingLoadError => 'Impossible de charger les créneaux.';

  @override
  String get appointmentsLoadError => 'Impossible de charger les rendez-vous.';

  @override
  String get appointmentDetailLoadError =>
      'Impossible de charger le rendez-vous.';

  @override
  String get bookingFeeLabel => 'Honoraires';

  @override
  String get bookingSummaryDoctor => 'Médecin';

  @override
  String get bookingSummarySlot => 'Créneau';

  @override
  String get bookingSummaryPatient => 'Patient';

  @override
  String get bookingSummaryReason => 'Motif';

  @override
  String get errorGenericTitle => 'Erreur';

  @override
  String get retry => 'Réessayer';

  @override
  String get specialtiesEmpty => 'Aucune spécialité trouvée.';

  @override
  String get specialtiesLoadError => 'Impossible de charger les spécialités.';

  @override
  String specialtiesPickerParentAll(String name) {
    return 'Toute la spécialité ($name)';
  }

  @override
  String get geoWilayaPickerTitle => 'Sélectionner la wilaya';

  @override
  String get geoCommunePickerTitle => 'Sélectionner la commune';

  @override
  String get geoClear => 'Effacer';

  @override
  String get geoSearchWilayaHint => 'Rechercher une wilaya…';

  @override
  String get geoSearchCommuneHint => 'Rechercher une commune…';

  @override
  String get geoWilayaEmpty => 'Aucune wilaya trouvée.';

  @override
  String get geoCommuneEmpty => 'Aucune commune trouvée.';

  @override
  String get geoWilayasLoadError => 'Impossible de charger les wilayas.';

  @override
  String get geoCommunesLoadError => 'Impossible de charger les communes.';

  @override
  String get geoUseWilayaCenter => 'Utiliser le centre de la wilaya';

  @override
  String get discoveryAppBarTitle => 'MedNavigator';

  @override
  String get discoveryRecommendedTitle => 'Spécialistes recommandés';

  @override
  String get discoveryViewList => 'Liste';

  @override
  String get discoveryViewMap => 'Carte';

  @override
  String get discoveryDoctorsEmptyTitle => 'Aucun médecin trouvé';

  @override
  String get discoveryDoctorsEmptyMessage =>
      'Aucun spécialiste ne correspond pour le moment.';

  @override
  String get discoverySearchAction => 'Rechercher';

  @override
  String get discoveryDoctorsLoadError =>
      'Impossible de charger la liste des spécialistes.';

  @override
  String get discoveryRateLimitTitle => 'Trop de requêtes';

  @override
  String discoveryRateLimitMessage(int seconds) {
    return 'Veuillez patienter $seconds seconde(s) avant de réessayer.';
  }

  @override
  String get doctorCardBookCta => 'Prendre RDV';

  @override
  String get doctorCardTelehealth => 'Téléconsultation';

  @override
  String get searchHint => 'Rechercher un médecin, spécialité…';

  @override
  String get searchEmptyTitle => 'Aucun médecin ne correspond';

  @override
  String get searchEmptyMessage => 'Élargir la zone ou modifier vos filtres ?';

  @override
  String get searchClearFilters => 'Effacer les filtres';

  @override
  String get searchLoadError =>
      'Une erreur s\'est produite lors de la recherche.';

  @override
  String get searchSuggestionsEmpty => 'Aucune suggestion.';

  @override
  String get searchSuggestionsLoadError =>
      'Erreur lors du chargement des suggestions.';

  @override
  String get searchSuggestionsSpecialties => 'Spécialités';

  @override
  String get searchSuggestionsDoctors => 'Médecins';

  @override
  String get searchSuggestionsLocations => 'Localisations';

  @override
  String get searchFiltersTitle => 'Filtres de recherche';

  @override
  String get searchFiltersReset => 'Réinitialiser';

  @override
  String get searchFiltersApply => 'Appliquer les filtres';

  @override
  String get searchFilterSpecialty => 'Spécialité';

  @override
  String get searchFilterSpecialtyAll => 'Toutes les spécialités';

  @override
  String get searchFilterLocation => 'Localisation (Wilaya / Commune)';

  @override
  String get searchFilterLocationAll => 'Toute l\'Algérie';

  @override
  String get searchFilterGender => 'Genre';

  @override
  String get searchFilterGenderAny => 'Tous';

  @override
  String get searchFilterGenderMale => 'Homme';

  @override
  String get searchFilterGenderFemale => 'Femme';

  @override
  String get searchFilterLanguages => 'Langues parlées';

  @override
  String get searchFilterMaxFee => 'Tarif maximum';

  @override
  String searchFilterMaxFeeValue(int fee) {
    return '$fee DZD';
  }

  @override
  String get searchFilterAvailability => 'Disponibilité';

  @override
  String get searchFilterAvailabilityAll => 'Toutes';

  @override
  String get searchFilterAvailabilityToday => 'Aujourd\'hui';

  @override
  String get searchFilterAvailability3Days => '3 jours';

  @override
  String get searchFilterAvailability1Week => '1 semaine';

  @override
  String get searchFilterAvailability1Month => '1 mois';

  @override
  String get searchFilterTelehealth => 'Téléconsultation disponible';

  @override
  String get searchFilterInsurance => 'Assurances acceptées';

  @override
  String get searchFilterInsuranceCnas => 'Conventionné CNAS';

  @override
  String get searchFilterInsuranceCasnos => 'Conventionné CASNOS';

  @override
  String get searchFilterSort => 'Trier par';

  @override
  String get searchFilterSortRelevance => 'Pertinence';

  @override
  String get searchFilterSortRating => 'Note la plus haute';

  @override
  String get searchFilterSortFeeAsc => 'Tarif croissant';

  @override
  String get searchFilterSortFeeDesc => 'Tarif décroissant';

  @override
  String get searchFilterSortDistance => 'Distance croissante';

  @override
  String get doctorDetailTitle => 'Profil du spécialiste';

  @override
  String get doctorDetailBioTitle => 'Biographie';

  @override
  String get doctorDetailBioEmpty => 'Aucune biographie disponible.';

  @override
  String get doctorDetailBioExpand => 'Lire la suite';

  @override
  String get doctorDetailBioCollapse => 'Voir moins';

  @override
  String get doctorDetailFeeTitle => 'Tarifs de consultation';

  @override
  String get doctorDetailFeeInPerson => 'Consultation en cabinet';

  @override
  String doctorDetailFeeValue(int fee) {
    return '$fee DZD';
  }

  @override
  String get doctorDetailLanguagesTitle => 'Langues parlées';

  @override
  String get doctorDetailLanguagesEmpty => 'Non renseigné';

  @override
  String get doctorDetailAddressTitle => 'Adresse de pratique';

  @override
  String get doctorDetailMapUnavailable => 'Carte indisponible';

  @override
  String get doctorDetailReviewsTitle => 'Avis des patients';

  @override
  String get doctorDetailReviewsEmpty => 'Aucun avis pour le moment.';

  @override
  String get doctorDetailReviewsLoadMore => 'Voir plus';

  @override
  String get doctorDetailVerifiedPatient => 'Patient vérifié';

  @override
  String get doctorDetailBookCta => 'Réserver';

  @override
  String get doctorDetailTelehealthCta => 'Téléconsultation';

  @override
  String get doctorDetailNotFoundTitle => 'Médecin introuvable';

  @override
  String get doctorDetailNotFoundMessage =>
      'Le profil de ce spécialiste n\'est pas disponible.';

  @override
  String get doctorDetailLoadError =>
      'Impossible de charger le profil de ce spécialiste.';
}
