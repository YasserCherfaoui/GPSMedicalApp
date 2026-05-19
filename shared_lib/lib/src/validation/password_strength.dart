/// Password rules aligned with OpenAPI (`minLength: 10`).
class PasswordStrength {
  const PasswordStrength({
    required this.minLength,
    required this.hasUppercase,
    required this.hasDigit,
    required this.hasSpecial,
  });

  final bool minLength;
  final bool hasUppercase;
  final bool hasDigit;
  final bool hasSpecial;

  int get score {
    var s = 0;
    if (minLength) s++;
    if (hasUppercase) s++;
    if (hasDigit) s++;
    if (hasSpecial) s++;
    return s;
  }

  bool get isValid => minLength && hasUppercase && hasDigit && hasSpecial;

  static PasswordStrength evaluate(String password) {
    return PasswordStrength(
      minLength: password.length >= 10,
      hasUppercase: RegExp(r'[A-Z]').hasMatch(password),
      hasDigit: RegExp(r'[0-9]').hasMatch(password),
      hasSpecial: RegExp(
        r'[!@#$%^&*(),.?":{}|<>_\-+=\[\]\\;/]',
      ).hasMatch(password),
    );
  }
}
