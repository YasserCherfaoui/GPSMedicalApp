// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get splashSubtitle => 'From wandering to smart guidance';

  @override
  String get chooseLanguage => 'Scegli la tua lingua';

  @override
  String get continueLabel => 'Continua';

  @override
  String get skip => 'Salta';

  @override
  String get next => 'Avanti';

  @override
  String get start => 'Inizia';

  @override
  String get onboardingTitle1 => 'From wandering to smart guidance';

  @override
  String get onboardingTitle2 => 'How does it work?';

  @override
  String get onboardingTitle3 => 'Your data, protected in Algeria';

  @override
  String get onboardingBody1 =>
      'No more medical wandering. The right specialist, at the right time.';

  @override
  String get onboardingBody2 =>
      '4-step journey: location, screening, coaching, referral.';

  @override
  String get onboardingBody3 =>
      'Local ANPDP hosting, encryption, verified doctors.';

  @override
  String get welcomeTitle => 'Benvenuto';

  @override
  String get welcomeSubtitle => 'Your health journey starts here';

  @override
  String get createAccount => 'Crea un account';

  @override
  String get signIn => 'Accedi';

  @override
  String get loginTitle => 'Accedi';

  @override
  String get loginSubtitle => 'Good to see you again';

  @override
  String get phoneLabel => 'Telefono';

  @override
  String get passwordLabel => 'Password';

  @override
  String get confirmPasswordLabel => 'Conferma password';

  @override
  String get forgotPassword => 'Password dimenticata?';

  @override
  String get registration => 'Registration';

  @override
  String get verification => 'Verification';

  @override
  String get ninTitle => 'Your identity';

  @override
  String get ninSubtitle => 'National Identification Number (18 digits)';

  @override
  String get ninHint => 'Found on your biometric ID card';

  @override
  String get phoneTitle => 'Your phone number';

  @override
  String get phoneSubtitle => 'We will send you a verification code by SMS';

  @override
  String get phoneFormatHint => 'Format: +213 5XX, 6XX or 7XX';

  @override
  String get sendCode => 'Invia codice';

  @override
  String get otpTitle => 'Enter the code received';

  @override
  String otpSubtitle(String phone) {
    return '6-digit code sent to $phone';
  }

  @override
  String get ninVerificationPendingBanner =>
      'Your identity is being verified. You can continue registration — no action is required from you.';

  @override
  String get resendCode => 'Resend code';

  @override
  String resendIn(String seconds) {
    return 'Resend in 0:$seconds';
  }

  @override
  String get verify => 'Verifica';

  @override
  String get passwordTitle => 'Create your password';

  @override
  String get consentTitle => 'Your consents';

  @override
  String get consentSubtitle => 'In accordance with Algerian ANPDP law';

  @override
  String get consentHealth => 'Processing of my health data';

  @override
  String get consentData => 'Processing of my personal data';

  @override
  String get consentTerms => 'ANPDP terms and policy';

  @override
  String get consentMarketing => 'Marketing communications (optional)';

  @override
  String get acceptTerms => 'I accept the Terms of Use and Privacy Policy';

  @override
  String get createMyAccount => 'Create my account';

  @override
  String get biometricTitle => 'Biometric login';

  @override
  String get biometricSubtitle => 'Face ID or fingerprint to sign in faster';

  @override
  String get enable => 'Attiva';

  @override
  String get later => 'Più tardi';

  @override
  String get successTitle => 'Welcome to Medora!';

  @override
  String get successSubtitle => 'Your account has been created successfully.';

  @override
  String get discoverApp => 'Explore the app';

  @override
  String get forgotTitle => 'Account recovery';

  @override
  String get resetTitle => 'New password';

  @override
  String get resetAction => 'Reset';

  @override
  String get invalidPhone => 'Invalid number (+213 5/6/7 + 8 digits)';

  @override
  String get invalidNin => 'Invalid NIN (18 digits)';

  @override
  String get passwordsMismatch => 'Passwords do not match';

  @override
  String get requiredConsents => 'Please accept all required consents';

  @override
  String get networkError => 'Network error. Please try again.';

  @override
  String get fullNameTitle => 'Your full name';

  @override
  String get fullNameSubtitle =>
      'As shown on your official documents (2 to 120 characters).';

  @override
  String get fullNameHint => 'First and last name';

  @override
  String get invalidFullName => 'Invalid name (2 to 120 characters).';

  @override
  String get countryTitle => 'Your country';

  @override
  String get countrySubtitle =>
      'Choose your country of residence. This cannot be changed later.';

  @override
  String get countryImmutableNotice =>
      'The chosen country is final. It cannot be changed after account creation.';

  @override
  String get countryAlgeria => 'Algeria';

  @override
  String get countryTunisia => 'Tunisia';

  @override
  String get phoneCountryMismatch =>
      'This number does not match the chosen country.';

  @override
  String get countryNotSupportedForRole =>
      'Specialist registration is not yet available in Tunisia.';

  @override
  String get consentSubtitleTn =>
      'In accordance with Tunisian INPDP law (law 2004-63)';

  @override
  String get consentTermsTn => 'INPDP terms and policy';

  @override
  String consentLegalVersion(String version) {
    return 'Terms version: $version';
  }

  @override
  String get invalidPhoneTn => 'Invalid number (+216 2/4/5/9 + 7 digits)';

  @override
  String get phoneFormatHintTn => 'Format: +216 2X, 4X, 5X or 9X';

  @override
  String get errorInvalidCredentials =>
      'Invalid credentials. Please check your phone number and password.';

  @override
  String get errorAccessDenied =>
      'Access denied. You do not have permission to access this application.';

  @override
  String get errorTooManyRequests =>
      'Too many attempts. Please try again in a few minutes.';

  @override
  String get errorInternalServer =>
      'Internal server error. Please try again later.';

  @override
  String get errorNetworkTimeout =>
      'Connection timed out. Please check your internet connection and try again.';

  @override
  String get errorNetworkConnection =>
      'Unable to connect to the server. Please check your internet connection.';

  @override
  String get errorPasswordRequired => 'Please enter your password.';

  @override
  String get bookingAvailabilityTitle => 'Choose a slot';

  @override
  String get bookingPreviousWeek => 'Previous week';

  @override
  String get bookingNextWeek => 'Next week';

  @override
  String bookingSlotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slots',
      one: '1 slot',
      zero: 'No slots',
    );
    return '$_temp0';
  }

  @override
  String get bookingReserve => 'Prenota';

  @override
  String bookingSlotDuration(int minutes) {
    return 'Duration: $minutes min';
  }

  @override
  String get bookingModeInPerson => 'In-person';

  @override
  String get bookingModeTelehealth => 'Telehealth';

  @override
  String get bookingModeAll => 'All';

  @override
  String bookingWeekRange(String from, String to) {
    return '$from – $to';
  }

  @override
  String get bookingSelectMode => 'Select consultation mode';

  @override
  String bookingLockExpires(String time) {
    return 'Slot reserved — expires in $time';
  }

  @override
  String get bookingLockExpired => 'Your slot reservation has expired.';

  @override
  String get bookingBack => 'Indietro';

  @override
  String get bookingStepConfirm => 'Confirm slot';

  @override
  String get bookingStepPatient => 'For whom?';

  @override
  String get bookingStepReview => 'Summary';

  @override
  String get bookingForMe => 'For me';

  @override
  String get bookingReasonHint => 'Reason for visit (optional)';

  @override
  String get bookingSubmit => 'Conferma appuntamento';

  @override
  String get bookingRescheduleSubmit => 'Reschedule appointment';

  @override
  String get bookingSlotTakenTitle => 'Slot unavailable';

  @override
  String get bookingSlotTakenMessage =>
      'This slot was just taken. Choose another slot?';

  @override
  String get bookingChooseAnotherSlot => 'Choose another slot';

  @override
  String get bookingOfflineBanner => 'Offline — booking requires a connection';

  @override
  String get bookingOfflineSubmit =>
      'Connection required to confirm appointment';

  @override
  String get bookingResumeDraftTitle => 'Resume your booking?';

  @override
  String get bookingResumeDraftMessage =>
      'A booking in progress was saved. A connection is needed to confirm the slot.';

  @override
  String get bookingOnlineRestored =>
      'Connection restored — you can confirm the appointment';

  @override
  String get bookingResume => 'Resume';

  @override
  String get bookingDiscard => 'Discard';

  @override
  String get appointmentsTitle => 'Appuntamenti';

  @override
  String get appointmentsUpcoming => 'Prossimi';

  @override
  String get appointmentsHistory => 'Cronologia';

  @override
  String get appointmentsEmptyUpcoming => 'No upcoming appointments';

  @override
  String get appointmentsEmptyUpcomingCta => 'Find a specialist';

  @override
  String get appointmentsEmptyHistory => 'No past appointments';

  @override
  String get appointmentDetailTitle => 'Appointment detail';

  @override
  String get appointmentCancel => 'Annulla';

  @override
  String get appointmentReschedule => 'Riprogramma';

  @override
  String get appointmentCancelReasonHint => 'Cancellation reason (optional)';

  @override
  String get appointmentConfirmCancel => 'Confirm cancellation';

  @override
  String get appointmentDirections => 'Directions';

  @override
  String get appointmentJoinTelehealth => 'Join';

  @override
  String get appointmentJoinTelehealthHint =>
      'Available 15 minutes before the appointment.';

  @override
  String get appointmentLeaveReview => 'Leave a review';

  @override
  String get appointmentStatusPending => 'Pending';

  @override
  String get appointmentStatusConfirmed => 'Confirmed';

  @override
  String get appointmentStatusCancelled => 'Cancelled';

  @override
  String get appointmentStatusCompleted => 'Completed';

  @override
  String get appointmentStatusNoShow => 'No-show';

  @override
  String get appointmentPaymentUnpaid => 'Unpaid';

  @override
  String get appointmentPaymentDeposit => 'Deposit paid';

  @override
  String get appointmentPaymentPaid => 'Paid';

  @override
  String get appointmentPaymentRefunded => 'Refunded';

  @override
  String get bookingLoadError => 'Unable to load slots.';

  @override
  String get appointmentsLoadError => 'Unable to load appointments.';

  @override
  String get appointmentDetailLoadError => 'Unable to load appointment.';

  @override
  String get bookingFeeLabel => 'Fee';

  @override
  String get bookingSummaryDoctor => 'Doctor';

  @override
  String get bookingSummarySlot => 'Slot';

  @override
  String get bookingSummaryPatient => 'Patient';

  @override
  String get bookingSummaryReason => 'Reason';

  @override
  String get errorGenericTitle => 'Errore';

  @override
  String get retry => 'Riprova';

  @override
  String get specialtiesEmpty => 'No specialties found.';

  @override
  String get specialtiesLoadError => 'Unable to load specialties.';

  @override
  String specialtiesPickerParentAll(String name) {
    return 'All of specialty ($name)';
  }

  @override
  String get geoWilayaPickerTitle => 'Select wilaya';

  @override
  String get geoCommunePickerTitle => 'Select commune';

  @override
  String get geoClear => 'Clear';

  @override
  String get geoSearchWilayaHint => 'Search for a wilaya…';

  @override
  String get geoSearchCommuneHint => 'Search for a commune…';

  @override
  String get geoWilayaEmpty => 'No wilaya found.';

  @override
  String get geoCommuneEmpty => 'No commune found.';

  @override
  String get geoWilayasLoadError => 'Unable to load wilayas.';

  @override
  String get geoCommunesLoadError => 'Unable to load communes.';

  @override
  String get geoUseWilayaCenter => 'Use wilaya center';

  @override
  String get discoveryAppBarTitle => 'Medora';

  @override
  String get discoveryRecommendedTitle => 'Recommended specialists';

  @override
  String get discoveryViewList => 'List';

  @override
  String get discoveryViewMap => 'Map';

  @override
  String get discoveryDoctorsEmptyTitle => 'No doctors found';

  @override
  String get discoveryDoctorsEmptyMessage =>
      'No specialists match at the moment.';

  @override
  String get discoverySearchAction => 'Search';

  @override
  String get discoveryDoctorsLoadError => 'Unable to load specialists.';

  @override
  String get discoveryRateLimitTitle => 'Too many requests';

  @override
  String discoveryRateLimitMessage(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Please wait # seconds before retrying.',
      one: 'Please wait # second before retrying.',
    );
    return '$_temp0';
  }

  @override
  String get doctorTitleDefault => 'Dr.';

  @override
  String get doctorLanguageArabic => 'Arabic';

  @override
  String get doctorLanguageFrench => 'French';

  @override
  String get doctorLanguageEnglish => 'English';

  @override
  String get doctorLanguageTamazight => 'Tamazight';

  @override
  String get doctorCardBookCta => 'Book';

  @override
  String get doctorCardTelehealth => 'Telehealth';

  @override
  String get doctorCardVerifiedBadge => 'Certified';

  @override
  String doctorCardMatchPercent(int percent) {
    return '$percent% match';
  }

  @override
  String get searchHint => 'Cerca medico, specialità…';

  @override
  String get searchEmptyTitle => 'No matching doctors';

  @override
  String get searchEmptyMessage => 'Expand the area or change your filters?';

  @override
  String get searchClearFilters => 'Clear filters';

  @override
  String get searchLoadError => 'An error occurred during search.';

  @override
  String get searchSuggestionsEmpty => 'No suggestions.';

  @override
  String get searchSuggestionsLoadError => 'Error loading suggestions.';

  @override
  String get searchSuggestionsSpecialties => 'Specialties';

  @override
  String get searchSuggestionsDoctors => 'Doctors';

  @override
  String get searchSuggestionsLocations => 'Locations';

  @override
  String get searchFiltersTitle => 'Search filters';

  @override
  String get searchFiltersReset => 'Reset';

  @override
  String get searchFiltersApply => 'Apply filters';

  @override
  String get searchFilterSpecialty => 'Specialty';

  @override
  String get searchFilterSpecialtyAll => 'All specialties';

  @override
  String get searchFilterLocation => 'Location (Wilaya / Commune)';

  @override
  String get searchFilterLocationAll => 'All of Algeria';

  @override
  String get searchFilterGender => 'Gender';

  @override
  String get searchFilterGenderAny => 'Any';

  @override
  String get searchFilterGenderMale => 'Male';

  @override
  String get searchFilterGenderFemale => 'Female';

  @override
  String get searchFilterLanguages => 'Spoken languages';

  @override
  String get searchFilterMaxFee => 'Maximum fee';

  @override
  String searchFilterMaxFeeValue(int fee) {
    return '$fee DZD';
  }

  @override
  String get searchFilterAvailability => 'Availability';

  @override
  String get searchFilterAvailabilityAll => 'All';

  @override
  String get searchFilterAvailabilityToday => 'Today';

  @override
  String get searchFilterAvailability3Days => '3 days';

  @override
  String get searchFilterAvailability1Week => '1 week';

  @override
  String get searchFilterAvailability1Month => '1 month';

  @override
  String get searchFilterTelehealth => 'Telehealth available';

  @override
  String get searchFilterInsurance => 'Accepted insurance';

  @override
  String get searchFilterInsuranceCnas => 'CNAS approved';

  @override
  String get searchFilterInsuranceCasnos => 'CASNOS approved';

  @override
  String get searchFilterSort => 'Sort by';

  @override
  String get searchFilterSortRelevance => 'Relevance';

  @override
  String get searchFilterSortRating => 'Highest rating';

  @override
  String get searchFilterSortFeeAsc => 'Fee ascending';

  @override
  String get searchFilterSortFeeDesc => 'Fee descending';

  @override
  String get searchFilterSortDistance => 'Distance ascending';

  @override
  String get doctorDetailTitle => 'Specialist profile';

  @override
  String get doctorDetailBioTitle => 'Biography';

  @override
  String get doctorDetailBioEmpty => 'No biography available.';

  @override
  String get doctorDetailBioExpand => 'Read more';

  @override
  String get doctorDetailBioCollapse => 'Show less';

  @override
  String get doctorDetailFeeTitle => 'Consultation fees';

  @override
  String get doctorDetailFeeInPerson => 'In-office consultation';

  @override
  String doctorDetailFeeValue(int fee) {
    return '$fee DZD';
  }

  @override
  String get doctorDetailLanguagesTitle => 'Spoken languages';

  @override
  String get doctorDetailLanguagesEmpty => 'Not specified';

  @override
  String get doctorDetailAddressTitle => 'Practice address';

  @override
  String get doctorDetailMapUnavailable => 'Map unavailable';

  @override
  String get doctorDetailReviewsTitle => 'Patient reviews';

  @override
  String get doctorDetailReviewsEmpty => 'No reviews yet.';

  @override
  String get doctorDetailReviewsLoadMore => 'Load more';

  @override
  String get doctorDetailVerifiedPatient => 'Verified patient';

  @override
  String get doctorDetailBookCta => 'Prenota';

  @override
  String get doctorDetailTelehealthCta => 'Telehealth';

  @override
  String get doctorDetailNotFoundTitle => 'Doctor not found';

  @override
  String get doctorDetailNotFoundMessage =>
      'This specialist\'s profile is not available.';

  @override
  String get doctorDetailLoadError =>
      'Unable to load this specialist\'s profile.';

  @override
  String get mapNearbyTitle => 'Nearby doctors';

  @override
  String get mapNearbyClinicsTitle => 'Nearby clinics';

  @override
  String get mapNearbyLoadErrorTitle => 'Loading error';

  @override
  String get mapNearbyLoadErrorMessage => 'An error occurred on the map.';

  @override
  String get mapNearbyPermissionBanner =>
      'Allow location to see doctors near you.';

  @override
  String get mapNearbyClinicsPermissionBanner =>
      'Allow location to see clinics near you.';

  @override
  String get mapNearbyPermissionRationaleTitle => 'Location access';

  @override
  String get mapNearbyPermissionRationaleBody =>
      'Medora uses your location to show nearby specialists. You can also choose a wilaya manually.';

  @override
  String get mapNearbyClinicsPermissionRationaleBody =>
      'Medora uses your location to show nearby clinics. You can also choose a wilaya manually.';

  @override
  String get mapNearbyPermissionRationaleContinue => 'Continue';

  @override
  String get mapNearbyPermissionRationaleCancel => 'Cancel';

  @override
  String get mapNearbyPermissionAllow => 'Allow';

  @override
  String get mapNearbyChooseWilaya => 'Choose wilaya';

  @override
  String get mapNearbyMyLocation => 'My location';

  @override
  String get mapNearbyEdit => 'Edit';

  @override
  String get mapNearbyWilayaSearch => 'Search by wilaya';

  @override
  String mapNearbyWilayaSearchNamed(String wilaya) {
    return 'Search by wilaya ($wilaya)';
  }

  @override
  String mapNearbyLocationComma(String commune, String wilaya) {
    return '$commune, $wilaya';
  }

  @override
  String get mapNearbyRadiusLabel => 'Radius:';

  @override
  String mapNearbyRadiusValue(String radius) {
    return '$radius km';
  }

  @override
  String mapNearbyClusterCount(int count) {
    return '$count doctors';
  }

  @override
  String mapNearbyClinicClusterCount(int count) {
    return '$count clinics';
  }

  @override
  String get mapNearbyChooseWilayaTooltip => 'Choose wilaya';

  @override
  String get mapNearbySpecialtyTitle => 'Select a specialty';

  @override
  String get mapNearbySpecialtyClear => 'Clear';

  @override
  String get profileTitle => 'Il mio profilo';

  @override
  String get profileEdit => 'Modifica';

  @override
  String get profileSave => 'Salva';

  @override
  String get profileAccount => 'Account';

  @override
  String get profileSignOut => 'Disconnettiti';

  @override
  String get profileFullName => 'Full name';

  @override
  String get profilePhone => 'Phone';

  @override
  String get profileEmail => 'Email';

  @override
  String get profileBirthDate => 'Date of birth';

  @override
  String get profileGender => 'Gender';

  @override
  String get profileBloodType => 'Blood type';

  @override
  String get profileAddress => 'Address';

  @override
  String get profileAddressLine1 => 'Street and number';

  @override
  String get profileAddressLine2 => 'Additional address';

  @override
  String get profilePostalCode => 'Postal code';

  @override
  String get profileAllergies => 'Allergies';

  @override
  String get profileChronicConditions => 'Chronic conditions';

  @override
  String get profileInsurance => 'Insurance';

  @override
  String get profileInsuranceProvider => 'Provider';

  @override
  String get profileInsuranceNumber => 'Member number';

  @override
  String get profileNotSet => 'Not set';

  @override
  String get profileReadOnlyField => 'Not editable';

  @override
  String get profileGenderMale => 'Male';

  @override
  String get profileGenderFemale => 'Female';

  @override
  String get profileGenderOther => 'Other';

  @override
  String get profileInsuranceCnas => 'CNAS';

  @override
  String get profileInsuranceCasnos => 'CASNOS';

  @override
  String get profileInsuranceNone => 'None';

  @override
  String get profileInsurancePrivate => 'Private';

  @override
  String get profilePickBirthDate => 'Choose a date';

  @override
  String get profilePickAddress => 'Choose wilaya and commune';

  @override
  String get profileTagHint => 'Type then Enter';

  @override
  String get profileAddTag => 'Add';

  @override
  String get profileInvalidEmail => 'Invalid email address';

  @override
  String get profileInvalidBirthDate => 'Date of birth cannot be in the future';

  @override
  String get profileLoadError => 'Unable to load profile';

  @override
  String get profileSaveError => 'Unable to save';

  @override
  String get profileDeleteAccount => 'Delete my account';

  @override
  String get profileDeleteTitle => 'Delete your account?';

  @override
  String get profileDeleteWarning =>
      'This action schedules the permanent deletion of your account and personal data.';

  @override
  String get profileDeleteGracePeriod =>
      'You have 30 days to cancel the deletion by signing back in.';

  @override
  String get profileDeleteConfirm => 'Yes, delete my account';

  @override
  String get profileDeleteFinalTitle => 'Final confirmation';

  @override
  String get profileDeleteFinalMessage =>
      'Are you absolutely sure? Your account will be scheduled for deletion.';

  @override
  String get profileDeleteSuccess => 'Account scheduled for deletion';

  @override
  String get profileDeleteError => 'Unable to delete';

  @override
  String get deviceVaultBannerTitle => 'Data on this device only';

  @override
  String get deviceVaultBannerBody =>
      'Your date of birth, blood type, address, medical history and documents stay on this device. Uninstalling the app or losing the phone deletes them permanently.';

  @override
  String get deviceVaultBannerDismiss => 'Got it';

  @override
  String get deviceVaultSettingsTitle => 'On-device vault';

  @override
  String get deviceVaultSettingsBody =>
      'This data lives only on this device. Uninstalling the app or losing the phone deletes it. No backup is offered.';

  @override
  String get profileConsents => 'ANPDP consents';

  @override
  String get consentManagementTitle => 'My consents';

  @override
  String consentVersionLabel(String version) {
    return 'Version $version';
  }

  @override
  String consentGrantedAtLabel(String date) {
    return 'Granted on $date';
  }

  @override
  String consentRevokedAtLabel(String date) {
    return 'Revoked on $date';
  }

  @override
  String get consentActive => 'Active';

  @override
  String get consentRevoked => 'Revoked';

  @override
  String get consentRevokeEssential => 'Withdraw my consent';

  @override
  String get consentRevokeEssentialTitle => 'Withdraw an essential consent?';

  @override
  String get consentRevokeEssentialMessage =>
      'Withdrawing an essential consent will suspend your account. You will no longer be able to use the app until the account is reactivated.';

  @override
  String get consentRevokeEssentialConfirm => 'Withdraw and suspend';

  @override
  String get consentRevokeError => 'Unable to revoke consent';

  @override
  String get consentRevokedLandingTitle => 'Account suspended';

  @override
  String get consentRevokedLandingMessage =>
      'You have withdrawn an essential consent. Your account is suspended in accordance with ANPDP regulations.';

  @override
  String get consentRevokedLandingAction => 'Back to home';

  @override
  String get dependentsTitle => 'Dependents';

  @override
  String get dependentsAdd => 'Add a dependent';

  @override
  String get dependentsEdit => 'Edit dependent';

  @override
  String get dependentsEmpty => 'No dependents registered';

  @override
  String get dependentsDeleteTitle => 'Delete this dependent?';

  @override
  String get dependentsDeleteMessage =>
      'This action is permanent. Past appointments remain linked to this person.';

  @override
  String get dependentsDeleteConfirm => 'Delete';

  @override
  String get dependentFullName => 'Full name';

  @override
  String get dependentRelation => 'Relationship';

  @override
  String get dependentBirthDate => 'Date of birth';

  @override
  String get dependentGender => 'Gender';

  @override
  String get dependentRelationChild => 'Child';

  @override
  String get dependentRelationSpouse => 'Spouse';

  @override
  String get dependentRelationParent => 'Parent';

  @override
  String get dependentRelationOther => 'Other';

  @override
  String dependentAgeYears(int age) {
    return '$age years';
  }

  @override
  String get dependentSaveError => 'Unable to save';

  @override
  String get dependentDeleteError => 'Unable to delete';

  @override
  String get medicalRecordsTitle => 'Cartella clinica';

  @override
  String get medicalRecordsEmpty => 'No documents';

  @override
  String get medicalRecordsLoadError => 'Unable to load documents';

  @override
  String get medicalRecordsFilterAll => 'All';

  @override
  String get medicalRecordTypePrescription => 'Prescription';

  @override
  String get medicalRecordTypeReport => 'Report';

  @override
  String get medicalRecordTypeLabResult => 'Lab result';

  @override
  String get medicalRecordTypeImaging => 'Imaging';

  @override
  String get medicalRecordTypeCertificate => 'Certificate';

  @override
  String get medicalRecordTypeOther => 'Other';

  @override
  String get medicalRecordAuthorPatient => 'Patient';

  @override
  String get medicalRecordAuthorSpecialist => 'Doctor';

  @override
  String get medicalRecordAuthorConcierge => 'Concierge';

  @override
  String get medicalRecordViewerPlaceholder =>
      'Document preview will be available soon.';

  @override
  String medicalRecordFileSizeBytes(int size) {
    return '$size B';
  }

  @override
  String medicalRecordFileSizeKb(String size) {
    return '$size KB';
  }

  @override
  String medicalRecordFileSizeMb(String size) {
    return '$size MB';
  }

  @override
  String get medicalRecordsUpload => 'Add a document';

  @override
  String get medicalRecordsUploadAddCamera => 'Camera';

  @override
  String get medicalRecordsUploadAddGallery => 'Gallery';

  @override
  String get medicalRecordsUploadAddFiles => 'PDF files';

  @override
  String get medicalRecordsUploadForm => 'Full form';

  @override
  String get medicalRecordsOcrGalleryHint =>
      'Photo from gallery — OCR of key data';

  @override
  String get medicalRecordsOcrTitle => 'OCR extraction';

  @override
  String get medicalRecordsOcrHint =>
      'Reads exam type, date and key elements — no clinical interpretation.';

  @override
  String get medicalRecordsOcrStart => 'Start extraction';

  @override
  String get medicalRecordsOcrRetry => 'Retry extraction';

  @override
  String get medicalRecordsOcrStarted =>
      'Document saved — OCR extraction in progress.';

  @override
  String get medicalRecordUploadType => 'Document type';

  @override
  String get medicalRecordUploadTitle => 'Title (optional)';

  @override
  String get medicalRecordUploadNotes => 'Notes (optional)';

  @override
  String get medicalRecordUploadPatient => 'Concerned patient';

  @override
  String get medicalRecordUploadSubmit => 'Upload';

  @override
  String medicalRecordUploadMaxFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Maximum # files per upload',
      one: 'Maximum # file per upload',
    );
    return '$_temp0';
  }

  @override
  String get medicalRecordUploadFileTooLarge =>
      'Each file must be 20 MB or less.';

  @override
  String get medicalRecordUploadInvalidMime =>
      'Accepted formats: PDF, JPEG or PNG only.';

  @override
  String get medicalRecordUploadTypeRequired => 'Select a document type.';

  @override
  String get medicalRecordUploadNoFiles => 'Add at least one file.';

  @override
  String get medicalRecordUploadStorageUnavailable =>
      'File service is temporarily unavailable. Try again later.';

  @override
  String get medicalRecordUploadCancel => 'Cancel';

  @override
  String get medicalRecordUploadSuccess => 'Document added';

  @override
  String get medicalRecordUploadFailed => 'Upload failed';

  @override
  String get medicalRecordDownload => 'Download';

  @override
  String get medicalRecordShare => 'Share';

  @override
  String get medicalRecordDownloadSuccess => 'File saved to Downloads';

  @override
  String get medicalRecordViewerLoadError => 'Unable to open document';

  @override
  String get medicalRecordDeleteTitle => 'Delete this document?';

  @override
  String get medicalRecordDeleteMessage =>
      'This action is permanent. The file will be removed from your records.';

  @override
  String get medicalRecordDeleteConfirm => 'Delete';

  @override
  String get medicalRecordDeleteError => 'Unable to delete';

  @override
  String get messagingTitle => 'Messaggistica';

  @override
  String get messagingEmpty => 'No conversations yet';

  @override
  String get messagingLoadError => 'Unable to load conversations';

  @override
  String get messagingAttachmentPreview => 'Attachment';

  @override
  String get messagingThreadPlaceholder => 'Conversation — details coming soon';

  @override
  String get messagingComposerHint => 'Write a message…';

  @override
  String get messagingSend => 'Invia';

  @override
  String get messagingAttach => 'Attach a document';

  @override
  String get messagingPickAttachments => 'Choose documents';

  @override
  String get messagingAttachConfirm => 'Attach selection';

  @override
  String get messagingMessagePending => 'Sending…';

  @override
  String get messagingMessageSent => 'Sent';

  @override
  String get messagingMessageRead => 'Read';

  @override
  String get messagingSendError => 'Send failed';

  @override
  String get messagingLoadMessagesError => 'Unable to load messages';

  @override
  String get notificationsTitle => 'Notifiche';

  @override
  String get notificationsEmpty => 'No notifications';

  @override
  String get notificationsLoadError => 'Unable to load notifications';

  @override
  String get notificationsMarkAllRead => 'Mark all as read';

  @override
  String get notificationsPreferences => 'Preferences';

  @override
  String get notificationsPreferencesTitle => 'Notification preferences';

  @override
  String get notificationsPrefPush => 'Push notifications';

  @override
  String get notificationsPrefSms => 'SMS';

  @override
  String get notificationsPrefEmail => 'Email';

  @override
  String get notificationsPrefAppointmentReminders => 'Appointment reminders';

  @override
  String get notificationsPrefMarketing => 'Offers and news';

  @override
  String get notificationsPrefReminderHours => 'Reminder before appointment';

  @override
  String notificationsPrefReminderHoursValue(int hours) {
    return '$hours h before';
  }

  @override
  String get notificationsPrefSaveError => 'Unable to save';

  @override
  String get reviewCreateTitle => 'Leave a review';

  @override
  String get reviewRatingLabel => 'Rating';

  @override
  String get reviewCommentLabel => 'Comment (optional)';

  @override
  String get reviewCommentHint => 'Share your experience…';

  @override
  String get reviewSubmit => 'Submit';

  @override
  String get reviewSubmitError => 'Unable to submit review.';

  @override
  String get reviewRatingRequired => 'Please select a rating.';

  @override
  String reviewCommentTooLong(int max) {
    return 'Comment must not exceed $max characters.';
  }

  @override
  String get reviewConfirmationTitle => 'Thank you for your review';

  @override
  String get reviewConfirmationBody =>
      'Your review is pending moderation. It will be published after validation by our team, usually within 48 hours.';

  @override
  String get reviewConfirmationStatusPending => 'Pending moderation';

  @override
  String get reviewAlreadySubmitted => 'You have already left a review';

  @override
  String get reviewDelete => 'Delete my review';

  @override
  String get reviewDeleteConfirm => 'Delete this review?';

  @override
  String get reviewDeleteSuccess => 'Review deleted.';

  @override
  String get reviewDeleteError => 'Unable to delete review.';

  @override
  String get reviewDeleteExpired =>
      'Deletion is no longer possible after 7 days.';

  @override
  String get reviewAlreadyExistsError =>
      'A review already exists for this appointment.';

  @override
  String get reviewNotEligibleError =>
      'This appointment does not allow publishing a review.';

  @override
  String get reviewBackToAppointment => 'Back to appointment';

  @override
  String reviewStarsLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stars',
      one: '1 star',
    );
    return '$_temp0';
  }

  @override
  String get paymentDepositTitle => 'Pay deposit';

  @override
  String paymentDepositBody(int amount) {
    return 'A deposit of $amount DZD is required to confirm this appointment.';
  }

  @override
  String get paymentDepositCta => 'Pay deposit';

  @override
  String paymentDepositAmountLabel(int amount) {
    return '$amount DZD';
  }

  @override
  String get paymentDepositProviderStripeTest => 'Test mode (sandbox)';

  @override
  String get paymentDepositSandboxHint =>
      'Payment is simulated in a test environment.';

  @override
  String get paymentDepositSuccess =>
      'Payment successful. Your appointment is updated.';

  @override
  String get paymentDepositFailed => 'Payment failed.';

  @override
  String get paymentDepositNotEligible =>
      'This appointment is not eligible for payment.';

  @override
  String get paymentDepositPayeeClinicHint =>
      'Payment goes to the clinic (not the specialist).';

  @override
  String paymentDepositPayeeClinicNamed(String clinicName) {
    return 'Payment goes to $clinicName.';
  }

  @override
  String get paymentDepositPayeeClinicFallback => 'Clinic';

  @override
  String get specialistVerificationPendingTitle => 'File under review';

  @override
  String get specialistVerificationPendingBody =>
      'Your file is being reviewed by our team. You will receive a notification once a decision is made.';

  @override
  String get specialistVerificationMoreInfoTitle =>
      'Additional information required';

  @override
  String get specialistVerificationMoreInfoBody =>
      'Our team needs additional documents or clarifications before validating your file.';

  @override
  String get specialistVerificationRejectedTitle => 'File rejected';

  @override
  String get specialistVerificationRejectedBody =>
      'Your file could not be validated. Review the message below and submit new documents if necessary.';

  @override
  String get specialistVerificationSubmitCta => 'Submit my documents';

  @override
  String get specialistVerificationResubmitCta => 'Resubmit my documents';

  @override
  String get specialistVerificationCompleteProfileCta => 'Complete my profile';

  @override
  String get specialistVerificationRefreshCta => 'Refresh status';

  @override
  String get specialistVerificationRefreshLoading => 'Verifying…';

  @override
  String get specialistVerificationRefreshCompleted => 'Verification complete';

  @override
  String get specialistVerificationRefreshFailed =>
      'Verification failed. Try again.';

  @override
  String specialistVerificationLastChecked(String timestamp) {
    return 'Last checked: $timestamp';
  }

  @override
  String get specialistProfileEditTitle => 'Edit my profile';

  @override
  String get specialistProfileSaveChanges => 'Save changes';

  @override
  String get specialistProfileSectionInfo => 'Information';

  @override
  String get specialistProfileSectionSpecialties => 'Specialties';

  @override
  String get specialistProfileSectionLanguages => 'Spoken languages';

  @override
  String get specialistProfileSectionConsultation => 'Consultation';

  @override
  String get specialistProfileSectionPractice => 'Practice location';

  @override
  String get specialistProfileTitle => 'Title';

  @override
  String get specialistProfileBio => 'Biography';

  @override
  String get specialistProfilePhotoUrl => 'Photo URL';

  @override
  String get specialistProfileSelectSpecialty => 'Main specialty';

  @override
  String get specialistProfileFee => 'Consultation fee (DZD)';

  @override
  String get specialistProfileCnas => 'CNAS approved';

  @override
  String get specialistProfileCasnos => 'CASNOS approved';

  @override
  String get specialistProfileTelehealth => 'Telehealth available';

  @override
  String get specialistProfileConfirmationPolicy => 'Confirmation policy';

  @override
  String get specialistProfilePolicyManual => 'Manual';

  @override
  String get specialistProfilePolicyAuto => 'Automatic';

  @override
  String get specialistProfileBookingWindow => 'Booking window (days)';

  @override
  String get specialistProfileAddressLine1 => 'Address';

  @override
  String get specialistProfileAddressLine2 => 'Additional address';

  @override
  String get specialistProfileVerifiedBadge => 'Verified account';

  @override
  String get specialistProfileUnverifiedBadge => 'Not verified';

  @override
  String get specialistCredentialsTitle => 'Professional credentials';

  @override
  String get specialistCredentialsSubtitle =>
      'Enter your Medical Council number and upload your diplomas or cards (PDF, JPEG, PNG — 10 MB max).';

  @override
  String get specialistCredentialsCouncilNumber => 'Medical Council number';

  @override
  String get specialistCredentialsCouncilRequired =>
      'Medical Council number is required.';

  @override
  String get specialistCredentialsType => 'Credential type';

  @override
  String get specialistCredentialsAddFile => 'Add a file';

  @override
  String get specialistCredentialsNoFiles => 'Add at least one credential.';

  @override
  String get specialistCredentialsSubmit => 'Submit for verification';

  @override
  String get specialistCredentialsExisting => 'Already submitted credentials';

  @override
  String get specialistCredentialsSubmitSuccess =>
      'Credentials submitted. Your file is under review.';

  @override
  String get specialistCredentialsUploadFailed => 'Upload failed. Try again.';

  @override
  String get specialistCredentialTypeDiploma => 'Diploma';

  @override
  String get specialistCredentialTypeCouncilCard => 'Medical Council card';

  @override
  String get specialistCredentialTypeSpecialtyCert => 'Specialty certificate';

  @override
  String get specialistCredentialTypeOther => 'Other';

  @override
  String get specialistCredentialStatusPending => 'Pending';

  @override
  String get specialistCredentialStatusApproved => 'Approved';

  @override
  String get specialistCredentialStatusRejected => 'Rejected';

  @override
  String get specialistTabInbox => 'Requests';

  @override
  String get specialistTabCalendar => 'Calendar';

  @override
  String get specialistTabMessages => 'Messages';

  @override
  String get specialistTabProfile => 'Profile';

  @override
  String get specialistTabStats => 'Statistics';

  @override
  String get specialistShellPlaceholder => 'Coming soon';

  @override
  String get specialistScheduleTitle => 'My schedule';

  @override
  String get specialistScheduleTabTemplates => 'Hours';

  @override
  String get specialistScheduleTabExceptions => 'Exceptions';

  @override
  String get specialistScheduleTabPreview => 'Preview';

  @override
  String get specialistScheduleAddWindow => 'Add a window';

  @override
  String get specialistScheduleEditWindow => 'Edit window';

  @override
  String get specialistScheduleSaveWindow => 'Save window';

  @override
  String get specialistScheduleSaveSuccess => 'Schedule saved.';

  @override
  String get specialistScheduleStartTime => 'Start time';

  @override
  String get specialistScheduleEndTime => 'End time';

  @override
  String get specialistScheduleSlotDuration => 'Slot duration';

  @override
  String specialistScheduleSlotMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get specialistScheduleMode => 'Consultation mode';

  @override
  String get specialistScheduleModeInPerson => 'In-person';

  @override
  String get specialistScheduleModeTelehealth => 'Telehealth';

  @override
  String get specialistScheduleModeBoth => 'Both';

  @override
  String get specialistScheduleActive => 'Active window';

  @override
  String get specialistScheduleActiveHint =>
      'Disabling removes the window when saved.';

  @override
  String get specialistScheduleInactive => 'Inactive';

  @override
  String get specialistScheduleNoWindowsTitle => 'No windows';

  @override
  String get specialistScheduleNoWindowsBody =>
      'Add your consultation hours for this day.';

  @override
  String get specialistScheduleDeleteWindowTitle => 'Delete this window?';

  @override
  String get specialistScheduleDeleteWindowBody =>
      'Slots generated from this window will no longer be available.';

  @override
  String get specialistScheduleAddException => 'Add an exception';

  @override
  String get specialistScheduleExceptionDates => 'Period';

  @override
  String get specialistSchedulePickDates => 'Choose';

  @override
  String get specialistScheduleExceptionKind => 'Type';

  @override
  String get specialistScheduleExceptionVacation => 'Vacation';

  @override
  String get specialistScheduleExceptionSick => 'Sick leave';

  @override
  String get specialistScheduleExceptionBlocked => 'Unavailable';

  @override
  String get specialistScheduleExceptionExtra => 'Exception';

  @override
  String get specialistScheduleExceptionNote => 'Note (optional)';

  @override
  String get specialistScheduleExceptionSaved => 'Exception saved.';

  @override
  String specialistScheduleExceptionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count exceptions',
      one: '1 exception',
    );
    return '$_temp0';
  }

  @override
  String get specialistScheduleNoExceptionsTitle => 'No exceptions';

  @override
  String get specialistScheduleNoExceptionsBody =>
      'Block days for vacation, sick leave or unavailability.';

  @override
  String get specialistSchedulePreviewEmptyTitle => 'No slots';

  @override
  String get specialistSchedulePreviewEmptyBody =>
      'Save your time windows then come back here to check the generated slots.';

  @override
  String get specialistScheduleLoadError => 'Unable to load schedule.';

  @override
  String get specialistScheduleErrorWeekday => 'Invalid weekday.';

  @override
  String get specialistScheduleErrorSlotDuration =>
      'Invalid slot duration or interval.';

  @override
  String get specialistScheduleErrorMode => 'Invalid consultation mode.';

  @override
  String get specialistScheduleErrorStartTime => 'Invalid start time.';

  @override
  String get specialistScheduleErrorEndTime => 'Invalid end time.';

  @override
  String get specialistScheduleErrorStartDate => 'Invalid start date.';

  @override
  String get specialistScheduleErrorEndDate => 'Invalid end date.';

  @override
  String get specialistScheduleErrorKind => 'Invalid exception type.';

  @override
  String get specialistScheduleErrorNote =>
      'Note must not exceed 200 characters.';

  @override
  String get specialistScheduleLocation => 'Assignment';

  @override
  String get specialistScheduleLocationHint =>
      'Personal (office) or slots given to a clinic.';

  @override
  String get specialistScheduleLocationCabinet => 'My office';

  @override
  String get specialistScheduleLocationClinicFallback => 'Clinic';

  @override
  String get specialistScheduleDonationPersonal => 'Personal (my office)';

  @override
  String specialistScheduleDonationClinicNamed(String clinicName) {
    return 'Given to $clinicName';
  }

  @override
  String get specialistScheduleDonationNotice =>
      'The clinic is notified of any changes to your donated slots.';

  @override
  String get specialistScheduleDonationNoticeTitle =>
      'Slots donated to a clinic';

  @override
  String get specialistScheduleDonationNoticeGotIt => 'Got it';

  @override
  String get specialistScheduleDonationFilterClear => 'All slots';

  @override
  String specialistScheduleDonationFilterBanner(String clinicName) {
    return 'Showing slots donated to $clinicName';
  }

  @override
  String get specialistScheduleConflictMessage =>
      'This slot overlaps an existing appointment (office or clinic).';

  @override
  String get specialistClinicSessionBadge => 'Clinic session';

  @override
  String clinicMembershipsDonatedHours(String hours) {
    return '$hours h / week donated';
  }

  @override
  String get clinicMembershipsDonatedHoursNone => 'No donated slots';

  @override
  String get clinicMembershipsManageDonated => 'Manage donated slots';

  @override
  String get specialistProfileManageSchedule => 'Manage my schedule';

  @override
  String get specialistInboxTabRequests => 'Requests';

  @override
  String get specialistInboxTabConfirmed => 'Confirmed';

  @override
  String get specialistInboxTabHistory => 'History';

  @override
  String get specialistInboxEmptyRequests => 'No pending requests';

  @override
  String get specialistInboxEmptyConfirmed => 'No confirmed appointments';

  @override
  String get specialistInboxEmptyHistory => 'No past appointments';

  @override
  String get specialistAppointmentDetailTitle => 'Appointment detail';

  @override
  String get specialistAppointmentPatientAnonymous =>
      'Patient (identity hidden)';

  @override
  String get specialistAppointmentPatientLabel => 'Patient';

  @override
  String specialistAppointmentPatientRef(String ref) {
    return 'Patient ····$ref';
  }

  @override
  String get specialistAppointmentConfirmed => 'Appointment confirmed';

  @override
  String get specialistAppointmentCancelTitle => 'Cancel appointment';

  @override
  String get specialistAppointmentStartTelehealth => 'Start telehealth';

  @override
  String get specialistTelehealthComingSoon =>
      'Telehealth will be available soon.';

  @override
  String get specialistAppointmentViewRecords => 'View medical records';

  @override
  String get specialistAppointmentIssuePrescription => 'Issue prescription';

  @override
  String get specialistAppointmentConfirm => 'Confirm appointment';

  @override
  String get specialistAppointmentMarkNoShow => 'Mark as no-show';

  @override
  String get specialistCalendarMonthView => 'Month';

  @override
  String get specialistCalendarWeekView => 'Week';

  @override
  String get specialistCalendarDayAppointments => 'Today\'s appointments';

  @override
  String get specialistCalendarEmptyDay => 'No appointments today';

  @override
  String get specialistCalendarLoadError => 'Unable to load schedule.';

  @override
  String get specialistPatientRecordsTitle => 'Patient records';

  @override
  String get specialistPatientRecordsEmpty => 'No shared documents';

  @override
  String get specialistPatientRecordsForbidden =>
      'No documents shared with you for this patient';

  @override
  String get specialistPatientRecordsLoadError => 'Unable to load records.';

  @override
  String get specialistPrescriptionTitle => 'Prescription';

  @override
  String get specialistPrescriptionDiagnosis => 'Diagnosis';

  @override
  String get specialistPrescriptionValidUntil => 'Valid until';

  @override
  String get specialistPrescriptionDrugsSection => 'Medications';

  @override
  String specialistPrescriptionDrugNumber(int number) {
    return 'Medication $number';
  }

  @override
  String get specialistPrescriptionAddDrug => 'Add medication';

  @override
  String get specialistPrescriptionDrugName => 'Medication name';

  @override
  String get specialistPrescriptionDosage => 'Dosage';

  @override
  String get specialistPrescriptionFrequency => 'Frequency';

  @override
  String get specialistPrescriptionDurationDays => 'Duration (days)';

  @override
  String get specialistPrescriptionInstructions => 'Instructions';

  @override
  String get specialistPrescriptionSubmit => 'Issue prescription';

  @override
  String get specialistPrescriptionSuccess =>
      'Prescription issued successfully';

  @override
  String get specialistPrescriptionAtLeastOneDrug =>
      'Add at least one medication';

  @override
  String get specialistTeleconsultTitle => 'Teleconsultation';

  @override
  String get specialistTeleconsultWindowClosed =>
      'The session is not yet open.';

  @override
  String specialistTeleconsultOpensIn(String time) {
    return 'Opens in $time';
  }

  @override
  String get specialistTeleconsultWaitingPatient => 'Waiting for patient…';

  @override
  String get specialistTeleconsultConnectionError =>
      'Unable to start teleconsultation.';

  @override
  String get patientTeleconsultTitle => 'Teleconsultation';

  @override
  String get patientTeleconsultWindowClosed => 'The session is not yet open.';

  @override
  String patientTeleconsultOpensIn(String time) {
    return 'Opens in $time';
  }

  @override
  String get patientTeleconsultWaitingDoctor => 'Waiting for doctor…';

  @override
  String get patientTeleconsultConnectionError =>
      'Unable to start teleconsultation.';

  @override
  String get teleconsultMicOn => 'Microphone on';

  @override
  String get teleconsultMicOff => 'Microphone off';

  @override
  String get teleconsultCameraOn => 'Camera on';

  @override
  String get teleconsultCameraOff => 'Camera off';

  @override
  String get teleconsultHangupTitle => 'End call?';

  @override
  String get teleconsultHangupMessage =>
      'The other participant will be disconnected.';

  @override
  String get teleconsultHangupConfirm => 'Hang up';

  @override
  String get teleconsultHangupStay => 'Stay in call';

  @override
  String get specialistStatsRatingTitle => 'Average rating';

  @override
  String get specialistStatsAppointments => 'Appointments';

  @override
  String get specialistStatsCompleted => 'Completed';

  @override
  String get specialistStatsRevenue => 'Revenue';

  @override
  String get specialistStatsNoShowRate => 'No-show rate';

  @override
  String get specialistStatsTrendTitle => 'Trend';

  @override
  String get specialistStatsMetricAppointments => 'Appts';

  @override
  String get specialistStatsMetricRevenue => 'Revenue';

  @override
  String get specialistStatsMetricNoShow => 'No-shows';

  @override
  String get specialistStatsMetricNewPatients => 'New patients';

  @override
  String get specialistStatsGranularityDay => 'Day';

  @override
  String get specialistStatsGranularityWeek => 'Week';

  @override
  String get specialistStatsGranularityMonth => 'Month';

  @override
  String get specialistStatsLoadError => 'Unable to load statistics.';

  @override
  String get specialistStatsChartEmpty =>
      'Not enough data to display the chart.';

  @override
  String get specialistStatsReviewsTitle => 'My reviews';

  @override
  String get specialistStatsReviewsEmpty => 'No published reviews';

  @override
  String get specialistStatsReviewsLoadError => 'Unable to load reviews.';

  @override
  String get searchEntityDoctors => 'Doctors';

  @override
  String get searchEntityClinics => 'Clinics';

  @override
  String get searchHintClinics => 'Search for a clinic…';

  @override
  String get searchEmptyClinicsTitle => 'No matching clinics';

  @override
  String get searchEmptyClinicsMessage =>
      'Expand the area or change your filters?';

  @override
  String get searchSuggestionsClinics => 'Clinics';

  @override
  String get clinicCardBookCta => 'View clinic';

  @override
  String get clinicCardTelehealth => 'Telehealth';

  @override
  String clinicCardFromPrice(int price, String currency) {
    return 'From $price $currency';
  }

  @override
  String get clinicDetailTitle => 'Clinic';

  @override
  String get clinicDetailAboutTitle => 'About';

  @override
  String get clinicDetailAboutEmpty => 'No description available.';

  @override
  String get clinicDetailServicesTitle => 'Services';

  @override
  String get clinicDetailServicesEmpty => 'No services published yet.';

  @override
  String get clinicDetailSpecialistsTitle => 'Practitioners';

  @override
  String get clinicDetailSpecialistsEmpty =>
      'No practitioners visible on this profile.';

  @override
  String get clinicDetailReviewsTitle => 'Reviews';

  @override
  String get clinicDetailReviewsEmpty => 'No public reviews yet.';

  @override
  String get clinicDetailLoadError => 'Unable to load clinic.';

  @override
  String get clinicDetailNotFoundTitle => 'Clinic not found';

  @override
  String get clinicDetailNotFoundMessage => 'This clinic is not available.';

  @override
  String get clinicDetailMapUnavailable => 'Map unavailable';

  @override
  String get clinicDetailAssignNotice =>
      'You are booking a service; the clinic assigns the practitioner.';

  @override
  String clinicDetailDurationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String clinicDetailServicePrice(int price, String currency) {
    return '$price $currency';
  }

  @override
  String get clinicDetailVerifiedPatient => 'Verified patient';

  @override
  String get clinicDetailLoadMoreReviews => 'Load more reviews';

  @override
  String get clinicDetailVerifiedBadge => 'Verified clinic';

  @override
  String get discoveryClinicsEmptyTitle => 'No clinics found';

  @override
  String get discoveryClinicsEmptyMessage =>
      'No verified clinics are available at the moment.';

  @override
  String get clinicBookingCta => 'Book';

  @override
  String get clinicBookingSummaryClinic => 'Clinic';

  @override
  String get clinicBookingSummaryService => 'Service';

  @override
  String get clinicMembershipsTitle => 'Clinic affiliations';

  @override
  String get clinicMembershipsEmpty =>
      'No invitations or affiliations at the moment.';

  @override
  String get clinicMembershipsInvitations => 'Invitations';

  @override
  String get clinicMembershipsActive => 'Active affiliations';

  @override
  String get clinicMembershipsAccept => 'Accept';

  @override
  String get clinicMembershipsRefuse => 'Decline';

  @override
  String get clinicMembershipsDetach => 'Request detachment';

  @override
  String get clinicMembershipsDetachPending => 'Detachment pending approval';

  @override
  String get clinicMembershipsVisibleOnProfile =>
      'Visible on my public profile';

  @override
  String get clinicMembershipsLoadError => 'Unable to load affiliations.';

  @override
  String get clinicMembershipsActionError => 'Action failed. Try again.';

  @override
  String get appointmentDetailClinicBooking => 'Clinic booking';

  @override
  String get appointmentDetailClinicService => 'Service';

  @override
  String get appointmentDetailAwaitingSpecialist =>
      'Awaiting practitioner assignment by the clinic.';

  @override
  String get appointmentDetailAssignedSpecialist => 'Assigned practitioner';

  @override
  String get appointmentReviewSession => 'Consultation review';

  @override
  String get appointmentReviewClinicProfile => 'Clinic review';

  @override
  String get reviewClinicProfileCreateTitle => 'Clinic review';

  @override
  String get reviewClinicAlreadySubmitted =>
      'You have already left a review for this clinic.';

  @override
  String get painLocalizationTitle => 'Where does it hurt?';

  @override
  String painLocalizationDownloadProgress(int percent) {
    return 'Downloading model ($percent%)';
  }

  @override
  String get painLocalizationOfflineTitle => 'Model unavailable offline';

  @override
  String get painLocalizationOfflineMessage =>
      'Connect to download the 3D model (about 12 MB). Then the tool will work without network.';

  @override
  String get painLocalizationRetry => 'Retry';

  @override
  String get painLocalizationWebGlTitle => '3D visualisation unavailable';

  @override
  String get painLocalizationWebGlMessage =>
      'This device cannot display the 3D model. The feature is hidden here.';

  @override
  String get painLocalizationErrorTitle => 'Unable to load model';

  @override
  String get painLocalizationErrorMessage => 'Download failed. Try again.';

  @override
  String get painLocalizationCardSubtitle =>
      'Locate the area on a 3D model. Exploratory tool: nothing is sent to a doctor.';

  @override
  String get painLocalizationChooserTitle => 'Which model to display?';

  @override
  String get painLocalizationChooserDisclaimer =>
      'The body choice is yours; it is not inferred from your profile. This tool is exploratory: the selection stays on the device and is not sent to a doctor.';

  @override
  String get painLocalizationChooserMale => 'Male';

  @override
  String get painLocalizationChooserFemale => 'Female';

  @override
  String get painLocalizationSwitchBody => 'Switch model';

  @override
  String get painLocalizationConfirm => 'Confirm';

  @override
  String get painLocalizationCancel => 'Cancel';

  @override
  String get painLocalizationClearAll => 'Clear all';

  @override
  String get painLocalizationClearAllTitle => 'Clear selections?';

  @override
  String get painLocalizationClearAllMessage =>
      'All indicated areas will be removed from this device.';

  @override
  String get painLocalizationEmpty =>
      'Tap the model to explore an area, then add it if needed. Nothing is sent to a doctor.';

  @override
  String get painLocalizationAddSelection => 'Add this area';

  @override
  String get painLocalizationSelectionAlreadyAdded =>
      'This area is already in your list';

  @override
  String get painLocalizationRemoveChip => 'Remove';

  @override
  String get painLocalizationConfirmedSnackbar =>
      'Selections saved on this device.';

  @override
  String get anamnesisTitle => 'Questionnaire';

  @override
  String get anamnesisLoading => 'Loading questionnaire…';

  @override
  String get anamnesisError => 'Unable to load questionnaire.';

  @override
  String get anamnesisRetry => 'Retry';

  @override
  String get anamnesisContinue => 'Continue';

  @override
  String get anamnesisDone => 'Done';

  @override
  String get anamnesisCompleteTitle => 'Questionnaire complete';

  @override
  String get anamnesisCompleteMessage => 'Your answers have been saved.';

  @override
  String get anamnesisOfflineQueued =>
      'Answer saved locally — will sync when reconnected.';

  @override
  String get anamnesisDisclaimer =>
      'Helps with orientation — not a medical diagnosis.';

  @override
  String get anamnesisUnsupportedQuestion => 'Unsupported question type.';

  @override
  String get anamnesisDurationValue => 'Duration';

  @override
  String anamnesisProgressOpen(int answered) {
    return '$answered question(s) answered';
  }

  @override
  String anamnesisProgressCount(int answered, int total) {
    return '$answered / $total';
  }

  @override
  String get anamnesisScoreLabel => 'Regenerative relevance score';

  @override
  String get anamnesisFollowUpTitle => 'Follow-up questions';

  @override
  String get anamnesisFollowUpHint =>
      'A few more details to refine the orientation — not a diagnosis.';

  @override
  String get anamnesisFollowUpLoading => 'Preparing follow-up questions…';

  @override
  String anamnesisFollowUpProgress(int current, int total) {
    return 'Question $current / $total';
  }

  @override
  String get anamnesisDocsCta => 'Add a document (MRI / X-ray / lab result)';

  @override
  String get anamnesisDocsTitle => 'Exam documents';

  @override
  String get anamnesisDocsHint =>
      'Attach an imaging or biology report. Extraction reads key data — no clinical interpretation.';

  @override
  String get anamnesisDocsCamera => 'Photo';

  @override
  String get anamnesisDocsGallery => 'Gallery';

  @override
  String get anamnesisDocsPickFile => 'File';

  @override
  String get anamnesisDocsEmpty => 'No documents for this session.';

  @override
  String get anamnesisDocsUntitled => 'Document';

  @override
  String get anamnesisDocsReview => 'Review';

  @override
  String get anamnesisDocsReviewTitle => 'OCR extraction';

  @override
  String get anamnesisDocsReviewHint =>
      'Correct if needed. The raw OCR text is never overwritten.';

  @override
  String get anamnesisDocsStatusQueued => 'Queued';

  @override
  String get anamnesisDocsStatusProcessing => 'Extracting…';

  @override
  String get anamnesisDocsStatusExtracted => 'Extracted — to review';

  @override
  String get anamnesisDocsStatusFailed => 'Extraction failed';

  @override
  String get anamnesisDocsFieldExamType => 'Exam type';

  @override
  String get anamnesisDocsFieldExamDate => 'Exam date';

  @override
  String get anamnesisDocsFieldBodyRegion => 'Body region';

  @override
  String get anamnesisDocsFieldFacility => 'Facility';

  @override
  String get anamnesisDocsFieldFindings => 'Key findings (one per line)';

  @override
  String get anamnesisDocsFieldNotes => 'Notes';

  @override
  String get anamnesisDocsRawOcr => 'Raw OCR text';

  @override
  String get anamnesisDocsSaveCorrections => 'Save corrections';

  @override
  String get anamnesisDocsCorrectionsSaved => 'Corrections saved.';

  @override
  String get anamnesisUrgenceTitle => 'Emergency — consult immediately';

  @override
  String get anamnesisUrgenceFallback =>
      'Warning signs detected. Go to the emergency room or call emergency services immediately. This message is not a diagnosis.';

  @override
  String get anamnesisUrgenceNumbersLabel => 'Emergency numbers';

  @override
  String get anamnesisUrgenceAck => 'I understand';

  @override
  String get anamnesisRegenerativeTitle => 'Regenerative orientation';

  @override
  String get anamnesisRegenerativeMessage =>
      'Your journey can continue toward a personalised regenerative assessment.';

  @override
  String get anamnesisParcoursCta => 'Generate my assessment';

  @override
  String get anamnesisParcoursSoon => 'Generating assessment…';

  @override
  String get bilanListTitle => 'My assessment';

  @override
  String get bilanDetailTitle => 'Detailed assessment';

  @override
  String get bilanLoadError => 'Unable to load assessment.';

  @override
  String get bilanListEmpty => 'No assessments yet.';

  @override
  String bilanListItemTitle(String zone) {
    return 'Zone $zone';
  }

  @override
  String bilanListItemSubtitle(int score, DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Score $score % · $dateString';
  }

  @override
  String bilanScoreLabel(int score) {
    return 'Relevance score: $score %';
  }

  @override
  String get bilanSummarySection => 'Summary';

  @override
  String get bilanOrientationSection => 'Orientation';

  @override
  String get bilanExportPdf => 'Export PDF';

  @override
  String get bilanPdfOpenError => 'Unable to open PDF.';

  @override
  String get bilanTransmitCta => 'Send to specialist';

  @override
  String get bilanTransmitTitle => 'Assessment transmission';

  @override
  String get bilanTransmitHelp =>
      'Enter the target specialist\'s identifier (UUID directory.specialists).';

  @override
  String get bilanTransmitSpecialistId => 'Specialist ID';

  @override
  String get bilanTransmitSpecialistRequired =>
      'Specialist identifier is required.';

  @override
  String get bilanTransmitConfirm => 'Send';

  @override
  String get bilanTransmitSuccess => 'Assessment sent to specialist.';

  @override
  String get profileBilanTile => 'My assessment';

  @override
  String get referralMatchesTitle => 'Recommended specialists';

  @override
  String get referralMatchesEmpty =>
      'No recommended specialists at the moment. Try again after concierge validation.';

  @override
  String referralMatchScore(int score) {
    return 'Relevance $score %';
  }

  @override
  String get referralMatchSpecialistFallback => 'Specialist';

  @override
  String get referralLoadError => 'Unable to load recommendations.';

  @override
  String get referralSelectSuccess =>
      'Specialist selected — you can book an appointment.';

  @override
  String get profileCoachingTile => 'My coaching';

  @override
  String get bilanCoachingCta => 'My biological coaching';

  @override
  String get coachingListTitle => 'My coaching';

  @override
  String get coachingPlanTitle => 'Coaching plan';

  @override
  String get coachingLoadError => 'Unable to load coaching.';

  @override
  String get coachingListEmpty => 'No coaching plans yet.';

  @override
  String get coachingGenerating => 'Generating plan…';

  @override
  String coachingListItemTitle(String sessionId) {
    return 'Session $sessionId';
  }

  @override
  String coachingListItemSubtitle(int goalMl, DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Hydration goal $goalMl ml · $dateString';
  }

  @override
  String get coachingProgressLabel => 'Biological optimisation';

  @override
  String get coachingProgressError => 'Unable to load progress.';

  @override
  String get coachingHydrationTitle => 'Hydration';

  @override
  String get coachingHydrationError => 'Unable to load hydration.';

  @override
  String coachingHydrationMlGoal(int goalMl) {
    return '/ $goalMl ml';
  }

  @override
  String coachingHydrationAdd(int amountMl) {
    return '+ $amountMl ml';
  }

  @override
  String get coachingHydrationLogged => 'Hydration logged.';

  @override
  String get coachingSleepTitle => 'Sleep';

  @override
  String get coachingSleepError => 'Unable to load sleep.';

  @override
  String get coachingSleepEmpty => 'No recent entries.';

  @override
  String coachingSleepHoursLabel(String hours) {
    return 'Duration: $hours h';
  }

  @override
  String get coachingSleepQualityLabel => 'Quality (1 to 5)';

  @override
  String get coachingSleepLogCta => 'Log night';

  @override
  String get coachingSleepLogged => 'Sleep logged.';

  @override
  String coachingSleepLastEntry(String date, double hours, int quality) {
    return 'Last: $date — $hours h, quality $quality/5';
  }

  @override
  String get coachingSectionNutrition => 'Nutrition';

  @override
  String get coachingSectionMobility => 'Mobility';

  @override
  String get coachingSectionPosture => 'Posture';

  @override
  String get specialistIncomingBilansTab => 'Assessments';

  @override
  String get specialistIncomingBilansEmpty => 'No incoming assessments.';

  @override
  String get specialistIncomingBilansError =>
      'Unable to load incoming assessments.';

  @override
  String specialistIncomingBilanItem(String id) {
    return 'Assessment $id';
  }

  @override
  String get specialistIncomingBilanDetailTitle => 'Incoming assessment';

  @override
  String get specialistIncomingBilanMarkReviewed => 'Mark as reviewed';

  @override
  String get specialistIncomingBilanReviewed =>
      'Assessment marked as reviewed.';

  @override
  String get specialistIncomingBilanOpenAgenda => 'Open schedule';

  @override
  String get freemiumUnlockCta => 'Unlock';

  @override
  String get freemiumUnlockSuccess => 'Content unlocked successfully.';

  @override
  String get freemiumUnlockFailed => 'Payment failed.';

  @override
  String freemiumAmountLabel(int amount) {
    return '$amount DZD (sandbox)';
  }

  @override
  String get freemiumBilanTitle => 'Detailed assessment';

  @override
  String get freemiumBilanBody =>
      'Access full sections, documents and PDF export.';

  @override
  String get freemiumBilanPdfCta => 'Unlock PDF';

  @override
  String get freemiumCoachingTitle => 'Premium coaching';

  @override
  String get freemiumCoachingBody =>
      'Unlock the personalised plan and daily trackers.';

  @override
  String get alreadyHaveAccount => 'Ho già un account';

  @override
  String get needHelp => 'Serve aiuto?';

  @override
  String get viewGuide => 'Consulta la guida';

  @override
  String get welcomeHeroGpsLabel => 'GPS MEDICO';

  @override
  String get welcomeHeroGpsCaption => 'Prossimità ottimizzata';

  @override
  String get welcomeHeroRecordsLabel => 'CARTELLE';

  @override
  String get welcomeHeroRecordsCaption => 'Salute digitale';

  @override
  String get welcomeHeroAnalysisTitle => 'Analisi smart';

  @override
  String get welcomeHeroAnalysisCaption => 'Diagnostica in tempo reale';

  @override
  String onboardingSmartTitle(String brand) {
    return 'Il tuo $brand intelligente';
  }

  @override
  String onboardingSmartBody(String brand) {
    return 'Muoviti con serenità nel panorama medico algerino. $brand usa l\'IA per guidarti verso le cure migliori e monitorare la tua vitalità in tempo reale.';
  }

  @override
  String get onboardingFeatureGuidanceTitle => 'Guida esperta';

  @override
  String get onboardingFeatureGuidanceBody =>
      'Trova gli specialisti giusti in tutta l\'Algeria.';

  @override
  String get onboardingFeatureMonitoringTitle => 'Monitoraggio IA';

  @override
  String get onboardingFeatureMonitoringBody =>
      'Monitoraggio intelligente dei tuoi parametri vitali.';

  @override
  String get onboardingStepPainTitle => 'Localizza il tuo dolore';

  @override
  String get onboardingStepPainBody =>
      'Individua con precisione le zone di fastidio.';

  @override
  String get onboardingStepScreeningTitle => 'Screening intelligente';

  @override
  String get onboardingStepScreeningBody =>
      'La nostra IA analizza i tuoi sintomi e documenti.';

  @override
  String get onboardingStepPrepareTitle => 'Prepara il tuo corpo';

  @override
  String get onboardingStepPrepareBody =>
      'Ricevi consigli personalizzati prima della visita.';

  @override
  String get onboardingStepExpertTitle => 'Incontra l\'esperto';

  @override
  String get onboardingStepExpertBody =>
      'Prenota un appuntamento con lo specialista giusto.';

  @override
  String get onboardingBadgeHosting => 'Hosting locale';

  @override
  String get onboardingBadgeEncryption => 'Crittografia';

  @override
  String get onboardingBadgeDoctors => 'Medici verificati';

  @override
  String get onboardingBadgeDoctorsSubtitle => 'Autorizzati dallo Stato';

  @override
  String get onboardingTrustHosting => 'Hosting locale certificato ANPDP';

  @override
  String get onboardingTrustEncryption => 'Crittografia end-to-end';

  @override
  String get onboardingTrustDoctors => 'Medici verificati e autorizzati';

  @override
  String get securedLabel => 'Sicuro';

  @override
  String get instantLabel => 'Istantaneo';

  @override
  String get onboardingHeroGuidanceTitle => 'Orientamento intelligente';

  @override
  String get onboardingHeroGuidanceSubtitle => 'IA + rete medica algerina';

  @override
  String get onboardingHeroSampleDoctorName => 'Dr. Karim B.';

  @override
  String get onboardingHeroSampleDoctorSpecialty => 'Cardiologia';

  @override
  String get onboardingHeroSampleDoctorRating => '4,9';

  @override
  String get onboardingHeroAiStatusLabel => 'STATO IA';

  @override
  String get onboardingHeroAiStatusValue => 'Analisi attiva';

  @override
  String get onboardingHeroPathTitle => 'Il tuo percorso';

  @override
  String get onboardingHeroPathSteps => 'Dolore → Analisi → Specialista';

  @override
  String get orSeparator => 'O';

  @override
  String get signInWithBiometrics => 'Accedi con la biometria';

  @override
  String get notRegisteredYet => 'Non sei ancora registrato?';

  @override
  String get authToastTitle => 'Autenticazione';

  @override
  String get ninVisualGuideLabel => 'GUIDA VISIVA';

  @override
  String get ninVisualGuideBody =>
      'Il NIN si trova in alto a destra sulla tua carta biometrica.';

  @override
  String get ninFieldLabel => 'NIN';

  @override
  String get ninDigitsCount => '18 CIFRE';

  @override
  String get ninWhyLink => 'Perché il NIN?';

  @override
  String get passwordEncryptionNotice =>
      'Crittografia end-to-end conforme ANPDP';

  @override
  String get passwordStrengthLabel => 'Sicurezza della password:';

  @override
  String get passwordStrengthWeak => 'Debole';

  @override
  String get passwordStrengthMedium => 'Media';

  @override
  String get passwordStrengthStrong => 'Forte';

  @override
  String get passwordRuleMinLength => 'Almeno 10 caratteri';

  @override
  String get passwordRuleUppercase => 'Una lettera maiuscola';

  @override
  String get passwordRuleDigit => 'Una cifra';

  @override
  String get passwordRuleSpecial => 'Un carattere speciale';

  @override
  String get consentHealthSubtitle =>
      'Necessario per il funzionamento dell\'app e il monitoraggio della tua cartella clinica.';

  @override
  String get consentDataSubtitle =>
      'Autorizzare il trattamento sicuro e l\'hosting dei tuoi dati clinici.';

  @override
  String get consentMarketingSubtitle =>
      'Ricevi consigli di coaching biologico personalizzati e notizie sulla salute.';

  @override
  String get otpHelpBody =>
      'Se non ricevi il codice, controlla la connessione di rete o contatta il nostro supporto.';

  @override
  String get biometricEnableTitle => 'Attiva l\'accesso biometrico';

  @override
  String get biometricEnableSubtitle =>
      'Accedi più rapidamente e in sicurezza con Face ID o la tua impronta.';

  @override
  String get successFeatureNavigationLabel => 'NAVIGAZIONE';

  @override
  String get successFeatureNavigationBody => 'Trova cliniche';

  @override
  String get successFeatureAppointmentsLabel => 'APPUNTAMENTI';

  @override
  String get successFeatureAppointmentsBody => 'Gestione semplice';

  @override
  String get profilePlaceholderTitle => 'Profilo — segnaposto';

  @override
  String get profilePlaceholderSession => 'Sessione attiva (token nascosto).';

  @override
  String profilePlaceholderRole(String role) {
    return 'Ruolo: $role';
  }

  @override
  String get profilePlaceholderSimulateExpiry =>
      'Simula scadenza della sessione';

  @override
  String get errorRegistrationIncomplete => 'Dati di registrazione incompleti.';

  @override
  String get errorEmptyResponse => 'Risposta vuota dal server.';

  @override
  String get errorConflict =>
      'Si è verificato un conflitto (questa risorsa potrebbe già esistere).';

  @override
  String get errorInvalidInput => 'I dati inseriti non sono validi.';

  @override
  String get errorUnexpected => 'Si è verificato un errore inatteso.';

  @override
  String get errorPasswordUpdatedSignInAgain =>
      'Password aggiornata. Accedi con la nuova password.';

  @override
  String get painSelectionMissing =>
      'Manca la selezione della zona del dolore.';

  @override
  String get specialistPrescriptionSubmitError =>
      'Impossibile creare la prescrizione.';
}
