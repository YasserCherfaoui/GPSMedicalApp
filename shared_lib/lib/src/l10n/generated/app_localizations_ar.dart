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
  String get bookingResumeDraftMessage => 'يوجد حجز قيد التقدم.';

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
    return 'يرجى الانتظار $seconds ثانية قبل إعادة المحاولة.';
  }

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
}
