// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Berber languages (`ber`).
class AppLocalizationsBer extends AppLocalizations {
  AppLocalizationsBer([String locale = 'ber']) : super(locale);

  @override
  String get splashSubtitle => 'Seg usiref ɣer usenfel usligen';

  @override
  String get chooseLanguage => 'Fren tutlayt-ik';

  @override
  String get continueLabel => 'Kemmel';

  @override
  String get skip => 'Zgel';

  @override
  String get next => 'Uḍfir';

  @override
  String get start => 'Bdu';

  @override
  String get onboardingTitle1 => 'Seg usiref ɣer usenfel usligen';

  @override
  String get onboardingTitle2 => 'Amek iteddu?';

  @override
  String get onboardingTitle3 => 'Isefka-nnek ttwakelsen di Dzayer';

  @override
  String get onboardingBody1 =>
      'Yemmut usiref n teddwit. Amussnaw i ilaqen deg wakud i ilaqen.';

  @override
  String get onboardingBody2 =>
      'Abrid s 4 n tikkal: tamlalt, asekcem, acengu, usenfel.';

  @override
  String get onboardingBody3 =>
      'Asekles adigan ANPDP, awgelhen, imussnawen yettwasenqeden.';

  @override
  String get welcomeTitle => 'Ansuf';

  @override
  String get welcomeSubtitle => 'Abrid-ik n teddwit yebda da';

  @override
  String get createAccount => 'Rnu amiḍan';

  @override
  String get signIn => 'Qqen';

  @override
  String get loginTitle => 'Tuqqna';

  @override
  String get loginSubtitle => 'Yella yelha ad t-ẓreḍ';

  @override
  String get phoneLabel => 'Tiliɣri';

  @override
  String get passwordLabel => 'Awal uffir';

  @override
  String get confirmPasswordLabel => 'Sentem awal uffir';

  @override
  String get forgotPassword => 'Tettuḍeḍ awal uffir?';

  @override
  String get registration => 'Ajerred';

  @override
  String get verification => 'Asenqed';

  @override
  String get ninTitle => 'Tamagit-ik';

  @override
  String get ninSubtitle => 'Uṭṭun n tmagit tageldaẓit (18 n yizwilen)';

  @override
  String get ninHint => 'Yettban ɣef takaṛḍa-ik n tmagit';

  @override
  String get phoneTitle => 'Uṭṭun-ik n tiliɣri';

  @override
  String get phoneSubtitle => 'Ad ak-d-nazen tangalt n usenqed s SMS';

  @override
  String get phoneFormatHint => 'Amasal: +213 5XX, 6XX neɣ 7XX';

  @override
  String get sendCode => 'Azen tangalt';

  @override
  String get otpTitle => 'Sekcem tangalt i d-tufiḍ';

  @override
  String otpSubtitle(String phone) {
    return 'Tangalt s 6 n yizwilen i d-yettwaznen ɣer $phone';
  }

  @override
  String get ninVerificationPendingBanner =>
      'Asulay-ik yettwaseɣreg. Tzemreḍ ad tkemmeḍ ujerred — ulac ayen i tesriḍ.';

  @override
  String get resendCode => 'Ales azen tangalt';

  @override
  String resendIn(String seconds) {
    return 'Ales azen deg 0:$seconds';
  }

  @override
  String get verify => 'Senqed';

  @override
  String get passwordTitle => 'Rnu awal uffir';

  @override
  String get consentTitle => 'Asenqed-ik';

  @override
  String get consentSubtitle => 'Akked d uzref n Dzayer ANPDP';

  @override
  String get consentHealth => 'Aseqdec n yisefka-iw n teddwit';

  @override
  String get consentData => 'Aseqdec n yisefka-iw udmawanen';

  @override
  String get consentTerms => 'Tiwtilin d tsertit ANPDP';

  @override
  String get consentMarketing => 'Aselkem n usuq (yellan)';

  @override
  String get acceptTerms => 'Qebleɣ tiwtilin d tsertit n tbaḍnit';

  @override
  String get createMyAccount => 'Rnu amiḍan-iw';

  @override
  String get biometricTitle => 'Tuqqna tabiometrit';

  @override
  String get biometricSubtitle => 'Face ID neɣ adsil i tuqqna s zzerb';

  @override
  String get enable => 'Rmed';

  @override
  String get later => 'Ticki';

  @override
  String get successTitle => 'Ansuf ɣef GPS Médical !';

  @override
  String get successSubtitle => 'Amiḍan-ik yettwarnu akken iwata.';

  @override
  String get discoverApp => 'Snirem asnas';

  @override
  String get forgotTitle => 'Awi amiḍan';

  @override
  String get resetTitle => 'Awal uffir amaynut';

  @override
  String get resetAction => 'Ales awennez';

  @override
  String get invalidPhone => 'Uṭṭun ur yettwasenqed ara';

  @override
  String get invalidNin => 'NIN ur yettwasenqed ara';

  @override
  String get passwordsMismatch => 'Awalen uffiren ur mṣadan ara';

  @override
  String get requiredConsents => 'Qbal akk isenqaden yettwasra';

  @override
  String get networkError => 'Tuccḍa n uzeṭṭa. Ales.';

  @override
  String get fullNameTitle => 'Isem-ik ummid';

  @override
  String get fullNameSubtitle =>
      'Am wakken yerzan deg imeḥlun imeṣyediyan (gar 2 akked 120 n yiḥerfufen).';

  @override
  String get fullNameHint => 'Isem d tuzwalt';

  @override
  String get invalidFullName =>
      'Isem ur yettwasenqed ara (gar 2 akked 120 n yiḥerfufen).';

  @override
  String get errorInvalidCredentials =>
      'Isefka n tuqqna ur mṣadan ara. Senqed uṭṭun n tiliɣri d wawal uffir.';

  @override
  String get errorAccessDenied =>
      'Anekcum yettwagdel. Ur tesɛiḍ ara tixutert n unekcum.';

  @override
  String get errorTooManyRequests =>
      'Aṭas n urramen. Ales tikkelt-nniḍen deg kra n tedqiqin.';

  @override
  String get errorInternalServer =>
      'Tuccḍa deg uqeddac. Ales tikkelt-nniḍen ticki.';

  @override
  String get errorNetworkTimeout =>
      'Akud n tuqqna yemmut. Senqed azeṭṭa-ik n internet u ales.';

  @override
  String get errorNetworkConnection =>
      'Ur yezmir ara ad yeqqen ɣer uqeddac. Senqed azeṭṭa-ik.';

  @override
  String get errorPasswordRequired => 'Sider awal uffir.';

  @override
  String get bookingAvailabilityTitle => 'Fren asrag';

  @override
  String get bookingPreviousWeek => 'Ddurur yezrin';

  @override
  String get bookingNextWeek => 'Ddurur d-iteddun';

  @override
  String bookingSlotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count n yisrag',
      one: '1 n usrag',
      zero: 'Ulac asrag',
    );
    return '$_temp0';
  }

  @override
  String get bookingReserve => 'Ḥbes';

  @override
  String bookingSlotDuration(int minutes) {
    return 'Tanzagt: $minutes n tesdatin';
  }

  @override
  String get bookingModeInPerson => 'S wudem udmawan';

  @override
  String get bookingModeTelehealth => 'Aselkim aḥric';

  @override
  String get bookingModeAll => 'Akken';

  @override
  String bookingWeekRange(String from, String to) {
    return '$from – $to';
  }

  @override
  String get bookingSelectMode => 'Fren askar n uselkim';

  @override
  String bookingLockExpires(String time) {
    return 'Asrag yettwḥbes — ad yemmut deg $time';
  }

  @override
  String get bookingLockExpired => 'Aḥbes n usrag yemmut.';

  @override
  String get bookingBack => 'Uɣal';

  @override
  String get bookingStepConfirm => 'Sentem asrag';

  @override
  String get bookingStepPatient => 'I man?';

  @override
  String get bookingStepReview => 'Agzul';

  @override
  String get bookingForMe => 'I wudem-iw';

  @override
  String get bookingReasonHint => 'Taɣuri n uselkim (yellan)';

  @override
  String get bookingSubmit => 'Sentem ameẓlu';

  @override
  String get bookingRescheduleSubmit => 'Ales awennez ameẓlu';

  @override
  String get bookingSlotTakenTitle => 'Asrag ur yelli ara';

  @override
  String get bookingSlotTakenMessage =>
      'Asrag-a yettwḥbes tura. Fren asrag-nniḍen?';

  @override
  String get bookingChooseAnotherSlot => 'Fren asrag-nniḍen';

  @override
  String get bookingOfflineBanner => 'Ur tettuqq ara — aḥbes yesra tuqqna';

  @override
  String get bookingOfflineSubmit => 'Tuqqna tettwasra i usentem';

  @override
  String get bookingResumeDraftTitle => 'Kemmel aḥbes?';

  @override
  String get bookingResumeDraftMessage =>
      'Yella aḥbes yettwasekles. Tuqqna tettwasra i usentem.';

  @override
  String get bookingOnlineRestored => 'Tuqqna tetteddu — tzemreḍ ad sentmeḍ';

  @override
  String get bookingResume => 'Kemmel';

  @override
  String get bookingDiscard => 'Zgel';

  @override
  String get appointmentsTitle => 'Imeẓluyen';

  @override
  String get appointmentsUpcoming => 'I d-iteddun';

  @override
  String get appointmentsHistory => 'Amazray';

  @override
  String get appointmentsEmptyUpcoming => 'Ulac imeẓluyen i d-iteddun';

  @override
  String get appointmentsEmptyUpcomingCta => 'Af amussnaw';

  @override
  String get appointmentsEmptyHistory => 'Ulac imeẓluyen yezrin';

  @override
  String get appointmentDetailTitle => 'Talqayt n umeẓlu';

  @override
  String get appointmentCancel => 'Sefsex';

  @override
  String get appointmentReschedule => 'Ales awennez';

  @override
  String get appointmentCancelReasonHint => 'Taɣuri n usefsex (yellan)';

  @override
  String get appointmentConfirmCancel => 'Sentem usefsex';

  @override
  String get appointmentDirections => 'Abrid';

  @override
  String get appointmentJoinTelehealth => 'Kcem';

  @override
  String get appointmentJoinTelehealthHint =>
      'Aselkim aḥric ad yili deg lqem d-iteddun.';

  @override
  String get appointmentLeaveReview => 'Eǧǧ tamawt';

  @override
  String get appointmentStatusPending => 'Yettṛaju';

  @override
  String get appointmentStatusConfirmed => 'Yettwasenqed';

  @override
  String get appointmentStatusCancelled => 'Yettwasefsex';

  @override
  String get appointmentStatusCompleted => 'Yemmed';

  @override
  String get appointmentStatusNoShow => 'Ur yelli ara';

  @override
  String get appointmentPaymentUnpaid => 'Ur yettwaf ara';

  @override
  String get appointmentPaymentDeposit => 'Asekcem yettwaf';

  @override
  String get appointmentPaymentPaid => 'Yettwaf';

  @override
  String get appointmentPaymentRefunded => 'Yettwaɣel';

  @override
  String get bookingLoadError => 'Ur izmir ara ad d-yekker usrag.';

  @override
  String get appointmentsLoadError => 'Ur izmir ara ad d-kker imeẓluyen.';

  @override
  String get appointmentDetailLoadError => 'Ur izmir ara ad d-yekker umeẓlu.';

  @override
  String get bookingFeeLabel => 'Tasfart';

  @override
  String get bookingSummaryDoctor => 'Amussnaw';

  @override
  String get bookingSummarySlot => 'Asrag';

  @override
  String get bookingSummaryPatient => 'Ameglay';

  @override
  String get bookingSummaryReason => 'Taɣuri';

  @override
  String get errorGenericTitle => 'Tuccḍa';

  @override
  String get retry => 'Ɛreḍ tikelt nniḍen';

  @override
  String get specialtiesEmpty => 'Ulac tamlilt.';

  @override
  String get specialtiesLoadError => 'Ur izmir ara ad d-kker timaliwin.';

  @override
  String specialtiesPickerParentAll(String name) {
    return 'Akken ma yella ($name)';
  }

  @override
  String get geoWilayaPickerTitle => 'Fren tamnaḍt';

  @override
  String get geoCommunePickerTitle => 'Fren tɣremt';

  @override
  String get geoClear => 'Sfeḍ';

  @override
  String get geoSearchWilayaHint => 'Nadi tamnaḍt…';

  @override
  String get geoSearchCommuneHint => 'Nadi tɣremt…';

  @override
  String get geoWilayaEmpty => 'Ulac tamnaḍt.';

  @override
  String get geoCommuneEmpty => 'Ulac tɣremt.';

  @override
  String get geoWilayasLoadError =>
      'Ur izmir ara ad d-kker timaliwin n tmnaḍin.';

  @override
  String get geoCommunesLoadError => 'Ur izmir ara ad d-kker tɣremiwin.';

  @override
  String get geoUseWilayaCenter => 'Seqdec alemmas n tmnaḍt';

  @override
  String get discoveryAppBarTitle => 'MedNavigator';

  @override
  String get discoveryRecommendedTitle => 'Iseɣyaden yettwassen';

  @override
  String get discoveryViewList => 'Tabdart';

  @override
  String get discoveryViewMap => 'Takarḍa';

  @override
  String get discoveryDoctorsEmptyTitle => 'Ulac amussnaw';

  @override
  String get discoveryDoctorsEmptyMessage =>
      'Ulac aseɣyad i d-yemṣadan akka tura.';

  @override
  String get discoverySearchAction => 'Nadi';

  @override
  String get discoveryDoctorsLoadError =>
      'Ur izmir ara ad d-yekker tabdart n yiseɣyaden.';

  @override
  String get discoveryRateLimitTitle => 'Aṭas n tuttriwin';

  @override
  String discoveryRateLimitMessage(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Rǧu $seconds n tasinin uqbel ad tɛreḍ tikelt nniḍen.',
      one: 'Rǧu tasint uqbel ad tɛreḍ tikelt nniḍen.',
    );
    return '$_temp0';
  }

  @override
  String get doctorTitleDefault => 'Dr.';

  @override
  String get doctorLanguageArabic => 'Taɛrabt';

  @override
  String get doctorLanguageFrench => 'Tafṛansist';

  @override
  String get doctorLanguageEnglish => 'Taglizit';

  @override
  String get doctorLanguageTamazight => 'Tamaziɣt';

  @override
  String get doctorCardBookCta => 'Awi-d ameẓlu';

  @override
  String get doctorCardTelehealth => 'Asarag s tvidyu';

  @override
  String get doctorCardVerifiedBadge => 'Yettwasen';

  @override
  String doctorCardMatchPercent(int percent) {
    return '$percent% umsaɣ';
  }

  @override
  String get searchHint => 'Nadi amussnaw neɣ tamlilt…';

  @override
  String get searchEmptyTitle => 'Ulac amussnaw i d-yemṣadan';

  @override
  String get searchEmptyMessage => 'Ssemɣer tamnaḍt neɣ beddel imyafra?';

  @override
  String get searchClearFilters => 'Sfeḍ imyafra';

  @override
  String get searchLoadError => 'Tuccḍa deg unadi.';

  @override
  String get searchSuggestionsEmpty => 'Ulac isumar.';

  @override
  String get searchSuggestionsLoadError => 'Ur izmir ara ad d-kker isumar.';

  @override
  String get searchSuggestionsSpecialties => 'Timaliwin';

  @override
  String get searchSuggestionsDoctors => 'Imussnawen';

  @override
  String get searchSuggestionsLocations => 'Idiganen';

  @override
  String get searchFiltersTitle => 'Imyafra n unadi';

  @override
  String get searchFiltersReset => 'Ales asenker';

  @override
  String get searchFiltersApply => 'Snes imyafra';

  @override
  String get searchFilterSpecialty => 'Tamlilt';

  @override
  String get searchFilterSpecialtyAll => 'Akken ma yella timaliwin';

  @override
  String get searchFilterLocation => 'Adig (Tamnaḍt / Tɣremt)';

  @override
  String get searchFilterLocationAll => 'Akken ma yella Lezzayer';

  @override
  String get searchFilterGender => 'Taswit';

  @override
  String get searchFilterGenderAny => 'Akken ma yella';

  @override
  String get searchFilterGenderMale => 'Amarg';

  @override
  String get searchFilterGenderFemale => 'Unti';

  @override
  String get searchFilterLanguages => 'Tutlayin';

  @override
  String get searchFilterMaxFee => 'Tasfart tafellayt';

  @override
  String searchFilterMaxFeeValue(int fee) {
    return '$fee DZD';
  }

  @override
  String get searchFilterAvailability => 'Tili';

  @override
  String get searchFilterAvailabilityAll => 'Akken ma yella';

  @override
  String get searchFilterAvailabilityToday => 'Ass-a';

  @override
  String get searchFilterAvailability3Days => '3 wussan';

  @override
  String get searchFilterAvailability1Week => '1 dduṛt';

  @override
  String get searchFilterAvailability1Month => '1 ayyur';

  @override
  String get searchFilterTelehealth => 'Asarag s tvidyu yella';

  @override
  String get searchFilterInsurance => 'Tasekla yettwafen';

  @override
  String get searchFilterInsuranceCnas => 'CNAS yettwaf';

  @override
  String get searchFilterInsuranceCasnos => 'CASNOS yettwaf';

  @override
  String get searchFilterSort => 'Smizzwer s';

  @override
  String get searchFilterSortRelevance => 'Aɣbalu';

  @override
  String get searchFilterSortRating => 'Tazmert tameqqrant';

  @override
  String get searchFilterSortFeeAsc => 'Tasfart s ugnin';

  @override
  String get searchFilterSortFeeDesc => 'Tasfart s uznin';

  @override
  String get searchFilterSortDistance => 'Amasa s ugnin';

  @override
  String get doctorDetailTitle => 'Amaɣnu n umsaɣyad';

  @override
  String get doctorDetailBioTitle => 'Tameddit';

  @override
  String get doctorDetailBioEmpty => 'Ulac tameddit.';

  @override
  String get doctorDetailBioExpand => 'Ɣer s ugar';

  @override
  String get doctorDetailBioCollapse => 'Sken drus';

  @override
  String get doctorDetailFeeTitle => 'Tasfart n umsaɣ';

  @override
  String get doctorDetailFeeInPerson => 'Asarag deg uxxam';

  @override
  String doctorDetailFeeValue(int fee) {
    return '$fee DZD';
  }

  @override
  String get doctorDetailLanguagesTitle => 'Tutlayin';

  @override
  String get doctorDetailLanguagesEmpty => 'Ur yettwasen ara';

  @override
  String get doctorDetailAddressTitle => 'Adresse n uxxam';

  @override
  String get doctorDetailMapUnavailable => 'Takarḍa ur tettwaf ara';

  @override
  String get doctorDetailReviewsTitle => 'Iɣewwaṛen n yimeɣlanen';

  @override
  String get doctorDetailReviewsEmpty => 'Ulac iɣewwaṛen akka tura.';

  @override
  String get doctorDetailReviewsLoadMore => 'Wali ugar';

  @override
  String get doctorDetailVerifiedPatient => 'Ameglay yettwasen';

  @override
  String get doctorDetailBookCta => 'Awi-d ameẓlu';

  @override
  String get doctorDetailTelehealthCta => 'Asarag s tvidyu';

  @override
  String get doctorDetailNotFoundTitle => 'Ulac amussnaw';

  @override
  String get doctorDetailNotFoundMessage => 'Amaɣnu-a ur yelli ara.';

  @override
  String get doctorDetailLoadError => 'Ur izmir ara ad d-yekker amaɣnu.';

  @override
  String get mapNearbyTitle => 'Imsaɣyaden iqriben';

  @override
  String get mapNearbyLoadErrorTitle => 'Tuccḍa deg uɣer';

  @override
  String get mapNearbyLoadErrorMessage => 'Tella tuccḍa deg tkart.';

  @override
  String get mapNearbyPermissionBanner =>
      'Sireg ad d-yekker wadig iwakken ad twaliḍ imsaɣyaden iqriben.';

  @override
  String get mapNearbyPermissionRationaleTitle => 'Anekcum ɣer wadig';

  @override
  String get mapNearbyPermissionRationaleBody =>
      'MedNavigator iseqdec wadig-ik iwakken ad d-yesken imsaɣyaden iqriben. Tzemreḍ daɣen tferḥ wilaya s ufus.';

  @override
  String get mapNearbyPermissionRationaleContinue => 'Kemmel';

  @override
  String get mapNearbyPermissionRationaleCancel => 'Sefsex';

  @override
  String get mapNearbyPermissionAllow => 'Sireg';

  @override
  String get mapNearbyChooseWilaya => 'Fren wilaya';

  @override
  String get mapNearbyMyLocation => 'Wadig-iw';

  @override
  String get mapNearbyEdit => 'Beddel';

  @override
  String get mapNearbyWilayaSearch => 'Anadi s wilaya';

  @override
  String mapNearbyWilayaSearchNamed(String wilaya) {
    return 'Anadi s wilaya ($wilaya)';
  }

  @override
  String mapNearbyLocationComma(String commune, String wilaya) {
    return '$commune, $wilaya';
  }

  @override
  String get mapNearbyRadiusLabel => 'Amasa:';

  @override
  String mapNearbyRadiusValue(String radius) {
    return '$radius km';
  }

  @override
  String mapNearbyClusterCount(int count) {
    return '$count imsaɣyad';
  }

  @override
  String get mapNearbyChooseWilayaTooltip => 'Fren wilaya';

  @override
  String get mapNearbySpecialtyTitle => 'Fren taseɣt';

  @override
  String get mapNearbySpecialtyClear => 'Sfeḍ';

  @override
  String get profileTitle => 'Amaɣnu-iw';

  @override
  String get profileEdit => 'Beddel';

  @override
  String get profileSave => 'Sekles';

  @override
  String get profileAccount => 'Amiḍan';

  @override
  String get profileSignOut => 'Ffeɣ';

  @override
  String get profileFullName => 'Isem ummid';

  @override
  String get profilePhone => 'Tiliɣri';

  @override
  String get profileEmail => 'Imayl';

  @override
  String get profileBirthDate => 'Azemz n tlalit';

  @override
  String get profileGender => 'Taswit';

  @override
  String get profileBloodType => 'Anaw n idammen';

  @override
  String get profileAddress => 'Tansa';

  @override
  String get profileAddressLine1 => 'Abrid d uṭṭun';

  @override
  String get profileAddressLine2 => 'Talɣut nniḍen';

  @override
  String get profilePostalCode => 'Tangalt n lpusṭa';

  @override
  String get profileAllergies => 'Tigriwin';

  @override
  String get profileChronicConditions => 'Tamdidin iḥerfan';

  @override
  String get profileInsurance => 'Asekles';

  @override
  String get profileInsuranceProvider => 'Amasluy';

  @override
  String get profileInsuranceNumber => 'Uṭṭun n usekles';

  @override
  String get profileNotSet => 'Ur yettwasekles ara';

  @override
  String get profileReadOnlyField => 'Ur izmir ara ad yettwabeddel';

  @override
  String get profileGenderMale => 'Argaz';

  @override
  String get profileGenderFemale => 'Tamtut';

  @override
  String get profileGenderOther => 'Wayeḍ';

  @override
  String get profileInsuranceCnas => 'CNAS';

  @override
  String get profileInsuranceCasnos => 'CASNOS';

  @override
  String get profileInsuranceNone => 'Ulac';

  @override
  String get profileInsurancePrivate => 'Uslig';

  @override
  String get profilePickBirthDate => 'Fren azemz';

  @override
  String get profilePickAddress => 'Fren wilaya d tgemmart';

  @override
  String get profileTagHint => 'Aru sakin Enter';

  @override
  String get profileAddTag => 'Rnu';

  @override
  String get profileInvalidEmail => 'Imayl ur ilaq ara';

  @override
  String get profileInvalidBirthDate =>
      'Azemz n tlalit ur izmir ara ad yili deg usass';

  @override
  String get profileLoadError => 'Ur izmir ara ad d-yali amaɣnu';

  @override
  String get profileSaveError => 'Asekles ur yeddi ara';

  @override
  String get profileDeleteAccount => 'Kkes amiḍan-iw';

  @override
  String get profileDeleteTitle => 'Kkes amiḍan-ik?';

  @override
  String get profileDeleteWarning =>
      'Aya ad iseɣmu tukksa n amiḍan-ik d yisefka-ik udmawanen.';

  @override
  String get profileDeleteGracePeriod =>
      'Aɣawas n 30 n wussan i usefsex s tuqqna.';

  @override
  String get profileDeleteConfirm => 'Ih, kkes amiḍan-iw';

  @override
  String get profileDeleteFinalTitle => 'Asentem aneggaru';

  @override
  String get profileDeleteFinalMessage =>
      'Tebɣiḍ s tidet? Amiḍan-ik ad yettwaseɣmu i tukksa.';

  @override
  String get profileDeleteSuccess => 'Amiḍan yettwaseɣmu i tukksa';

  @override
  String get profileDeleteError => 'Tukksa ur teddi ara';

  @override
  String get profileConsents => 'Asenqed ANPDP';

  @override
  String get consentManagementTitle => 'Asenqed-iw';

  @override
  String consentVersionLabel(String version) {
    return 'Lqem $version';
  }

  @override
  String consentGrantedAtLabel(String date) {
    return 'Yettwasenqed $date';
  }

  @override
  String consentRevokedAtLabel(String date) {
    return 'Yettwakkes $date';
  }

  @override
  String get consentActive => 'Urmid';

  @override
  String get consentRevoked => 'Yettwakkes';

  @override
  String get consentRevokeEssential => 'Kkes asenqed-iw';

  @override
  String get consentRevokeEssentialTitle => 'Kkes asenqed ameqqran?';

  @override
  String get consentRevokeEssentialMessage =>
      'Kkes asenqed ameqqran ad yesεeggem amiḍan-ik. Ur tzemreḍ ad tesqedceḍ asnas armi ad yettwarmad amiḍan.';

  @override
  String get consentRevokeEssentialConfirm => 'Kkes s usεeggem';

  @override
  String get consentRevokeError => 'Ur izmir ara ad yettwakkes asenqed';

  @override
  String get consentRevokedLandingTitle => 'Amiḍan yettwasεeggem';

  @override
  String get consentRevokedLandingMessage =>
      'Tekkseḍ asenqed ameqqran. Amiḍan-ik yettwasεeggem s lmend n ANPDP.';

  @override
  String get consentRevokedLandingAction => 'Uɣal ɣer wazal';

  @override
  String get dependentsTitle => 'Ilmawen';

  @override
  String get dependentsAdd => 'Rnu amdan';

  @override
  String get dependentsEdit => 'Beddel amdan';

  @override
  String get dependentsEmpty => 'Ulac ilmawen yettwaseklen';

  @override
  String get dependentsDeleteTitle => 'Kkes amdan-a?';

  @override
  String get dependentsDeleteMessage =>
      'Aya d tukksa taggara. Imeẓluyen yezrin qqimen yeqqnen ɣer udmawan-a.';

  @override
  String get dependentsDeleteConfirm => 'Kkes';

  @override
  String get dependentFullName => 'Isem ummid';

  @override
  String get dependentRelation => 'Akessam';

  @override
  String get dependentBirthDate => 'Azemz n tlalit';

  @override
  String get dependentGender => 'Taswit';

  @override
  String get dependentRelationChild => 'Aqcic';

  @override
  String get dependentRelationSpouse => 'Tamusni';

  @override
  String get dependentRelationParent => 'Amac';

  @override
  String get dependentRelationOther => 'Wayeḍ';

  @override
  String dependentAgeYears(int age) {
    return '$age iseggasen';
  }

  @override
  String get dependentSaveError => 'Asekles ur yeddi ara';

  @override
  String get dependentDeleteError => 'Tukksa ur teddi ara';

  @override
  String get medicalRecordsTitle => 'Asebter aṭṭawi';

  @override
  String get medicalRecordsEmpty => 'Ulac isemliyen';

  @override
  String get medicalRecordsLoadError => 'Ur izmir ara ad yessali isemliyen';

  @override
  String get medicalRecordsFilterAll => 'Akk';

  @override
  String get medicalRecordTypePrescription => 'Tawsit';

  @override
  String get medicalRecordTypeReport => 'Aneqqis';

  @override
  String get medicalRecordTypeLabResult => 'Aselmed';

  @override
  String get medicalRecordTypeImaging => 'Tawlaft';

  @override
  String get medicalRecordTypeCertificate => 'Aselkan';

  @override
  String get medicalRecordTypeOther => 'Wayeḍ';

  @override
  String get medicalRecordAuthorPatient => 'Amusiw';

  @override
  String get medicalRecordAuthorSpecialist => 'Aṭbib';

  @override
  String get medicalRecordAuthorConcierge => 'Aqeddac';

  @override
  String get medicalRecordViewerPlaceholder =>
      'Timeẓli n usemli ad tili yakan.';

  @override
  String medicalRecordFileSizeBytes(int size) {
    return '$size ibiten';
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
  String get medicalRecordsUpload => 'Rnu asmeli';

  @override
  String get medicalRecordsUploadAddCamera => 'Takamera';

  @override
  String get medicalRecordsUploadAddGallery => 'Taɣzut';

  @override
  String get medicalRecordsUploadAddFiles => 'Isemliyen PDF';

  @override
  String get medicalRecordUploadType => 'Anaw n usmeli';

  @override
  String get medicalRecordUploadTitle => 'Azwel (d afrayan)';

  @override
  String get medicalRecordUploadNotes => 'Tizmilin (d afrayan)';

  @override
  String get medicalRecordUploadPatient => 'Amusiw yettwafen';

  @override
  String get medicalRecordUploadSubmit => 'Sali';

  @override
  String medicalRecordUploadMaxFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Afellay $count n isemliyen i uzzen',
      one: 'Afellay 1 n usamḍan i uzzen',
    );
    return '$_temp0';
  }

  @override
  String get medicalRecordUploadFileTooLarge =>
      'Yal afaylu ilaq ad yili 20 Mo neɣ drus.';

  @override
  String get medicalRecordUploadInvalidMime => 'Igan: PDF, JPEG neɣ PNG kan.';

  @override
  String get medicalRecordUploadTypeRequired => 'Fren anaw n usmeli.';

  @override
  String get medicalRecordUploadNoFiles => 'Rnu afellay yiwen n ufaylu.';

  @override
  String get medicalRecordUploadStorageUnavailable =>
      'Ameẓlu n yifuyla ur yelli ara akka tura. Ɛreḍ ticki.';

  @override
  String get medicalRecordUploadCancel => 'Sefsex';

  @override
  String get medicalRecordUploadSuccess => 'Asmeli yettwarna';

  @override
  String get medicalRecordUploadFailed => 'Asali ur yeddi ara';

  @override
  String get medicalRecordDownload => 'Sader';

  @override
  String get medicalRecordShare => 'Bḍu';

  @override
  String get medicalRecordDownloadSuccess => 'Afaylu yettwasekles deg usader';

  @override
  String get medicalRecordViewerLoadError => 'Ur izmir ara ad yeldi asmeli';

  @override
  String get medicalRecordDeleteTitle => 'Kkes asmeli-a?';

  @override
  String get medicalRecordDeleteMessage =>
      'Aya d tukksa taggara. Afaylu ad yettwakkes seg umuɣ.';

  @override
  String get medicalRecordDeleteConfirm => 'Kkes';

  @override
  String get medicalRecordDeleteError => 'Tukksa ur teddi ara';

  @override
  String get messagingTitle => 'Tuzinin';

  @override
  String get messagingEmpty => 'Ulac adiwenni akka tura';

  @override
  String get messagingLoadError => 'Ur izmir ara ad yali idiwenniyen';

  @override
  String get messagingAttachmentPreview => 'Amedday';

  @override
  String get messagingThreadPlaceholder => 'Adiwenni — talqayt ad tili ticki';

  @override
  String get messagingComposerHint => 'Aru izen…';

  @override
  String get messagingSend => 'Azen';

  @override
  String get messagingAttach => 'Rnu asmeli';

  @override
  String get messagingPickAttachments => 'Fren isemliyen';

  @override
  String get messagingAttachConfirm => 'Rnu ayen yettwafernen';

  @override
  String get messagingMessagePending => 'Azzen…';

  @override
  String get messagingMessageSent => 'Yettwazen';

  @override
  String get messagingMessageRead => 'Yettaɣra';

  @override
  String get messagingSendError => 'Azzen ur yeddi ara';

  @override
  String get messagingLoadMessagesError => 'Ur izmir ara ad yali iznan';

  @override
  String get notificationsTitle => 'Ilɣa';

  @override
  String get notificationsEmpty => 'Ulac ilɣa';

  @override
  String get notificationsLoadError => 'Ur izmir ara ad yali ilɣa';

  @override
  String get notificationsMarkAllRead => 'Creḍ akk yettwaɣra';

  @override
  String get notificationsPreferences => 'Ismenyifen';

  @override
  String get notificationsPreferencesTitle => 'Ismenyifen n ilɣa';

  @override
  String get notificationsPrefPush => 'Ilɣa push';

  @override
  String get notificationsPrefSms => 'SMS';

  @override
  String get notificationsPrefEmail => 'Imayl';

  @override
  String get notificationsPrefAppointmentReminders => 'Asmekti n umarur';

  @override
  String get notificationsPrefMarketing => 'Ixfawen d yisallen';

  @override
  String get notificationsPrefReminderHours => 'Asmekti send amarur';

  @override
  String notificationsPrefReminderHoursValue(int hours) {
    return '$hours n usrag send';
  }

  @override
  String get notificationsPrefSaveError => 'Asekles ur yeddi ara';

  @override
  String get reviewCreateTitle => 'Eǧǧ tamawt';

  @override
  String get reviewRatingLabel => 'Tazmert';

  @override
  String get reviewCommentLabel => 'Awal (ifessasen)';

  @override
  String get reviewCommentHint => 'Bḍu tarmit-ik·im…';

  @override
  String get reviewSubmit => 'Azen';

  @override
  String get reviewSubmitError => 'Ur yezmir ara ad yettwazen uceggu.';

  @override
  String get reviewRatingRequired => 'Ma ulac aɣilif, fren tazmert.';

  @override
  String reviewCommentTooLong(int max) {
    return 'Awal ur ilaq ad iεeddi $max n isekkilen.';
  }

  @override
  String get reviewConfirmationTitle => 'Tanemmirt ɣef tamawt-ik·im';

  @override
  String get reviewConfirmationBody =>
      'Tamawt-ik·im teǧǧa deg usenqed. Ad tettwasekles seld asenqed n terbaɛt-nneɣ, s wudem amezwar deg 48 n usrag.';

  @override
  String get reviewConfirmationStatusPending => 'Deg usenqed';

  @override
  String get reviewAlreadySubmitted => 'Tǧǧiḍ yakan tamawt';

  @override
  String get reviewDelete => 'Kkes tamawt-inu';

  @override
  String get reviewDeleteConfirm => 'Kkes tamawt-a?';

  @override
  String get reviewDeleteSuccess => 'Tamawt tettwakkes.';

  @override
  String get reviewDeleteError => 'Ur yezmir ara ad yettwakkes uceggu.';

  @override
  String get reviewDeleteExpired => 'Akkew ur yezmir ara seld 7 n wussan.';

  @override
  String get reviewAlreadyExistsError => 'Yella yakan uceggu i umarur-a.';

  @override
  String get reviewNotEligibleError =>
      'Amarur-a ur yettak ara ad d-teǧǧeḍ tamawt.';

  @override
  String get reviewBackToAppointment => 'Uɣal ɣer umarur';

  @override
  String reviewStarsLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count n yitran',
      one: '1 n yitri',
    );
    return '$_temp0';
  }

  @override
  String get paymentDepositTitle => 'Xelleṣ asekcem';

  @override
  String paymentDepositBody(int amount) {
    return 'Yesra asekcem n $amount DZD akken ad yettwasentem amarur-a.';
  }

  @override
  String get paymentDepositCta => 'Xelleṣ asekcem';

  @override
  String paymentDepositAmountLabel(int amount) {
    return '$amount DZD';
  }

  @override
  String get paymentDepositProviderStripeTest => 'Askar n usekker (sandbox)';

  @override
  String get paymentDepositSandboxHint =>
      'Axelleṣ yettwasenfel deg usenqed n usekker.';

  @override
  String get paymentDepositSuccess => 'Axelleṣ yedda. Amaruṛ yettwaleqqem.';

  @override
  String get paymentDepositFailed => 'Axelleṣ ur yeddi ara.';

  @override
  String get paymentDepositNotEligible =>
      'Amarur-a ur yettak ara ad yettwaxelleṣ.';

  @override
  String get specialistVerificationPendingTitle => 'Aseɣwen yettwaseɣreg';

  @override
  String get specialistVerificationPendingBody =>
      'Aseɣwen-ik yettwaseɣreg sɣur teɣribt-nneɣ. Ad teṭṭfeḍ ilɣa mi ara d-yettwafken umala.';

  @override
  String get specialistVerificationMoreInfoTitle => 'Isefka-nniḍen yettwasra';

  @override
  String get specialistVerificationMoreInfoBody =>
      'Teɣribt-nneɣ tesra iseklasen neɣ isefka-nniḍen uqbel ad tseddu aseɣwen-ik.';

  @override
  String get specialistVerificationRejectedTitle => 'Aseɣwen yettwagi';

  @override
  String get specialistVerificationRejectedBody =>
      'Ur yezmir ara ad yettwaseddu aseɣwen-ik. Wali izen ddaw-nni u azen iseklasen timaynutin ma yella yesra.';

  @override
  String get specialistVerificationSubmitCta => 'Azen iseklasen-iw';

  @override
  String get specialistVerificationResubmitCta => 'Ales azen iseklasen-iw';

  @override
  String get specialistVerificationCompleteProfileCta => 'Semmed amaɣnu-iw';

  @override
  String get specialistProfileEditTitle => 'Senfel amaɣnu-iw';

  @override
  String get specialistProfileSaveChanges => 'Sekles ibeddilen';

  @override
  String get specialistProfileSectionInfo => 'Isefka';

  @override
  String get specialistProfileSectionSpecialties => 'Timaliwin';

  @override
  String get specialistProfileSectionLanguages => 'Tutlayin yettwahderen';

  @override
  String get specialistProfileSectionConsultation => 'Aselmen';

  @override
  String get specialistProfileSectionPractice => 'Adeg n uxeddim';

  @override
  String get specialistProfileTitle => 'Azwel';

  @override
  String get specialistProfileBio => 'Tameddurt';

  @override
  String get specialistProfilePhotoUrl => 'URL n uṭṭṭun';

  @override
  String get specialistProfileSelectSpecialty => 'Tamlilt tameqqrant';

  @override
  String get specialistProfileFee => 'Azal n uselmen (DZD)';

  @override
  String get specialistProfileCnas => 'Ameɣnas CNAS';

  @override
  String get specialistProfileCasnos => 'Ameɣnas CASNOS';

  @override
  String get specialistProfileTelehealth => 'Aselmen s usrid yella';

  @override
  String get specialistProfileConfirmationPolicy => 'Tarrayt n usentem';

  @override
  String get specialistProfilePolicyManual => 'S ufus';

  @override
  String get specialistProfilePolicyAuto => 'Awurman';

  @override
  String get specialistProfileBookingWindow => 'Asfaw n ujerred (ussan)';

  @override
  String get specialistProfileAddressLine1 => 'Tansa';

  @override
  String get specialistProfileAddressLine2 => 'Tansa tamernant';

  @override
  String get specialistProfileVerifiedBadge => 'Amiḍan yettwasenqed';

  @override
  String get specialistProfileUnverifiedBadge => 'Ur yettwasenqed ara';

  @override
  String get specialistCredentialsTitle => 'Isekla-s udmawanen';

  @override
  String get specialistCredentialsSubtitle =>
      'Sekcem uṭṭun n tɣemmas n tdokturan, ssekcem diplômes neɣ tikaratin (PDF, JPEG, PNG — 10 Mo s uɣbelas).';

  @override
  String get specialistCredentialsCouncilNumber =>
      'Uṭṭun n tɣemmas n tdokturan';

  @override
  String get specialistCredentialsCouncilRequired =>
      'Uṭṭun n tɣemmas n tdokturan yettwasra.';

  @override
  String get specialistCredentialsType => 'Anaw n usekles';

  @override
  String get specialistCredentialsAddFile => 'Rnu afaylu';

  @override
  String get specialistCredentialsNoFiles => 'Rnu yiwet n usekles aṭas.';

  @override
  String get specialistCredentialsSubmit => 'Azen i usenqed';

  @override
  String get specialistCredentialsExisting => 'Isekla-s yettwaznen yakan';

  @override
  String get specialistCredentialsSubmitSuccess =>
      'Isekla-s ttwaznen. Aseɣwen-ik yettwaseɣreg.';

  @override
  String get specialistCredentialsUploadFailed => 'Asali yecceḍ. Ɛreḍ ticki.';

  @override
  String get specialistCredentialTypeDiploma => 'Aselmad';

  @override
  String get specialistCredentialTypeCouncilCard => 'Takarit n tɣemmas';

  @override
  String get specialistCredentialTypeSpecialtyCert => 'Aselmad n umeẓlu';

  @override
  String get specialistCredentialTypeOther => 'Wayeḍ';

  @override
  String get specialistCredentialStatusPending => 'Yettṛaju';

  @override
  String get specialistCredentialStatusApproved => 'Yettwaqbel';

  @override
  String get specialistCredentialStatusRejected => 'Yettwaɣel';

  @override
  String get specialistTabInbox => 'Isuter';

  @override
  String get specialistTabCalendar => 'Awitay';

  @override
  String get specialistTabMessages => 'Iznan';

  @override
  String get specialistTabProfile => 'Amaɣnu';

  @override
  String get specialistTabStats => 'Tiddin';

  @override
  String get specialistShellPlaceholder => 'Yettwalien';

  @override
  String get specialistScheduleTitle => 'Awitay-iw';

  @override
  String get specialistScheduleTabTemplates => 'Isragen';

  @override
  String get specialistScheduleTabExceptions => 'Tilyaṭin';

  @override
  String get specialistScheduleTabPreview => 'Taskant';

  @override
  String get specialistScheduleAddWindow => 'Rnu tarrayt';

  @override
  String get specialistScheduleEditWindow => 'Senfel tarrayt';

  @override
  String get specialistScheduleSaveWindow => 'Sekles tarrayt';

  @override
  String get specialistScheduleSaveSuccess => 'Awitay yettwasekles.';

  @override
  String get specialistScheduleStartTime => 'Akud n tnekra';

  @override
  String get specialistScheduleEndTime => 'Akud n taggara';

  @override
  String get specialistScheduleSlotDuration => 'Tanzagt n umeẓlu';

  @override
  String specialistScheduleSlotMinutes(int minutes) {
    return '$minutes n tesdatin';
  }

  @override
  String get specialistScheduleMode => 'Aɣanib n uselmen';

  @override
  String get specialistScheduleModeInPerson => 'S udem';

  @override
  String get specialistScheduleModeTelehealth => 'S usrid';

  @override
  String get specialistScheduleModeBoth => 'Sin';

  @override
  String get specialistScheduleActive => 'Tarrayt turmidt';

  @override
  String get specialistScheduleActiveHint =>
      'Asens yekkes tarrayt mi ara tsekles.';

  @override
  String get specialistScheduleInactive => 'Ur turmid ara';

  @override
  String get specialistScheduleNoWindowsTitle => 'Ulac tarrayt';

  @override
  String get specialistScheduleNoWindowsBody =>
      'Rnu isragen n uselmen i wass-a.';

  @override
  String get specialistScheduleDeleteWindowTitle => 'Kkes tarrayt-a?';

  @override
  String get specialistScheduleDeleteWindowBody =>
      'Imeẓlan yettwagenren seg tarrayt-a ur dɣin ara.';

  @override
  String get specialistScheduleAddException => 'Rnu tilya';

  @override
  String get specialistScheduleExceptionDates => 'Akud';

  @override
  String get specialistSchedulePickDates => 'Fren';

  @override
  String get specialistScheduleExceptionKind => 'Anaw';

  @override
  String get specialistScheduleExceptionVacation => 'Asikel';

  @override
  String get specialistScheduleExceptionSick => 'Aẓẓa';

  @override
  String get specialistScheduleExceptionBlocked => 'Ur yezmir ara';

  @override
  String get specialistScheduleExceptionExtra => 'Tilya';

  @override
  String get specialistScheduleExceptionNote => 'Tazmilt (ma yella)';

  @override
  String get specialistScheduleExceptionSaved => 'Tilya tettwasekles.';

  @override
  String specialistScheduleExceptionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count n tilyaṭin',
      one: '1 n tilya',
    );
    return '$_temp0';
  }

  @override
  String get specialistScheduleNoExceptionsTitle => 'Ulac tilyaṭin';

  @override
  String get specialistScheduleNoExceptionsBody =>
      'Ssewḥel ussan i usikel, aẓẓa neɣ ur yezmir ara.';

  @override
  String get specialistSchedulePreviewEmptyTitle => 'Ulac imeẓlan';

  @override
  String get specialistSchedulePreviewEmptyBody =>
      'Sekles isragen-ik u ɛreḍ ticki i wali n yimeẓlan yettwagenren.';

  @override
  String get specialistScheduleLoadError => 'Ur izmir ara ad d-yali awitay.';

  @override
  String get specialistScheduleErrorWeekday =>
      'Ass n umalas ur yelli d ameɣtu.';

  @override
  String get specialistScheduleErrorSlotDuration =>
      'Tanzagt neɣ tarrayt n umeẓlu ur dɣint ara.';

  @override
  String get specialistScheduleErrorMode =>
      'Aɣanib n uselmen ur yelli d ameɣtu.';

  @override
  String get specialistScheduleErrorStartTime =>
      'Akud n tnekra ur yelli d ameɣtu.';

  @override
  String get specialistScheduleErrorEndTime =>
      'Akud n taggara ur yelli d ameɣtu.';

  @override
  String get specialistScheduleErrorStartDate =>
      'Azemz n tnekra ur yelli d ameɣtu.';

  @override
  String get specialistScheduleErrorEndDate =>
      'Azemz n taggara ur yelli d ameɣtu.';

  @override
  String get specialistScheduleErrorKind => 'Anaw n tilya ur yelli d ameɣtu.';

  @override
  String get specialistScheduleErrorNote =>
      'Tazmilt ur ilaq ad teɛeddi 200 n isekkilen.';

  @override
  String get specialistProfileManageSchedule => 'Sefrek awitay-iw';
}
