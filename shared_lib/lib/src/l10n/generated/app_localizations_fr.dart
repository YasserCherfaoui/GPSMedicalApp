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
  String get ninVerificationPendingBanner =>
      'Votre identité est en cours de vérification. Vous pouvez continuer l\'inscription — aucune action n\'est requise de votre part.';

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
  String get bookingBack => 'Retour';

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
      'Une réservation en cours a été enregistrée. La connexion est nécessaire pour confirmer le créneau.';

  @override
  String get bookingOnlineRestored =>
      'Connexion rétablie — vous pouvez confirmer le rendez-vous';

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
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Veuillez patienter # secondes avant de réessayer.',
      one: 'Veuillez patienter # seconde avant de réessayer.',
    );
    return '$_temp0';
  }

  @override
  String get doctorTitleDefault => 'Dr.';

  @override
  String get doctorLanguageArabic => 'Arabe';

  @override
  String get doctorLanguageFrench => 'Français';

  @override
  String get doctorLanguageEnglish => 'Anglais';

  @override
  String get doctorLanguageTamazight => 'Tamazight';

  @override
  String get doctorCardBookCta => 'Prendre RDV';

  @override
  String get doctorCardTelehealth => 'Téléconsultation';

  @override
  String get doctorCardVerifiedBadge => 'Agréé';

  @override
  String doctorCardMatchPercent(int percent) {
    return '$percent% de compatibilité';
  }

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

  @override
  String get mapNearbyTitle => 'Médecins à proximité';

  @override
  String get mapNearbyLoadErrorTitle => 'Erreur de chargement';

  @override
  String get mapNearbyLoadErrorMessage =>
      'Une erreur s\'est produite sur la carte.';

  @override
  String get mapNearbyPermissionBanner =>
      'Autoriser la localisation pour voir les médecins autour de vous.';

  @override
  String get mapNearbyPermissionRationaleTitle => 'Accès à la localisation';

  @override
  String get mapNearbyPermissionRationaleBody =>
      'MedNavigator utilise votre position pour afficher les spécialistes à proximité. Vous pouvez aussi choisir une wilaya manuellement.';

  @override
  String get mapNearbyPermissionRationaleContinue => 'Continuer';

  @override
  String get mapNearbyPermissionRationaleCancel => 'Annuler';

  @override
  String get mapNearbyPermissionAllow => 'Autoriser';

  @override
  String get mapNearbyChooseWilaya => 'Choisir une wilaya';

  @override
  String get mapNearbyMyLocation => 'Ma position';

  @override
  String get mapNearbyEdit => 'Modifier';

  @override
  String get mapNearbyWilayaSearch => 'Recherche par wilaya';

  @override
  String mapNearbyWilayaSearchNamed(String wilaya) {
    return 'Recherche par wilaya ($wilaya)';
  }

  @override
  String mapNearbyLocationComma(String commune, String wilaya) {
    return '$commune, $wilaya';
  }

  @override
  String get mapNearbyRadiusLabel => 'Rayon :';

  @override
  String mapNearbyRadiusValue(String radius) {
    return '$radius km';
  }

  @override
  String mapNearbyClusterCount(int count) {
    return '$count médecins';
  }

  @override
  String get mapNearbyChooseWilayaTooltip => 'Choisir wilaya';

  @override
  String get mapNearbySpecialtyTitle => 'Sélectionner une spécialité';

  @override
  String get mapNearbySpecialtyClear => 'Effacer';

  @override
  String get profileTitle => 'Mon profil';

  @override
  String get profileEdit => 'Modifier';

  @override
  String get profileSave => 'Enregistrer';

  @override
  String get profileAccount => 'Compte';

  @override
  String get profileSignOut => 'Se déconnecter';

  @override
  String get profileFullName => 'Nom complet';

  @override
  String get profilePhone => 'Téléphone';

  @override
  String get profileEmail => 'E-mail';

  @override
  String get profileBirthDate => 'Date de naissance';

  @override
  String get profileGender => 'Genre';

  @override
  String get profileBloodType => 'Groupe sanguin';

  @override
  String get profileAddress => 'Adresse';

  @override
  String get profileAddressLine1 => 'Rue et numéro';

  @override
  String get profileAddressLine2 => 'Complément d\'adresse';

  @override
  String get profilePostalCode => 'Code postal';

  @override
  String get profileAllergies => 'Allergies';

  @override
  String get profileChronicConditions => 'Maladies chroniques';

  @override
  String get profileInsurance => 'Assurance';

  @override
  String get profileInsuranceProvider => 'Organisme';

  @override
  String get profileInsuranceNumber => 'Numéro d\'assuré';

  @override
  String get profileNotSet => 'Non renseigné';

  @override
  String get profileReadOnlyField => 'Non modifiable';

  @override
  String get profileGenderMale => 'Homme';

  @override
  String get profileGenderFemale => 'Femme';

  @override
  String get profileGenderOther => 'Autre';

  @override
  String get profileInsuranceCnas => 'CNAS';

  @override
  String get profileInsuranceCasnos => 'CASNOS';

  @override
  String get profileInsuranceNone => 'Aucune';

  @override
  String get profileInsurancePrivate => 'Privée';

  @override
  String get profilePickBirthDate => 'Choisir une date';

  @override
  String get profilePickAddress => 'Choisir wilaya et commune';

  @override
  String get profileTagHint => 'Saisir puis Entrée';

  @override
  String get profileAddTag => 'Ajouter';

  @override
  String get profileInvalidEmail => 'Adresse e-mail invalide';

  @override
  String get profileInvalidBirthDate =>
      'La date de naissance ne peut pas être dans le futur';

  @override
  String get profileLoadError => 'Impossible de charger le profil';

  @override
  String get profileSaveError => 'Enregistrement impossible';

  @override
  String get profileDeleteAccount => 'Supprimer mon compte';

  @override
  String get profileDeleteTitle => 'Supprimer votre compte ?';

  @override
  String get profileDeleteWarning =>
      'Cette action programme la suppression définitive de votre compte et de vos données personnelles.';

  @override
  String get profileDeleteGracePeriod =>
      'Vous disposez d\'un délai de 30 jours pour annuler la suppression en vous reconnectant.';

  @override
  String get profileDeleteConfirm => 'Oui, supprimer mon compte';

  @override
  String get profileDeleteFinalTitle => 'Confirmation finale';

  @override
  String get profileDeleteFinalMessage =>
      'Êtes-vous absolument certain ? Votre compte sera programmé pour suppression.';

  @override
  String get profileDeleteSuccess => 'Compte programmé pour suppression';

  @override
  String get profileDeleteError => 'Suppression impossible';

  @override
  String get profileConsents => 'Consentements ANPDP';

  @override
  String get consentManagementTitle => 'Mes consentements';

  @override
  String consentVersionLabel(String version) {
    return 'Version $version';
  }

  @override
  String consentGrantedAtLabel(String date) {
    return 'Accordé le $date';
  }

  @override
  String consentRevokedAtLabel(String date) {
    return 'Révoqué le $date';
  }

  @override
  String get consentActive => 'Actif';

  @override
  String get consentRevoked => 'Révoqué';

  @override
  String get consentRevokeEssential => 'Retirer mon consentement';

  @override
  String get consentRevokeEssentialTitle =>
      'Retirer un consentement essentiel ?';

  @override
  String get consentRevokeEssentialMessage =>
      'Le retrait d\'un consentement essentiel suspendra votre compte. Vous ne pourrez plus utiliser l\'application tant que le compte n\'est pas réactivé.';

  @override
  String get consentRevokeEssentialConfirm => 'Retirer et suspendre';

  @override
  String get consentRevokeError => 'Impossible de révoquer le consentement';

  @override
  String get consentRevokedLandingTitle => 'Compte suspendu';

  @override
  String get consentRevokedLandingMessage =>
      'Vous avez retiré un consentement essentiel. Votre compte est suspendu conformément à la réglementation ANPDP.';

  @override
  String get consentRevokedLandingAction => 'Retour à l\'accueil';

  @override
  String get dependentsTitle => 'Ayants droit';

  @override
  String get dependentsAdd => 'Ajouter un ayant droit';

  @override
  String get dependentsEdit => 'Modifier l\'ayant droit';

  @override
  String get dependentsEmpty => 'Aucun ayant droit enregistré';

  @override
  String get dependentsDeleteTitle => 'Supprimer cet ayant droit ?';

  @override
  String get dependentsDeleteMessage =>
      'Cette action est définitive. Les rendez-vous passés restent liés à cette personne.';

  @override
  String get dependentsDeleteConfirm => 'Supprimer';

  @override
  String get dependentFullName => 'Nom complet';

  @override
  String get dependentRelation => 'Lien de parenté';

  @override
  String get dependentBirthDate => 'Date de naissance';

  @override
  String get dependentGender => 'Genre';

  @override
  String get dependentRelationChild => 'Enfant';

  @override
  String get dependentRelationSpouse => 'Conjoint(e)';

  @override
  String get dependentRelationParent => 'Parent';

  @override
  String get dependentRelationOther => 'Autre';

  @override
  String dependentAgeYears(int age) {
    return '$age ans';
  }

  @override
  String get dependentSaveError => 'Enregistrement impossible';

  @override
  String get dependentDeleteError => 'Suppression impossible';

  @override
  String get medicalRecordsTitle => 'Dossier médical';

  @override
  String get medicalRecordsEmpty => 'Aucun document';

  @override
  String get medicalRecordsLoadError => 'Impossible de charger les documents';

  @override
  String get medicalRecordsFilterAll => 'Tous';

  @override
  String get medicalRecordTypePrescription => 'Ordonnance';

  @override
  String get medicalRecordTypeReport => 'Compte-rendu';

  @override
  String get medicalRecordTypeLabResult => 'Analyse';

  @override
  String get medicalRecordTypeImaging => 'Imagerie';

  @override
  String get medicalRecordTypeCertificate => 'Certificat';

  @override
  String get medicalRecordTypeOther => 'Autre';

  @override
  String get medicalRecordAuthorPatient => 'Patient';

  @override
  String get medicalRecordAuthorSpecialist => 'Médecin';

  @override
  String get medicalRecordAuthorConcierge => 'Concierge';

  @override
  String get medicalRecordViewerPlaceholder =>
      'L\'aperçu du document sera disponible prochainement.';

  @override
  String medicalRecordFileSizeBytes(int size) {
    return '$size o';
  }

  @override
  String medicalRecordFileSizeKb(String size) {
    return '$size Ko';
  }

  @override
  String medicalRecordFileSizeMb(String size) {
    return '$size Mo';
  }

  @override
  String get medicalRecordsUpload => 'Ajouter un document';

  @override
  String get medicalRecordsUploadAddCamera => 'Appareil photo';

  @override
  String get medicalRecordsUploadAddGallery => 'Galerie';

  @override
  String get medicalRecordsUploadAddFiles => 'Fichiers PDF';

  @override
  String get medicalRecordUploadType => 'Type de document';

  @override
  String get medicalRecordUploadTitle => 'Titre (optionnel)';

  @override
  String get medicalRecordUploadNotes => 'Notes (optionnel)';

  @override
  String get medicalRecordUploadPatient => 'Patient concerné';

  @override
  String get medicalRecordUploadSubmit => 'Téléverser';

  @override
  String medicalRecordUploadMaxFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Maximum # fichiers par envoi',
      one: 'Maximum # fichier par envoi',
    );
    return '$_temp0';
  }

  @override
  String get medicalRecordUploadFileTooLarge =>
      'Chaque fichier doit faire 20 Mo ou moins.';

  @override
  String get medicalRecordUploadInvalidMime =>
      'Formats acceptés : PDF, JPEG ou PNG uniquement.';

  @override
  String get medicalRecordUploadTypeRequired =>
      'Sélectionnez un type de document.';

  @override
  String get medicalRecordUploadNoFiles => 'Ajoutez au moins un fichier.';

  @override
  String get medicalRecordUploadStorageUnavailable =>
      'Le service de fichiers est temporairement indisponible. Réessayer plus tard.';

  @override
  String get medicalRecordUploadCancel => 'Annuler';

  @override
  String get medicalRecordUploadSuccess => 'Document ajouté';

  @override
  String get medicalRecordUploadFailed => 'Échec du téléversement';

  @override
  String get medicalRecordDownload => 'Télécharger';

  @override
  String get medicalRecordShare => 'Partager';

  @override
  String get medicalRecordDownloadSuccess =>
      'Fichier enregistré dans Téléchargements';

  @override
  String get medicalRecordViewerLoadError => 'Impossible d\'ouvrir le document';

  @override
  String get medicalRecordDeleteTitle => 'Supprimer ce document ?';

  @override
  String get medicalRecordDeleteMessage =>
      'Cette action est définitive. Le fichier sera retiré de votre dossier.';

  @override
  String get medicalRecordDeleteConfirm => 'Supprimer';

  @override
  String get medicalRecordDeleteError => 'Suppression impossible';

  @override
  String get messagingTitle => 'Messagerie';

  @override
  String get messagingEmpty => 'Aucune conversation pour le moment';

  @override
  String get messagingLoadError => 'Impossible de charger les conversations';

  @override
  String get messagingAttachmentPreview => 'Pièce jointe';

  @override
  String get messagingThreadPlaceholder =>
      'Conversation — détail disponible prochainement';

  @override
  String get messagingComposerHint => 'Écrire un message…';

  @override
  String get messagingSend => 'Envoyer';

  @override
  String get messagingAttach => 'Joindre un document';

  @override
  String get messagingPickAttachments => 'Choisir des documents';

  @override
  String get messagingAttachConfirm => 'Joindre la sélection';

  @override
  String get messagingMessagePending => 'Envoi…';

  @override
  String get messagingMessageSent => 'Envoyé';

  @override
  String get messagingMessageRead => 'Lu';

  @override
  String get messagingSendError => 'Échec de l\'envoi';

  @override
  String get messagingLoadMessagesError => 'Impossible de charger les messages';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get notificationsEmpty => 'Aucune notification';

  @override
  String get notificationsLoadError =>
      'Impossible de charger les notifications';

  @override
  String get notificationsMarkAllRead => 'Tout marquer lu';

  @override
  String get notificationsPreferences => 'Préférences';

  @override
  String get notificationsPreferencesTitle => 'Préférences de notification';

  @override
  String get notificationsPrefPush => 'Notifications push';

  @override
  String get notificationsPrefSms => 'SMS';

  @override
  String get notificationsPrefEmail => 'E-mail';

  @override
  String get notificationsPrefAppointmentReminders => 'Rappels de rendez-vous';

  @override
  String get notificationsPrefMarketing => 'Offres et actualités';

  @override
  String get notificationsPrefReminderHours => 'Rappel avant le rendez-vous';

  @override
  String notificationsPrefReminderHoursValue(int hours) {
    return '$hours h avant';
  }

  @override
  String get notificationsPrefSaveError => 'Enregistrement impossible';

  @override
  String get reviewCreateTitle => 'Laisser un avis';

  @override
  String get reviewRatingLabel => 'Note';

  @override
  String get reviewCommentLabel => 'Commentaire (optionnel)';

  @override
  String get reviewCommentHint => 'Partagez votre expérience…';

  @override
  String get reviewSubmit => 'Envoyer';

  @override
  String get reviewSubmitError => 'Impossible d\'envoyer l\'avis.';

  @override
  String get reviewRatingRequired => 'Veuillez sélectionner une note.';

  @override
  String reviewCommentTooLong(int max) {
    return 'Le commentaire ne doit pas dépasser $max caractères.';
  }

  @override
  String get reviewConfirmationTitle => 'Merci pour votre avis';

  @override
  String get reviewConfirmationBody =>
      'Votre avis est en attente de modération. Il sera publié après validation par notre équipe, généralement sous 48 heures.';

  @override
  String get reviewConfirmationStatusPending => 'En attente de modération';

  @override
  String get reviewAlreadySubmitted => 'Vous avez déjà laissé un avis';

  @override
  String get reviewDelete => 'Supprimer mon avis';

  @override
  String get reviewDeleteConfirm => 'Supprimer cet avis ?';

  @override
  String get reviewDeleteSuccess => 'Avis supprimé.';

  @override
  String get reviewDeleteError => 'Impossible de supprimer l\'avis.';

  @override
  String get reviewDeleteExpired =>
      'La suppression n\'est plus possible après 7 jours.';

  @override
  String get reviewAlreadyExistsError =>
      'Un avis existe déjà pour ce rendez-vous.';

  @override
  String get reviewNotEligibleError =>
      'Ce rendez-vous ne permet pas de publier un avis.';

  @override
  String get reviewBackToAppointment => 'Retour au rendez-vous';

  @override
  String reviewStarsLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count étoiles',
      one: '1 étoile',
    );
    return '$_temp0';
  }

  @override
  String get paymentDepositTitle => 'Payer l\'acompte';

  @override
  String paymentDepositBody(int amount) {
    return 'Un acompte de $amount DZD est requis pour confirmer ce rendez-vous.';
  }

  @override
  String get paymentDepositCta => 'Payer l\'acompte';

  @override
  String paymentDepositAmountLabel(int amount) {
    return '$amount DZD';
  }

  @override
  String get paymentDepositProviderStripeTest => 'Mode test (sandbox)';

  @override
  String get paymentDepositSandboxHint =>
      'Le paiement est simulé en environnement de test.';

  @override
  String get paymentDepositSuccess =>
      'Paiement réussi. Votre rendez-vous est à jour.';

  @override
  String get paymentDepositFailed => 'Le paiement a échoué.';

  @override
  String get paymentDepositNotEligible =>
      'Ce rendez-vous n\'est pas éligible au paiement.';

  @override
  String get specialistVerificationPendingTitle => 'Dossier en cours d\'examen';

  @override
  String get specialistVerificationPendingBody =>
      'Votre dossier est en cours de vérification par notre équipe. Vous recevrez une notification dès qu\'une décision sera prise.';

  @override
  String get specialistVerificationMoreInfoTitle =>
      'Informations complémentaires requises';

  @override
  String get specialistVerificationMoreInfoBody =>
      'Notre équipe a besoin de documents ou précisions supplémentaires avant de valider votre dossier.';

  @override
  String get specialistVerificationRejectedTitle => 'Dossier refusé';

  @override
  String get specialistVerificationRejectedBody =>
      'Votre dossier n\'a pas pu être validé. Consultez le message ci-dessous et soumettez de nouveaux justificatifs si nécessaire.';

  @override
  String get specialistVerificationSubmitCta => 'Soumettre mes justificatifs';

  @override
  String get specialistVerificationResubmitCta =>
      'Resoumettre mes justificatifs';

  @override
  String get specialistCredentialsTitle => 'Justificatifs professionnels';

  @override
  String get specialistCredentialsSubtitle =>
      'Indiquez votre numéro au Conseil de l\'Ordre et téléversez vos diplômes ou cartes (PDF, JPEG, PNG — 10 Mo max).';

  @override
  String get specialistCredentialsCouncilNumber => 'N° au Conseil de l\'Ordre';

  @override
  String get specialistCredentialsCouncilRequired =>
      'Le numéro au Conseil de l\'Ordre est obligatoire.';

  @override
  String get specialistCredentialsType => 'Type de justificatif';

  @override
  String get specialistCredentialsAddFile => 'Ajouter un fichier';

  @override
  String get specialistCredentialsNoFiles =>
      'Ajoutez au moins un justificatif.';

  @override
  String get specialistCredentialsSubmit => 'Soumettre pour vérification';

  @override
  String get specialistCredentialsExisting => 'Justificatifs déjà envoyés';

  @override
  String get specialistCredentialsSubmitSuccess =>
      'Justificatifs envoyés. Votre dossier est en cours d\'examen.';

  @override
  String get specialistCredentialsUploadFailed =>
      'Échec du téléversement. Réessayez.';

  @override
  String get specialistCredentialTypeDiploma => 'Diplôme';

  @override
  String get specialistCredentialTypeCouncilCard =>
      'Carte du Conseil de l\'Ordre';

  @override
  String get specialistCredentialTypeSpecialtyCert =>
      'Certificat de spécialité';

  @override
  String get specialistCredentialTypeOther => 'Autre';

  @override
  String get specialistCredentialStatusPending => 'En attente';

  @override
  String get specialistCredentialStatusApproved => 'Approuvé';

  @override
  String get specialistCredentialStatusRejected => 'Refusé';

  @override
  String get specialistTabInbox => 'Demandes';

  @override
  String get specialistTabCalendar => 'Agenda';

  @override
  String get specialistTabMessages => 'Messages';

  @override
  String get specialistTabProfile => 'Profil';

  @override
  String get specialistTabStats => 'Statistiques';

  @override
  String get specialistShellPlaceholder => 'Bientôt disponible';
}
