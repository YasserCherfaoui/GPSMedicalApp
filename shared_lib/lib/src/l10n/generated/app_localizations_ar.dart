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
}
