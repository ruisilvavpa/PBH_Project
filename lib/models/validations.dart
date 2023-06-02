import '../exceptions/invalid_email_exception.dart';

///if the Email is valid
class EmailValidator {
  String? emailController;

  static const String _pattern =
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
  static final RegExp _regex = RegExp(_pattern);

  static bool validate(String emailController) {
    if (!EmailValidator.validate(emailController)) {
      InvalidEmailException('The email is not correct');
    }
    return _regex.hasMatch(emailController);
  }
}

///if the Password is valid
class PasswordValidator {
  String? passwordController;
  static const String _pattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  static final RegExp _regex = RegExp(_pattern);

  static bool validate(String passwordController) {
    if (!PasswordValidator.validate(passwordController)) {
      InvalidEmailException('The email is not correct');
    }
    return _regex.hasMatch(passwordController);
  }
}
