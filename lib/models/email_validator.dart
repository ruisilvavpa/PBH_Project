import 'package:pbh_project/exceptions/invalid_email_exception.dart';

class EmailValidator {
  static String emailRegexExpression =
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
  static String passwordRegexExpression =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';

  ///validate content with RegExp
  static bool isValid({String? email, String? password}) {
    //variables
    String content;
    RegExp regexValidation;

    //prepare validation
    if (email != null) {
      regexValidation = RegExp(emailRegexExpression);
      content = email;
    } else if (password != null) {
      regexValidation = RegExp(passwordRegexExpression);
      content = password;
    } else {
      throw InvalidEmailException(
          'Invalid email or password, please try again!');
    }

    //validate
    return regexValidation.hasMatch(content);
  }
}
