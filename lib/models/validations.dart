class Regex {
  static const String email =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String password =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
}

class RegexValidator {
  static bool validate(String value, String? regex) {
    if (regex != null) {
      RegExp regExp = RegExp(regex);
      return regExp.hasMatch(value);
    }
    return value.isNotEmpty;
  }
}
