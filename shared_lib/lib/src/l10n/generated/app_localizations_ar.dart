// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get splashSubtitle => 'من التيه إلى التوجيه الذكي';

  @override
  String get chooseLanguage => 'اختر لغتك';

  @override
  String get continueLabel => 'متابعة';

  @override
  String get skip => 'تخطي';

  @override
  String get next => 'التالي';

  @override
  String get start => 'ابدأ';

  @override
  String get onboardingTitle1 => 'من التيه إلى التوجيه الذكي';

  @override
  String get onboardingTitle2 => 'كيف يعمل؟';

  @override
  String get onboardingTitle3 => 'بياناتكم محمية في الجزائر';

  @override
  String get onboardingBody1 =>
      'انتهى التنقل الطبي العشوائي. الاختصاصي المناسب في الوقت المناسب.';

  @override
  String get onboardingBody2 =>
      'مسار من 4 خطوات: تحديد، فحص، توجيه، إحالة ذكية.';

  @override
  String get onboardingBody3 => 'استضافة محلية ANPDP، تشفير، أطباء معتمدون.';

  @override
  String get welcomeTitle => 'مرحباً';

  @override
  String get welcomeSubtitle => 'رحلتكم الصحية تبدأ هنا';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get loginTitle => 'تسجيل الدخول';

  @override
  String get loginSubtitle => 'سعداء بعودتكم';

  @override
  String get phoneLabel => 'الهاتف';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get confirmPasswordLabel => 'تأكيد كلمة المرور';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get registration => 'التسجيل';

  @override
  String get verification => 'التحقق';

  @override
  String get ninTitle => 'هويتكم';

  @override
  String get ninSubtitle => 'رقم التعريف الوطني (18 رقماً)';

  @override
  String get ninHint => 'موجود على بطاقة الهوية البيومترية';

  @override
  String get phoneTitle => 'رقم هاتفكم';

  @override
  String get phoneSubtitle => 'سنرسل لكم رمز تحقق عبر SMS';

  @override
  String get phoneFormatHint => 'الصيغة: +213 5XX أو 6XX أو 7XX';

  @override
  String get sendCode => 'إرسال الرمز';

  @override
  String get otpTitle => 'أدخل الرمز المستلم';

  @override
  String otpSubtitle(String phone) {
    return 'رمز من 6 أرقام أُرسل إلى $phone';
  }

  @override
  String get ninVerificationPendingBanner =>
      'هويتك قيد التحقق. يمكنك متابعة التسجيل — لا يلزم أي إجراء منك.';

  @override
  String get resendCode => 'إعادة إرسال الرمز';

  @override
  String resendIn(String seconds) {
    return 'إعادة الإرسال خلال 0:$seconds';
  }

  @override
  String get verify => 'تحقق';

  @override
  String get passwordTitle => 'أنشئوا كلمة المرور';

  @override
  String get consentTitle => 'موافقاتكم';

  @override
  String get consentSubtitle => 'وفقاً للقانون الجزائري ANPDP';

  @override
  String get consentHealth => 'معالجة بياناتي الصحية';

  @override
  String get consentData => 'معالجة بياناتي الشخصية';

  @override
  String get consentTerms => 'الشروط وسياسة ANPDP';

  @override
  String get consentMarketing => 'اتصالات تسويقية (اختياري)';

  @override
  String get acceptTerms => 'أوافق على الشروط وسياسة الخصوصية';

  @override
  String get createMyAccount => 'إنشاء حسابي';

  @override
  String get biometricTitle => 'تسجيل الدخول البيومتري';

  @override
  String get biometricSubtitle => 'Face ID أو بصمة للدخول بسرعة';

  @override
  String get enable => 'تفعيل';

  @override
  String get later => 'لاحقاً';

  @override
  String get successTitle => 'مرحباً بكم في GPS Médical !';

  @override
  String get successSubtitle => 'تم إنشاء حسابكم بنجاح.';

  @override
  String get discoverApp => 'اكتشف التطبيق';

  @override
  String get forgotTitle => 'استعادة الحساب';

  @override
  String get resetTitle => 'كلمة مرور جديدة';

  @override
  String get resetAction => 'إعادة التعيين';

  @override
  String get invalidPhone => 'رقم غير صالح (+213 5/6/7 + 8 أرقام)';

  @override
  String get invalidNin => 'رقم تعريف غير صالح (18 رقماً)';

  @override
  String get passwordsMismatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get requiredConsents => 'يرجى قبول جميع الموافقات الإلزامية';

  @override
  String get networkError => 'خطأ في الشبكة. أعد المحاولة.';

  @override
  String get fullNameTitle => 'اسمكم الكامل';

  @override
  String get fullNameSubtitle => 'كما في الوثائق الرسمية (من 2 إلى 120 حرفًا).';

  @override
  String get fullNameHint => 'الاسم واللقب';

  @override
  String get invalidFullName => 'اسم غير صالح (من 2 إلى 120 حرفًا).';

  @override
  String get errorInvalidCredentials =>
      'بيانات الاعتماد غير صحيحة. يرجى التحقق من رقم الهاتف وكلمة المرور.';

  @override
  String get errorAccessDenied => 'تم رفض الوصول. لا تملك الصلاحيات الكافية.';

  @override
  String get errorTooManyRequests =>
      'محاولات كثيرة جداً. يرجى إعادة المحاولة بعد بضع دقائق.';

  @override
  String get errorInternalServer =>
      'خطأ داخلي في الخادم. يرجى المحاولة لاحقاً.';

  @override
  String get errorNetworkTimeout =>
      'انتهت مهلة الاتصال. يرجى التحقق من اتصال الإنترنت وإعادة المحاولة.';

  @override
  String get errorNetworkConnection =>
      'تعذر الاتصال بالخادم. يرجى التحقق من اتصال الإنترنت.';

  @override
  String get errorPasswordRequired => 'يرجى إدخال كلمة المرور.';

  @override
  String get bookingAvailabilityTitle => 'اختر موعداً';

  @override
  String get bookingPreviousWeek => 'الأسبوع السابق';

  @override
  String get bookingNextWeek => 'الأسبوع التالي';

  @override
  String bookingSlotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مواعيد',
      one: 'موعد واحد',
      zero: 'لا توجد مواعيد',
    );
    return '$_temp0';
  }

  @override
  String get bookingReserve => 'حجز';

  @override
  String bookingSlotDuration(int minutes) {
    return 'المدة: $minutes د';
  }

  @override
  String get bookingModeInPerson => 'حضوري';

  @override
  String get bookingModeTelehealth => 'استشارة عن بُعد';

  @override
  String get bookingModeAll => 'الكل';

  @override
  String bookingWeekRange(String from, String to) {
    return '$from – $to';
  }

  @override
  String get bookingSelectMode => 'اختر نوع الاستشارة';

  @override
  String bookingLockExpires(String time) {
    return 'الموعد محجوز — ينتهي خلال $time';
  }

  @override
  String get bookingLockExpired => 'انتهت صلاحية حجز الموعد.';

  @override
  String get bookingBack => 'رجوع';

  @override
  String get bookingStepConfirm => 'تأكيد الموعد';

  @override
  String get bookingStepPatient => 'لمن؟';

  @override
  String get bookingStepReview => 'الملخص';

  @override
  String get bookingForMe => 'لنفسي';

  @override
  String get bookingReasonHint => 'سبب الاستشارة (اختياري)';

  @override
  String get bookingSubmit => 'تأكيد الموعد';

  @override
  String get bookingRescheduleSubmit => 'إعادة جدولة الموعد';

  @override
  String get bookingSlotTakenTitle => 'الموعد غير متاح';

  @override
  String get bookingSlotTakenMessage =>
      'تم حجز هذا الموعد للتو. اختر موعداً آخر؟';

  @override
  String get bookingChooseAnotherSlot => 'اختر موعداً آخر';

  @override
  String get bookingOfflineBanner => 'غير متصل — الحجز يتطلب اتصالاً';

  @override
  String get bookingOfflineSubmit => 'الاتصال مطلوب لتأكيد الموعد';

  @override
  String get bookingResumeDraftTitle => 'استئناف الحجز؟';

  @override
  String get bookingResumeDraftMessage =>
      'يوجد حجز قيد التقدم. الاتصال مطلوب لتأكيد الموعد.';

  @override
  String get bookingOnlineRestored => 'تم استعادة الاتصال — يمكنك تأكيد الموعد';

  @override
  String get bookingResume => 'استئناف';

  @override
  String get bookingDiscard => 'تجاهل';

  @override
  String get appointmentsTitle => 'المواعيد';

  @override
  String get appointmentsUpcoming => 'القادمة';

  @override
  String get appointmentsHistory => 'السجل';

  @override
  String get appointmentsEmptyUpcoming => 'لا توجد مواعيد قادمة';

  @override
  String get appointmentsEmptyUpcomingCta => 'البحث عن اختصاصي';

  @override
  String get appointmentsEmptyHistory => 'لا توجد مواعيد سابقة';

  @override
  String get appointmentDetailTitle => 'تفاصيل الموعد';

  @override
  String get appointmentCancel => 'إلغاء';

  @override
  String get appointmentReschedule => 'إعادة الجدولة';

  @override
  String get appointmentCancelReasonHint => 'سبب الإلغاء (اختياري)';

  @override
  String get appointmentConfirmCancel => 'تأكيد الإلغاء';

  @override
  String get appointmentDirections => 'الاتجاهات';

  @override
  String get appointmentJoinTelehealth => 'انضمام';

  @override
  String get appointmentJoinTelehealthHint =>
      'الاستشارة عن بُعد ستكون متاحة في إصدار لاحق.';

  @override
  String get appointmentLeaveReview => 'ترك تقييم';

  @override
  String get appointmentStatusPending => 'قيد الانتظار';

  @override
  String get appointmentStatusConfirmed => 'مؤكد';

  @override
  String get appointmentStatusCancelled => 'ملغى';

  @override
  String get appointmentStatusCompleted => 'مكتمل';

  @override
  String get appointmentStatusNoShow => 'غائب';

  @override
  String get appointmentPaymentUnpaid => 'غير مدفوع';

  @override
  String get appointmentPaymentDeposit => 'عربون مدفوع';

  @override
  String get appointmentPaymentPaid => 'مدفوع';

  @override
  String get appointmentPaymentRefunded => 'مسترد';

  @override
  String get bookingLoadError => 'تعذر تحميل المواعيد.';

  @override
  String get appointmentsLoadError => 'تعذر تحميل المواعيد.';

  @override
  String get appointmentDetailLoadError => 'تعذر تحميل تفاصيل الموعد.';

  @override
  String get bookingFeeLabel => 'الأتعاب';

  @override
  String get bookingSummaryDoctor => 'الطبيب';

  @override
  String get bookingSummarySlot => 'الموعد';

  @override
  String get bookingSummaryPatient => 'المريض';

  @override
  String get bookingSummaryReason => 'السبب';

  @override
  String get errorGenericTitle => 'خطأ';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get specialtiesEmpty => 'لم يتم العثور على أي تخصص.';

  @override
  String get specialtiesLoadError => 'تعذر تحميل التخصصات.';

  @override
  String specialtiesPickerParentAll(String name) {
    return 'كل $name';
  }

  @override
  String get geoWilayaPickerTitle => 'اختر الولاية';

  @override
  String get geoCommunePickerTitle => 'اختر البلدية';

  @override
  String get geoClear => 'مسح';

  @override
  String get geoSearchWilayaHint => 'ابحث عن ولاية…';

  @override
  String get geoSearchCommuneHint => 'ابحث عن بلدية…';

  @override
  String get geoWilayaEmpty => 'لم يتم العثور على ولاية.';

  @override
  String get geoCommuneEmpty => 'لم يتم العثور على بلدية.';

  @override
  String get geoWilayasLoadError => 'تعذر تحميل الولايات.';

  @override
  String get geoCommunesLoadError => 'تعذر تحميل البلديات.';

  @override
  String get geoUseWilayaCenter => 'استخدام مركز الولاية';

  @override
  String get discoveryAppBarTitle => 'MedNavigator';

  @override
  String get discoveryRecommendedTitle => 'أخصائيون موصى بهم';

  @override
  String get discoveryViewList => 'قائمة';

  @override
  String get discoveryViewMap => 'خريطة';

  @override
  String get discoveryDoctorsEmptyTitle => 'لم يتم العثور على طبيب';

  @override
  String get discoveryDoctorsEmptyMessage =>
      'لا يوجد أخصائي مطابق في الوقت الحالي.';

  @override
  String get discoverySearchAction => 'بحث';

  @override
  String get discoveryDoctorsLoadError => 'تعذر تحميل قائمة الأخصائيين.';

  @override
  String get discoveryRateLimitTitle => 'طلبات كثيرة جداً';

  @override
  String discoveryRateLimitMessage(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'يرجى الانتظار # ثوانٍ قبل إعادة المحاولة.',
      one: 'يرجى الانتظار ثانية واحدة قبل إعادة المحاولة.',
    );
    return '$_temp0';
  }

  @override
  String get doctorTitleDefault => 'د.';

  @override
  String get doctorLanguageArabic => 'العربية';

  @override
  String get doctorLanguageFrench => 'الفرنسية';

  @override
  String get doctorLanguageEnglish => 'الإنجليزية';

  @override
  String get doctorLanguageTamazight => 'الأمازيغية';

  @override
  String get doctorCardBookCta => 'حجز موعد';

  @override
  String get doctorCardTelehealth => 'استشارة عن بُعد';

  @override
  String get doctorCardVerifiedBadge => 'معتمد';

  @override
  String doctorCardMatchPercent(int percent) {
    return '$percent% توافق';
  }

  @override
  String get searchHint => 'ابحث عن طبيب أو تخصص…';

  @override
  String get searchEmptyTitle => 'لا يوجد طبيب مطابق';

  @override
  String get searchEmptyMessage => 'هل تريد توسيع المنطقة أو تعديل الفلاتر؟';

  @override
  String get searchClearFilters => 'مسح الفلاتر';

  @override
  String get searchLoadError => 'حدث خطأ أثناء البحث.';

  @override
  String get searchSuggestionsEmpty => 'لا توجد اقتراحات.';

  @override
  String get searchSuggestionsLoadError => 'تعذر تحميل الاقتراحات.';

  @override
  String get searchSuggestionsSpecialties => 'التخصصات';

  @override
  String get searchSuggestionsDoctors => 'الأطباء';

  @override
  String get searchSuggestionsLocations => 'المواقع';

  @override
  String get searchFiltersTitle => 'فلاتر البحث';

  @override
  String get searchFiltersReset => 'إعادة الضبط';

  @override
  String get searchFiltersApply => 'تطبيق الفلاتر';

  @override
  String get searchFilterSpecialty => 'التخصص';

  @override
  String get searchFilterSpecialtyAll => 'كل التخصصات';

  @override
  String get searchFilterLocation => 'الموقع (ولاية / بلدية)';

  @override
  String get searchFilterLocationAll => 'كل الجزائر';

  @override
  String get searchFilterGender => 'الجنس';

  @override
  String get searchFilterGenderAny => 'الكل';

  @override
  String get searchFilterGenderMale => 'ذكر';

  @override
  String get searchFilterGenderFemale => 'أنثى';

  @override
  String get searchFilterLanguages => 'اللغات المتحدثة';

  @override
  String get searchFilterMaxFee => 'الحد الأقصى للأتعاب';

  @override
  String searchFilterMaxFeeValue(int fee) {
    return '$fee دج';
  }

  @override
  String get searchFilterAvailability => 'التوفر';

  @override
  String get searchFilterAvailabilityAll => 'الكل';

  @override
  String get searchFilterAvailabilityToday => 'اليوم';

  @override
  String get searchFilterAvailability3Days => '3 أيام';

  @override
  String get searchFilterAvailability1Week => 'أسبوع';

  @override
  String get searchFilterAvailability1Month => 'شهر';

  @override
  String get searchFilterTelehealth => 'استشارة عن بُعد متاحة';

  @override
  String get searchFilterInsurance => 'التأمينات المقبولة';

  @override
  String get searchFilterInsuranceCnas => 'مقبول CNAS';

  @override
  String get searchFilterInsuranceCasnos => 'مقبول CASNOS';

  @override
  String get searchFilterSort => 'ترتيب حسب';

  @override
  String get searchFilterSortRelevance => 'الأكثر صلة';

  @override
  String get searchFilterSortRating => 'أعلى تقييم';

  @override
  String get searchFilterSortFeeAsc => 'أتعاب تصاعدية';

  @override
  String get searchFilterSortFeeDesc => 'أتعاب تنازلية';

  @override
  String get searchFilterSortDistance => 'المسافة تصاعدياً';

  @override
  String get doctorDetailTitle => 'ملف الأخصائي';

  @override
  String get doctorDetailBioTitle => 'السيرة الذاتية';

  @override
  String get doctorDetailBioEmpty => 'لا توجد سيرة ذاتية.';

  @override
  String get doctorDetailBioExpand => 'قراءة المزيد';

  @override
  String get doctorDetailBioCollapse => 'عرض أقل';

  @override
  String get doctorDetailFeeTitle => 'أتعاب الاستشارة';

  @override
  String get doctorDetailFeeInPerson => 'استشارة في العيادة';

  @override
  String doctorDetailFeeValue(int fee) {
    return '$fee دج';
  }

  @override
  String get doctorDetailLanguagesTitle => 'اللغات المتحدثة';

  @override
  String get doctorDetailLanguagesEmpty => 'غير محدد';

  @override
  String get doctorDetailAddressTitle => 'عنوان العيادة';

  @override
  String get doctorDetailMapUnavailable => 'الخريطة غير متاحة';

  @override
  String get doctorDetailReviewsTitle => 'آراء المرضى';

  @override
  String get doctorDetailReviewsEmpty => 'لا توجد آراء حالياً.';

  @override
  String get doctorDetailReviewsLoadMore => 'عرض المزيد';

  @override
  String get doctorDetailVerifiedPatient => 'مريض موثّق';

  @override
  String get doctorDetailBookCta => 'حجز';

  @override
  String get doctorDetailTelehealthCta => 'استشارة عن بُعد';

  @override
  String get doctorDetailNotFoundTitle => 'الطبيب غير موجود';

  @override
  String get doctorDetailNotFoundMessage => 'ملف هذا الأخصائي غير متاح.';

  @override
  String get doctorDetailLoadError => 'تعذر تحميل ملف الأخصائي.';

  @override
  String get mapNearbyTitle => 'الأطباء القريبون';

  @override
  String get mapNearbyLoadErrorTitle => 'خطأ في التحميل';

  @override
  String get mapNearbyLoadErrorMessage => 'حدث خطأ أثناء تحميل الخريطة.';

  @override
  String get mapNearbyPermissionBanner =>
      'اسمح بالوصول إلى موقعك لعرض الأطباء من حولك.';

  @override
  String get mapNearbyPermissionRationaleTitle => 'الوصول إلى الموقع';

  @override
  String get mapNearbyPermissionRationaleBody =>
      'يستخدم MedNavigator موقعك لعرض الأخصائيين القريبين. يمكنك أيضاً اختيار ولاية يدوياً.';

  @override
  String get mapNearbyPermissionRationaleContinue => 'متابعة';

  @override
  String get mapNearbyPermissionRationaleCancel => 'إلغاء';

  @override
  String get mapNearbyPermissionAllow => 'السماح';

  @override
  String get mapNearbyChooseWilaya => 'اختيار ولاية';

  @override
  String get mapNearbyMyLocation => 'موقعي';

  @override
  String get mapNearbyEdit => 'تعديل';

  @override
  String get mapNearbyWilayaSearch => 'البحث حسب الولاية';

  @override
  String mapNearbyWilayaSearchNamed(String wilaya) {
    return 'البحث حسب الولاية ($wilaya)';
  }

  @override
  String mapNearbyLocationComma(String commune, String wilaya) {
    return '$commune، $wilaya';
  }

  @override
  String get mapNearbyRadiusLabel => 'نطاق البحث:';

  @override
  String mapNearbyRadiusValue(String radius) {
    return '$radius كم';
  }

  @override
  String mapNearbyClusterCount(int count) {
    return '$count طبيب';
  }

  @override
  String get mapNearbyChooseWilayaTooltip => 'اختيار ولاية';

  @override
  String get mapNearbySpecialtyTitle => 'اختيار تخصص';

  @override
  String get mapNearbySpecialtyClear => 'مسح';

  @override
  String get profileTitle => 'ملفي الشخصي';

  @override
  String get profileEdit => 'تعديل';

  @override
  String get profileSave => 'حفظ';

  @override
  String get profileAccount => 'الحساب';

  @override
  String get profileSignOut => 'تسجيل الخروج';

  @override
  String get profileFullName => 'الاسم الكامل';

  @override
  String get profilePhone => 'الهاتف';

  @override
  String get profileEmail => 'البريد الإلكتروني';

  @override
  String get profileBirthDate => 'تاريخ الميلاد';

  @override
  String get profileGender => 'الجنس';

  @override
  String get profileBloodType => 'فصيلة الدم';

  @override
  String get profileAddress => 'العنوان';

  @override
  String get profileAddressLine1 => 'الشارع والرقم';

  @override
  String get profileAddressLine2 => 'تفاصيل إضافية';

  @override
  String get profilePostalCode => 'الرمز البريدي';

  @override
  String get profileAllergies => 'الحساسية';

  @override
  String get profileChronicConditions => 'الأمراض المزمنة';

  @override
  String get profileInsurance => 'التأمين';

  @override
  String get profileInsuranceProvider => 'الجهة';

  @override
  String get profileInsuranceNumber => 'رقم التأمين';

  @override
  String get profileNotSet => 'غير محدد';

  @override
  String get profileReadOnlyField => 'غير قابل للتعديل';

  @override
  String get profileGenderMale => 'ذكر';

  @override
  String get profileGenderFemale => 'أنثى';

  @override
  String get profileGenderOther => 'آخر';

  @override
  String get profileInsuranceCnas => 'CNAS';

  @override
  String get profileInsuranceCasnos => 'CASNOS';

  @override
  String get profileInsuranceNone => 'لا يوجد';

  @override
  String get profileInsurancePrivate => 'خاص';

  @override
  String get profilePickBirthDate => 'اختر تاريخاً';

  @override
  String get profilePickAddress => 'اختر الولاية والبلدية';

  @override
  String get profileTagHint => 'اكتب ثم Enter';

  @override
  String get profileAddTag => 'إضافة';

  @override
  String get profileInvalidEmail => 'بريد إلكتروني غير صالح';

  @override
  String get profileInvalidBirthDate =>
      'لا يمكن أن يكون تاريخ الميلاد في المستقبل';

  @override
  String get profileLoadError => 'تعذر تحميل الملف الشخصي';

  @override
  String get profileSaveError => 'تعذر الحفظ';

  @override
  String get profileDeleteAccount => 'حذف حسابي';

  @override
  String get profileDeleteTitle => 'حذف حسابك؟';

  @override
  String get profileDeleteWarning =>
      'سيؤدي هذا إلى جدولة الحذف النهائي لحسابك وبياناتك الشخصية.';

  @override
  String get profileDeleteGracePeriod =>
      'لديك 30 يوماً لإلغاء الحذف بتسجيل الدخول مجدداً.';

  @override
  String get profileDeleteConfirm => 'نعم، احذف حسابي';

  @override
  String get profileDeleteFinalTitle => 'تأكيد نهائي';

  @override
  String get profileDeleteFinalMessage =>
      'هل أنت متأكد تماماً؟ سيتم جدولة حذف حسابك.';

  @override
  String get profileDeleteSuccess => 'تم جدولة حذف الحساب';

  @override
  String get profileDeleteError => 'تعذر الحذف';

  @override
  String get profileConsents => 'موافقات ANPDP';

  @override
  String get consentManagementTitle => 'موافقاتي';

  @override
  String consentVersionLabel(String version) {
    return 'الإصدار $version';
  }

  @override
  String consentGrantedAtLabel(String date) {
    return 'تمت الموافقة في $date';
  }

  @override
  String consentRevokedAtLabel(String date) {
    return 'تم السحب في $date';
  }

  @override
  String get consentActive => 'نشط';

  @override
  String get consentRevoked => 'مسحوب';

  @override
  String get consentRevokeEssential => 'سحب موافقتي';

  @override
  String get consentRevokeEssentialTitle => 'سحب موافقة أساسية؟';

  @override
  String get consentRevokeEssentialMessage =>
      'سحب موافقة أساسية سيؤدي إلى تعليق حسابك. لن تتمكن من استخدام التطبيق حتى إعادة تفعيل الحساب.';

  @override
  String get consentRevokeEssentialConfirm => 'سحب وتعليق';

  @override
  String get consentRevokeError => 'تعذر سحب الموافقة';

  @override
  String get consentRevokedLandingTitle => 'الحساب معلّق';

  @override
  String get consentRevokedLandingMessage =>
      'لقد سحبت موافقة أساسية. تم تعليق حسابك وفقاً لقوانين ANPDP.';

  @override
  String get consentRevokedLandingAction => 'العودة إلى الصفحة الرئيسية';

  @override
  String get dependentsTitle => 'المعالون';

  @override
  String get dependentsAdd => 'إضافة معال';

  @override
  String get dependentsEdit => 'تعديل المعال';

  @override
  String get dependentsEmpty => 'لا يوجد معالون مسجلون';

  @override
  String get dependentsDeleteTitle => 'حذف هذا المعال؟';

  @override
  String get dependentsDeleteMessage =>
      'هذا الإجراء نهائي. المواعيد السابقة تبقى مرتبطة بهذا الشخص.';

  @override
  String get dependentsDeleteConfirm => 'حذف';

  @override
  String get dependentFullName => 'الاسم الكامل';

  @override
  String get dependentRelation => 'صلة القرابة';

  @override
  String get dependentBirthDate => 'تاريخ الميلاد';

  @override
  String get dependentGender => 'الجنس';

  @override
  String get dependentRelationChild => 'طفل';

  @override
  String get dependentRelationSpouse => 'زوج/ة';

  @override
  String get dependentRelationParent => 'والد/ة';

  @override
  String get dependentRelationOther => 'آخر';

  @override
  String dependentAgeYears(int age) {
    return '$age سنة';
  }

  @override
  String get dependentSaveError => 'تعذر الحفظ';

  @override
  String get dependentDeleteError => 'تعذر الحذف';

  @override
  String get medicalRecordsTitle => 'السجل الطبي';

  @override
  String get medicalRecordsEmpty => 'لا توجد وثائق';

  @override
  String get medicalRecordsLoadError => 'تعذر تحميل الوثائق';

  @override
  String get medicalRecordsFilterAll => 'الكل';

  @override
  String get medicalRecordTypePrescription => 'وصفة طبية';

  @override
  String get medicalRecordTypeReport => 'تقرير';

  @override
  String get medicalRecordTypeLabResult => 'تحليل';

  @override
  String get medicalRecordTypeImaging => 'تصوير';

  @override
  String get medicalRecordTypeCertificate => 'شهادة';

  @override
  String get medicalRecordTypeOther => 'أخرى';

  @override
  String get medicalRecordAuthorPatient => 'مريض';

  @override
  String get medicalRecordAuthorSpecialist => 'طبيب';

  @override
  String get medicalRecordAuthorConcierge => 'كونسيرج';

  @override
  String get medicalRecordViewerPlaceholder => 'ستتوفر معاينة الوثيقة قريباً.';

  @override
  String medicalRecordFileSizeBytes(int size) {
    return '$size بايت';
  }

  @override
  String medicalRecordFileSizeKb(String size) {
    return '$size ك.ب';
  }

  @override
  String medicalRecordFileSizeMb(String size) {
    return '$size م.ب';
  }

  @override
  String get medicalRecordsUpload => 'إضافة وثيقة';

  @override
  String get medicalRecordsUploadAddCamera => 'الكاميرا';

  @override
  String get medicalRecordsUploadAddGallery => 'المعرض';

  @override
  String get medicalRecordsUploadAddFiles => 'ملفات PDF';

  @override
  String get medicalRecordUploadType => 'نوع الوثيقة';

  @override
  String get medicalRecordUploadTitle => 'العنوان (اختياري)';

  @override
  String get medicalRecordUploadNotes => 'ملاحظات (اختياري)';

  @override
  String get medicalRecordUploadPatient => 'المريض المعني';

  @override
  String get medicalRecordUploadSubmit => 'رفع';

  @override
  String medicalRecordUploadMaxFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'بحد أقصى # ملفات لكل رفع',
      one: 'بحد أقصى ملف واحد لكل رفع',
    );
    return '$_temp0';
  }

  @override
  String get medicalRecordUploadFileTooLarge =>
      'يجب ألا يتجاوز حجم كل ملف 20 ميغابايت.';

  @override
  String get medicalRecordUploadInvalidMime =>
      'الصيغ المقبولة: PDF أو JPEG أو PNG فقط.';

  @override
  String get medicalRecordUploadTypeRequired => 'اختر نوع الوثيقة.';

  @override
  String get medicalRecordUploadNoFiles => 'أضف ملفاً واحداً على الأقل.';

  @override
  String get medicalRecordUploadStorageUnavailable =>
      'خدمة الملفات غير متاحة مؤقتاً. حاول لاحقاً.';

  @override
  String get medicalRecordUploadCancel => 'إلغاء';

  @override
  String get medicalRecordUploadSuccess => 'تمت إضافة الوثيقة';

  @override
  String get medicalRecordUploadFailed => 'فشل الرفع';

  @override
  String get medicalRecordDownload => 'تنزيل';

  @override
  String get medicalRecordShare => 'مشاركة';

  @override
  String get medicalRecordDownloadSuccess => 'تم حفظ الملف في التنزيلات';

  @override
  String get medicalRecordViewerLoadError => 'تعذر فتح الوثيقة';

  @override
  String get medicalRecordDeleteTitle => 'حذف هذه الوثيقة؟';

  @override
  String get medicalRecordDeleteMessage =>
      'هذا الإجراء نهائي. سيتم إزالة الملف من سجلك.';

  @override
  String get medicalRecordDeleteConfirm => 'حذف';

  @override
  String get medicalRecordDeleteError => 'تعذر الحذف';

  @override
  String get messagingTitle => 'المراسلة';

  @override
  String get messagingEmpty => 'لا توجد محادثات حالياً';

  @override
  String get messagingLoadError => 'تعذر تحميل المحادثات';

  @override
  String get messagingAttachmentPreview => 'مرفق';

  @override
  String get messagingThreadPlaceholder => 'المحادثة — التفاصيل قريباً';

  @override
  String get messagingComposerHint => 'اكتب رسالة…';

  @override
  String get messagingSend => 'إرسال';

  @override
  String get messagingAttach => 'إرفاق وثيقة';

  @override
  String get messagingPickAttachments => 'اختر الوثائق';

  @override
  String get messagingAttachConfirm => 'إرفاق المحدد';

  @override
  String get messagingMessagePending => 'جارٍ الإرسال…';

  @override
  String get messagingMessageSent => 'مُرسل';

  @override
  String get messagingMessageRead => 'مقروء';

  @override
  String get messagingSendError => 'فشل الإرسال';

  @override
  String get messagingLoadMessagesError => 'تعذر تحميل الرسائل';

  @override
  String get notificationsTitle => 'الإشعارات';

  @override
  String get notificationsEmpty => 'لا توجد إشعارات';

  @override
  String get notificationsLoadError => 'تعذر تحميل الإشعارات';

  @override
  String get notificationsMarkAllRead => 'تعليم الكل كمقروء';

  @override
  String get notificationsPreferences => 'التفضيلات';

  @override
  String get notificationsPreferencesTitle => 'تفضيلات الإشعارات';

  @override
  String get notificationsPrefPush => 'إشعارات الدفع';

  @override
  String get notificationsPrefSms => 'رسائل SMS';

  @override
  String get notificationsPrefEmail => 'البريد الإلكتروني';

  @override
  String get notificationsPrefAppointmentReminders => 'تذكيرات المواعيد';

  @override
  String get notificationsPrefMarketing => 'العروض والأخبار';

  @override
  String get notificationsPrefReminderHours => 'التذكير قبل الموعد';

  @override
  String notificationsPrefReminderHoursValue(int hours) {
    return 'قبل $hours ساعة';
  }

  @override
  String get notificationsPrefSaveError => 'تعذر الحفظ';

  @override
  String get reviewCreateTitle => 'ترك تقييم';

  @override
  String get reviewRatingLabel => 'التقييم';

  @override
  String get reviewCommentLabel => 'تعليق (اختياري)';

  @override
  String get reviewCommentHint => 'شارك تجربتك…';

  @override
  String get reviewSubmit => 'إرسال';

  @override
  String get reviewSubmitError => 'تعذر إرسال التقييم.';

  @override
  String get reviewRatingRequired => 'يرجى اختيار تقييم.';

  @override
  String reviewCommentTooLong(int max) {
    return 'يجب ألا يتجاوز التعليق $max حرفًا.';
  }

  @override
  String get reviewConfirmationTitle => 'شكرًا على تقييمك';

  @override
  String get reviewConfirmationBody =>
      'تقييمك قيد المراجعة. سيتم نشره بعد التحقق من فريقنا، عادةً خلال 48 ساعة.';

  @override
  String get reviewConfirmationStatusPending => 'قيد المراجعة';

  @override
  String get reviewAlreadySubmitted => 'لقد تركت تقييمًا بالفعل';

  @override
  String get reviewDelete => 'حذف تقييمي';

  @override
  String get reviewDeleteConfirm => 'حذف هذا التقييم؟';

  @override
  String get reviewDeleteSuccess => 'تم حذف التقييم.';

  @override
  String get reviewDeleteError => 'تعذر حذف التقييم.';

  @override
  String get reviewDeleteExpired => 'لا يمكن الحذف بعد 7 أيام.';

  @override
  String get reviewAlreadyExistsError => 'يوجد تقييم بالفعل لهذا الموعد.';

  @override
  String get reviewNotEligibleError => 'لا يمكن نشر تقييم لهذا الموعد.';

  @override
  String get reviewBackToAppointment => 'العودة إلى الموعد';

  @override
  String reviewStarsLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count نجوم',
      one: 'نجمة واحدة',
    );
    return '$_temp0';
  }

  @override
  String get paymentDepositTitle => 'دفع العربون';

  @override
  String paymentDepositBody(int amount) {
    return 'مطلوب عربون بقيمة $amount دج لتأكيد هذا الموعد.';
  }

  @override
  String get paymentDepositCta => 'دفع العربون';

  @override
  String paymentDepositAmountLabel(int amount) {
    return '$amount دج';
  }

  @override
  String get paymentDepositProviderStripeTest => 'وضع الاختبار (sandbox)';

  @override
  String get paymentDepositSandboxHint => 'يتم محاكاة الدفع في بيئة الاختبار.';

  @override
  String get paymentDepositSuccess => 'تم الدفع بنجاح. تم تحديث موعدك.';

  @override
  String get paymentDepositFailed => 'فشل الدفع.';

  @override
  String get paymentDepositNotEligible => 'هذا الموعد غير مؤهل للدفع.';

  @override
  String get specialistVerificationPendingTitle => 'الملف قيد المراجعة';

  @override
  String get specialistVerificationPendingBody =>
      'ملفك قيد التحقق من قبل فريقنا. ستتلقى إشعارًا عند اتخاذ القرار.';

  @override
  String get specialistVerificationMoreInfoTitle => 'معلومات إضافية مطلوبة';

  @override
  String get specialistVerificationMoreInfoBody =>
      'يحتاج فريقنا إلى مستندات أو توضيحات إضافية قبل اعتماد ملفك.';

  @override
  String get specialistVerificationRejectedTitle => 'تم رفض الملف';

  @override
  String get specialistVerificationRejectedBody =>
      'تعذّر اعتماد ملفك. راجع الرسالة أدناه وأعد إرسال المستندات إذا لزم الأمر.';

  @override
  String get specialistVerificationSubmitCta => 'إرسال مستنداتي';

  @override
  String get specialistVerificationResubmitCta => 'إعادة إرسال مستنداتي';

  @override
  String get specialistVerificationCompleteProfileCta => 'إكمال ملفي';

  @override
  String get specialistVerificationRefreshCta => 'تحديث الحالة';

  @override
  String get specialistVerificationRefreshLoading => 'جاري التحقق…';

  @override
  String get specialistVerificationRefreshCompleted => 'اكتمل التحقق';

  @override
  String get specialistVerificationRefreshFailed => 'فشل التحقق. أعد المحاولة.';

  @override
  String specialistVerificationLastChecked(String timestamp) {
    return 'آخر تحقق: $timestamp';
  }

  @override
  String get specialistProfileEditTitle => 'تعديل ملفي';

  @override
  String get specialistProfileSaveChanges => 'حفظ التعديلات';

  @override
  String get specialistProfileSectionInfo => 'المعلومات';

  @override
  String get specialistProfileSectionSpecialties => 'التخصصات';

  @override
  String get specialistProfileSectionLanguages => 'اللغات المتحدثة';

  @override
  String get specialistProfileSectionConsultation => 'الاستشارة';

  @override
  String get specialistProfileSectionPractice => 'مكان الممارسة';

  @override
  String get specialistProfileTitle => 'اللقب';

  @override
  String get specialistProfileBio => 'السيرة الذاتية';

  @override
  String get specialistProfilePhotoUrl => 'رابط الصورة';

  @override
  String get specialistProfileSelectSpecialty => 'التخصص الرئيسي';

  @override
  String get specialistProfileFee => 'سعر الاستشارة (دج)';

  @override
  String get specialistProfileCnas => 'متعاقد CNAS';

  @override
  String get specialistProfileCasnos => 'متعاقد CASNOS';

  @override
  String get specialistProfileTelehealth => 'استشارة عن بُعد متاحة';

  @override
  String get specialistProfileConfirmationPolicy => 'سياسة التأكيد';

  @override
  String get specialistProfilePolicyManual => 'يدوي';

  @override
  String get specialistProfilePolicyAuto => 'تلقائي';

  @override
  String get specialistProfileBookingWindow => 'نافذة الحجز (أيام)';

  @override
  String get specialistProfileAddressLine1 => 'العنوان';

  @override
  String get specialistProfileAddressLine2 => 'تفاصيل إضافية';

  @override
  String get specialistProfileVerifiedBadge => 'حساب موثّق';

  @override
  String get specialistProfileUnverifiedBadge => 'غير موثّق';

  @override
  String get specialistCredentialsTitle => 'المستندات المهنية';

  @override
  String get specialistCredentialsSubtitle =>
      'أدخل رقم نقابة الأطباء وارفع diplômes أو بطاقاتك (PDF، JPEG، PNG — 10 ميغا كحد أقصى).';

  @override
  String get specialistCredentialsCouncilNumber => 'رقم نقابة الأطباء';

  @override
  String get specialistCredentialsCouncilRequired => 'رقم نقابة الأطباء مطلوب.';

  @override
  String get specialistCredentialsType => 'نوع المستند';

  @override
  String get specialistCredentialsAddFile => 'إضافة ملف';

  @override
  String get specialistCredentialsNoFiles => 'أضف مستندًا واحدًا على الأقل.';

  @override
  String get specialistCredentialsSubmit => 'إرسال للتحقق';

  @override
  String get specialistCredentialsExisting => 'المستندات المرسلة مسبقًا';

  @override
  String get specialistCredentialsSubmitSuccess =>
      'تم إرسال المستندات. ملفك قيد المراجعة.';

  @override
  String get specialistCredentialsUploadFailed => 'فشل الرفع. حاول مرة أخرى.';

  @override
  String get specialistCredentialTypeDiploma => 'شهادة';

  @override
  String get specialistCredentialTypeCouncilCard => 'بطاقة النقابة';

  @override
  String get specialistCredentialTypeSpecialtyCert => 'شهادة تخصص';

  @override
  String get specialistCredentialTypeOther => 'أخرى';

  @override
  String get specialistCredentialStatusPending => 'قيد الانتظار';

  @override
  String get specialistCredentialStatusApproved => 'موافق عليه';

  @override
  String get specialistCredentialStatusRejected => 'مرفوض';

  @override
  String get specialistTabInbox => 'الطلبات';

  @override
  String get specialistTabCalendar => 'الأجندة';

  @override
  String get specialistTabMessages => 'الرسائل';

  @override
  String get specialistTabProfile => 'الملف';

  @override
  String get specialistTabStats => 'الإحصائيات';

  @override
  String get specialistShellPlaceholder => 'قريبًا';

  @override
  String get specialistScheduleTitle => 'أجندتي';

  @override
  String get specialistScheduleTabTemplates => 'المواعيد';

  @override
  String get specialistScheduleTabExceptions => 'الاستثناءات';

  @override
  String get specialistScheduleTabPreview => 'معاينة';

  @override
  String get specialistScheduleAddWindow => 'إضافة فترة';

  @override
  String get specialistScheduleEditWindow => 'تعديل الفترة';

  @override
  String get specialistScheduleSaveWindow => 'حفظ الفترة';

  @override
  String get specialistScheduleSaveSuccess => 'تم حفظ الأجندة.';

  @override
  String get specialistScheduleStartTime => 'وقت البداية';

  @override
  String get specialistScheduleEndTime => 'وقت النهاية';

  @override
  String get specialistScheduleSlotDuration => 'مدة الموعد';

  @override
  String specialistScheduleSlotMinutes(int minutes) {
    return '$minutes د';
  }

  @override
  String get specialistScheduleMode => 'نوع الاستشارة';

  @override
  String get specialistScheduleModeInPerson => 'حضوري';

  @override
  String get specialistScheduleModeTelehealth => 'عن بُعد';

  @override
  String get specialistScheduleModeBoth => 'كلاهما';

  @override
  String get specialistScheduleActive => 'فترة نشطة';

  @override
  String get specialistScheduleActiveHint =>
      'إلغاء التفعيل يحذف الفترة عند الحفظ.';

  @override
  String get specialistScheduleInactive => 'غير نشطة';

  @override
  String get specialistScheduleNoWindowsTitle => 'لا توجد فترات';

  @override
  String get specialistScheduleNoWindowsBody =>
      'أضف ساعات الاستشارة لهذا اليوم.';

  @override
  String get specialistScheduleDeleteWindowTitle => 'حذف هذه الفترة؟';

  @override
  String get specialistScheduleDeleteWindowBody =>
      'لن تكون المواعيد المولّدة من هذه الفترة متاحة بعد الآن.';

  @override
  String get specialistScheduleAddException => 'إضافة استثناء';

  @override
  String get specialistScheduleExceptionDates => 'الفترة';

  @override
  String get specialistSchedulePickDates => 'اختيار';

  @override
  String get specialistScheduleExceptionKind => 'النوع';

  @override
  String get specialistScheduleExceptionVacation => 'إجازة';

  @override
  String get specialistScheduleExceptionSick => 'مرض';

  @override
  String get specialistScheduleExceptionBlocked => 'غير متاح';

  @override
  String get specialistScheduleExceptionExtra => 'استثناء';

  @override
  String get specialistScheduleExceptionNote => 'ملاحظة (اختياري)';

  @override
  String get specialistScheduleExceptionSaved => 'تم حفظ الاستثناء.';

  @override
  String specialistScheduleExceptionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count استثناءات',
      one: 'استثناء واحد',
    );
    return '$_temp0';
  }

  @override
  String get specialistScheduleNoExceptionsTitle => 'لا استثناءات';

  @override
  String get specialistScheduleNoExceptionsBody =>
      'احجب أيامًا للإجازة أو المرض أو عدم التوفر.';

  @override
  String get specialistSchedulePreviewEmptyTitle => 'لا مواعيد';

  @override
  String get specialistSchedulePreviewEmptyBody =>
      'سجّل فتراتك ثم عد هنا للتحقق من المواعيد المتاحة.';

  @override
  String get specialistScheduleLoadError => 'تعذر تحميل الأجندة.';

  @override
  String get specialistScheduleErrorWeekday => 'يوم الأسبوع غير صالح.';

  @override
  String get specialistScheduleErrorSlotDuration =>
      'مدة أو فاصل الموعد غير صالح.';

  @override
  String get specialistScheduleErrorMode => 'نوع الاستشارة غير صالح.';

  @override
  String get specialistScheduleErrorStartTime => 'وقت البداية غير صالح.';

  @override
  String get specialistScheduleErrorEndTime => 'وقت النهاية غير صالح.';

  @override
  String get specialistScheduleErrorStartDate => 'تاريخ البداية غير صالح.';

  @override
  String get specialistScheduleErrorEndDate => 'تاريخ النهاية غير صالح.';

  @override
  String get specialistScheduleErrorKind => 'نوع الاستثناء غير صالح.';

  @override
  String get specialistScheduleErrorNote =>
      'يجب ألا تتجاوز الملاحظة 200 حرفًا.';

  @override
  String get specialistProfileManageSchedule => 'إدارة أجندتي';

  @override
  String get specialistInboxTabRequests => 'الطلبات';

  @override
  String get specialistInboxTabConfirmed => 'المؤكدة';

  @override
  String get specialistInboxTabHistory => 'السجل';

  @override
  String get specialistInboxEmptyRequests => 'لا توجد طلبات قيد الانتظار';

  @override
  String get specialistInboxEmptyConfirmed => 'لا توجد مواعيد مؤكدة';

  @override
  String get specialistInboxEmptyHistory => 'لا توجد مواعيد سابقة';

  @override
  String get specialistAppointmentDetailTitle => 'تفاصيل الموعد';

  @override
  String get specialistAppointmentPatientAnonymous => 'مريض (هوية مخفية)';

  @override
  String get specialistAppointmentPatientLabel => 'مريض';

  @override
  String specialistAppointmentPatientRef(String ref) {
    return 'مريض ····$ref';
  }

  @override
  String get specialistAppointmentConfirmed => 'تم تأكيد الموعد';

  @override
  String get specialistAppointmentCancelTitle => 'إلغاء الموعد';

  @override
  String get specialistAppointmentStartTelehealth => 'بدء الاستشارة عن بُعد';

  @override
  String get specialistTelehealthComingSoon =>
      'ستتوفر الاستشارة عن بُعد قريبًا.';

  @override
  String get specialistAppointmentViewRecords => 'عرض الملف الطبي';

  @override
  String get specialistAppointmentIssuePrescription => 'كتابة وصفة طبية';

  @override
  String get specialistAppointmentConfirm => 'تأكيد الموعد';

  @override
  String get specialistAppointmentMarkNoShow => 'تسجيل غياب';

  @override
  String get specialistCalendarMonthView => 'شهر';

  @override
  String get specialistCalendarWeekView => 'أسبوع';

  @override
  String get specialistCalendarDayAppointments => 'مواعيد اليوم';

  @override
  String get specialistCalendarEmptyDay => 'لا مواعيد في هذا اليوم';

  @override
  String get specialistCalendarLoadError => 'تعذر تحميل الأجندة.';

  @override
  String get specialistPatientRecordsTitle => 'ملف المريض';

  @override
  String get specialistPatientRecordsEmpty => 'لا توجد مستندات مشتركة';

  @override
  String get specialistPatientRecordsForbidden =>
      'لا توجد مستندات مشتركة معك لهذا المريض';

  @override
  String get specialistPatientRecordsLoadError => 'تعذر تحميل الملف.';

  @override
  String get specialistPrescriptionTitle => 'وصفة طبية';

  @override
  String get specialistPrescriptionDiagnosis => 'التشخيص';

  @override
  String get specialistPrescriptionValidUntil => 'صالحة حتى';

  @override
  String get specialistPrescriptionDrugsSection => 'الأدوية';

  @override
  String specialistPrescriptionDrugNumber(int number) {
    return 'دواء $number';
  }

  @override
  String get specialistPrescriptionAddDrug => 'إضافة دواء';

  @override
  String get specialistPrescriptionDrugName => 'اسم الدواء';

  @override
  String get specialistPrescriptionDosage => 'الجرعة';

  @override
  String get specialistPrescriptionFrequency => 'التكرار';

  @override
  String get specialistPrescriptionDurationDays => 'المدة (أيام)';

  @override
  String get specialistPrescriptionInstructions => 'التعليمات';

  @override
  String get specialistPrescriptionSubmit => 'إصدار الوصفة';

  @override
  String get specialistPrescriptionSuccess => 'تم إصدار الوصفة بنجاح';

  @override
  String get specialistPrescriptionAtLeastOneDrug =>
      'أضف دواءً واحدًا على الأقل';
}
