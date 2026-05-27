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
}
