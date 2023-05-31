import 'package:flutter/cupertino.dart';

import '../exceptions/invalid_email_exception.dart';

class EmailValidator {
  TextEditingController emailController = TextEditingController();

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

class PasswordValidator {
  TextEditingController passwordController = TextEditingController();
  static final String _pattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  static final RegExp _regex = RegExp(_pattern);

  static bool validate(String passwordController) {
    if (!PasswordValidator.validate(passwordController)) {
      InvalidEmailException('The email is not correct');
    }
    return _regex.hasMatch(passwordController);
  }
}
