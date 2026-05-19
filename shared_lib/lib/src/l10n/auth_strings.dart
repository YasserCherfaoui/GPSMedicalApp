import 'package:flutter/material.dart';

import 'app_locale.dart';

/// Auth-flow copy for fr / ar / ber (task 1.16; full ARB in task 1.17).
class AuthStrings {
  const AuthStrings._(this._locale);

  final AppLocale _locale;

  static AuthStrings of(BuildContext context) {
    return Localizations.of<AuthStrings>(context, AuthStrings) ??
        const AuthStrings._(AppLocale.french);
  }

  static const LocalizationsDelegate<AuthStrings> delegate =
      _AuthStringsDelegate();

  String get splashSubtitle => _t(
    fr: 'De l\'errance à l\'orientation intelligente',
    ar: 'من التيه إلى التوجيه الذكي',
    ber: 'Seg usiref ɣer usenfel usligen',
  );

  String get chooseLanguage => _t(
    fr: 'Choisissez votre langue',
    ar: 'اختر لغتك',
    ber: 'Fren tutlayt-ik',
  );

  String get continueLabel => _t(fr: 'Continuer', ar: 'متابعة', ber: 'Kemmel');

  String get skip => _t(fr: 'Passer', ar: 'تخطي', ber: 'Zgel');

  String get next => _t(fr: 'Suivant', ar: 'التالي', ber: 'Uḍfir');

  String get start => _t(fr: 'Commencer', ar: 'ابدأ', ber: 'Bdu');

  String onboardingTitle(int step) => switch (step) {
    1 => _t(
      fr: 'De l\'errance à l\'orientation intelligente',
      ar: 'من التيه إلى التوجيه الذكي',
      ber: 'Seg usiref ɣer usenfel usligen',
    ),
    2 => _t(
      fr: 'Comment ça fonctionne ?',
      ar: 'كيف يعمل؟',
      ber: 'Amek iteddu?',
    ),
    3 => _t(
      fr: 'Vos données, protégées en Algérie',
      ar: 'بياناتكم محمية في الجزائر',
      ber: 'Isefka-nnek ttwakelsen di Dzayer',
    ),
    _ => '',
  };

  String onboardingBody(int step) => switch (step) {
    1 => _t(
      fr: 'Fini le nomadisme médical. Le bon spécialiste, au bon moment.',
      ar: 'انتهى التنقل الطبي العشوائي. الاختصاصي المناسب في الوقت المناسب.',
      ber: 'Yemmut usiref n teddwit. Amussnaw i ilaqen deg wakud i ilaqen.',
    ),
    2 => _t(
      fr: 'Parcours en 4 étapes : localisation, dépistage, coaching, orientation.',
      ar: 'مسار من 4 خطوات: تحديد، فحص، توجيه، إحالة ذكية.',
      ber: 'Abrid s 4 n tikkal: tamlalt, asekcem, acengu, usenfel.',
    ),
    3 => _t(
      fr: 'Hébergement local ANPDP, chiffrement, médecins vérifiés.',
      ar: 'استضافة محلية ANPDP، تشفير، أطباء معتمدون.',
      ber: 'Asekles adigan ANPDP, awgelhen, imussnawen yettwasenqeden.',
    ),
    _ => '',
  };

  String get welcomeTitle => _t(fr: 'Bienvenue', ar: 'مرحباً', ber: 'Ansuf');

  String get welcomeSubtitle => _t(
    fr: 'Votre parcours santé commence ici',
    ar: 'رحلتكم الصحية تبدأ هنا',
    ber: 'Abrid-ik n teddwit yebda da',
  );

  String get createAccount =>
      _t(fr: 'Créer un compte', ar: 'إنشاء حساب', ber: 'Rnu amiḍan');

  String get signIn => _t(fr: 'Se connecter', ar: 'تسجيل الدخول', ber: 'Qqen');

  String get loginTitle =>
      _t(fr: 'Connexion', ar: 'تسجيل الدخول', ber: 'Tuqqna');

  String get loginSubtitle => _t(
    fr: 'Heureux de vous revoir',
    ar: 'سعداء بعودتكم',
    ber: 'Yella yelha ad t-ẓreḍ',
  );

  String get phoneLabel => _t(fr: 'Téléphone', ar: 'الهاتف', ber: 'Tiliɣri');

  String get passwordLabel =>
      _t(fr: 'Mot de passe', ar: 'كلمة المرور', ber: 'Awal uffir');

  String get confirmPasswordLabel => _t(
    fr: 'Confirmer le mot de passe',
    ar: 'تأكيد كلمة المرور',
    ber: 'Sentem awal uffir',
  );

  String get forgotPassword => _t(
    fr: 'Mot de passe oublié ?',
    ar: 'نسيت كلمة المرور؟',
    ber: 'Tettuḍeḍ awal uffir?',
  );

  String get registration =>
      _t(fr: 'Inscription', ar: 'التسجيل', ber: 'Ajerred');

  String get verification =>
      _t(fr: 'Vérification', ar: 'التحقق', ber: 'Asenqed');

  String get ninTitle =>
      _t(fr: 'Votre identité', ar: 'هويتكم', ber: 'Tamagit-ik');

  String get ninSubtitle => _t(
    fr: 'Numéro d\'Identification National (18 chiffres)',
    ar: 'رقم التعريف الوطني (18 رقماً)',
    ber: 'Uṭṭun n tmagit tageldaẓit (18 n yizwilen)',
  );

  String get ninHint => _t(
    fr: 'Visible sur votre carte d\'identité biométrique',
    ar: 'موجود على بطاقة الهوية البيومترية',
    ber: 'Yettban ɣef takaṛḍa-ik n tmagit',
  );

  String get phoneTitle => _t(
    fr: 'Votre numéro de téléphone',
    ar: 'رقم هاتفكم',
    ber: 'Uṭṭun-ik n tiliɣri',
  );

  String get phoneSubtitle => _t(
    fr: 'Nous vous enverrons un code de vérification par SMS',
    ar: 'سنرسل لكم رمز تحقق عبر SMS',
    ber: 'Ad ak-d-nazen tangalt n usenqed s SMS',
  );

  String get phoneFormatHint => _t(
    fr: 'Format : +213 5XX, 6XX ou 7XX',
    ar: 'الصيغة: +213 5XX أو 6XX أو 7XX',
    ber: 'Amasal: +213 5XX, 6XX neɣ 7XX',
  );

  String get sendCode =>
      _t(fr: 'Envoyer le code', ar: 'إرسال الرمز', ber: 'Azen tangalt');

  String get otpTitle => _t(
    fr: 'Entrez le code reçu',
    ar: 'أدخل الرمز المستلم',
    ber: 'Sekcem tangalt i d-tufiḍ',
  );

  String otpSubtitle(String phone) => _t(
    fr: 'Code à 6 chiffres envoyé au $phone',
    ar: 'رمز من 6 أرقام أُرسل إلى $phone',
    ber: 'Tangalt s 6 n yizwilen i d-yettwaznen ɣer $phone',
  );

  String get resendCode => _t(
    fr: 'Renvoyer le code',
    ar: 'إعادة إرسال الرمز',
    ber: 'Ales azen tangalt',
  );

  String resendIn(int seconds) => _t(
    fr: 'Renvoyer dans 0:${seconds.toString().padLeft(2, '0')}',
    ar: 'إعادة الإرسال خلال 0:${seconds.toString().padLeft(2, '0')}',
    ber: 'Ales azen deg 0:${seconds.toString().padLeft(2, '0')}',
  );

  String get verify => _t(fr: 'Vérifier', ar: 'تحقق', ber: 'Senqed');

  String get passwordTitle => _t(
    fr: 'Créez votre mot de passe',
    ar: 'أنشئوا كلمة المرور',
    ber: 'Rnu awal uffir',
  );

  String get consentTitle =>
      _t(fr: 'Vos consentements', ar: 'موافقاتكم', ber: 'Asenqed-ik');

  String get consentSubtitle => _t(
    fr: 'Conformément à la loi algérienne ANPDP',
    ar: 'وفقاً للقانون الجزائري ANPDP',
    ber: 'Akked d uzref n Dzayer ANPDP',
  );

  String get consentHealth => _t(
    fr: 'Traitement de mes données de santé',
    ar: 'معالجة بياناتي الصحية',
    ber: 'Aseqdec n yisefka-iw n teddwit',
  );

  String get consentData => _t(
    fr: 'Traitement de mes données personnelles',
    ar: 'معالجة بياناتي الشخصية',
    ber: 'Aseqdec n yisefka-iw udmawanen',
  );

  String get consentTerms => _t(
    fr: 'Conditions et politique ANPDP',
    ar: 'الشروط وسياسة ANPDP',
    ber: 'Tiwtilin d tsertit ANPDP',
  );

  String get consentMarketing => _t(
    fr: 'Communications marketing (optionnel)',
    ar: 'اتصالات تسويقية (اختياري)',
    ber: 'Aselkem n usuq (yellan)',
  );

  String get acceptTerms => _t(
    fr: 'J\'accepte les CGU et la Politique de confidentialité',
    ar: 'أوافق على الشروط وسياسة الخصوصية',
    ber: 'Qebleɣ tiwtilin d tsertit n tbaḍnit',
  );

  String get createMyAccount =>
      _t(fr: 'Créer mon compte', ar: 'إنشاء حسابي', ber: 'Rnu amiḍan-iw');

  String get biometricTitle => _t(
    fr: 'Connexion biométrique',
    ar: 'تسجيل الدخول البيومتري',
    ber: 'Tuqqna tabiometrit',
  );

  String get biometricSubtitle => _t(
    fr: 'Face ID ou empreinte pour vous connecter plus vite',
    ar: 'Face ID أو بصمة للدخول بسرعة',
    ber: 'Face ID neɣ adsil i tuqqna s zzerb',
  );

  String get enable => _t(fr: 'Activer', ar: 'تفعيل', ber: 'Rmed');

  String get later => _t(fr: 'Plus tard', ar: 'لاحقاً', ber: 'Ticki');

  String get successTitle => _t(
    fr: 'Bienvenue sur GPS Médical !',
    ar: 'مرحباً بكم في GPS Médical !',
    ber: 'Ansuf ɣef GPS Médical !',
  );

  String get successSubtitle => _t(
    fr: 'Votre compte a été créé avec succès.',
    ar: 'تم إنشاء حسابكم بنجاح.',
    ber: 'Amiḍan-ik yettwarnu akken iwata.',
  );

  String get discoverApp => _t(
    fr: 'Découvrir l\'application',
    ar: 'اكتشف التطبيق',
    ber: 'Snirem asnas',
  );

  String get forgotTitle =>
      _t(fr: 'Récupération du compte', ar: 'استعادة الحساب', ber: 'Awi amiḍan');

  String get resetTitle => _t(
    fr: 'Nouveau mot de passe',
    ar: 'كلمة مرور جديدة',
    ber: 'Awal uffir amaynut',
  );

  String get resetAction =>
      _t(fr: 'Réinitialiser', ar: 'إعادة التعيين', ber: 'Ales awennez');

  String get invalidPhone => _t(
    fr: 'Numéro invalide (+213 5/6/7 + 8 chiffres)',
    ar: 'رقم غير صالح (+213 5/6/7 + 8 أرقام)',
    ber: 'Uṭṭun ur yettwasenqed ara',
  );

  String get invalidNin => _t(
    fr: 'NIN invalide (18 chiffres)',
    ar: 'رقم تعريف غير صالح (18 رقماً)',
    ber: 'NIN ur yettwasenqed ara',
  );

  String get passwordsMismatch => _t(
    fr: 'Les mots de passe ne correspondent pas',
    ar: 'كلمتا المرور غير متطابقتين',
    ber: 'Awalen uffiren ur mṣadan ara',
  );

  String get requiredConsents => _t(
    fr: 'Veuillez accepter tous les consentements obligatoires',
    ar: 'يرجى قبول جميع الموافقات الإلزامية',
    ber: 'Qbal akk isenqaden yettwasra',
  );

  String get networkError => _t(
    fr: 'Erreur réseau. Réessayez.',
    ar: 'خطأ في الشبكة. أعد المحاولة.',
    ber: 'Tuccḍa n uzeṭṭa. Ales.',
  );

  String _t({required String fr, required String ar, required String ber}) {
    switch (_locale) {
      case AppLocale.arabic:
        return ar;
      case AppLocale.tamazight:
        return ber;
      case AppLocale.french:
        return fr;
    }
  }
}

class _AuthStringsDelegate extends LocalizationsDelegate<AuthStrings> {
  const _AuthStringsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<AuthStrings> load(Locale locale) async {
    return AuthStrings._(AppLocale.fromLocale(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AuthStrings> old) => false;
}
