import 'package:flutter/material.dart';
import 'package:pbh_project/models/validations.dart';
import 'package:pbh_project/utils/app_styles.dart';

class InputTextFieldWidget extends StatelessWidget {
  //variables
  final TextEditingController textEditingController;
  final String hintText;
  final IconData icon;
  final bool obscureValue;
  final String? errorMsg;
  final String? regex;
  final TextInputType keyboardType;

  const InputTextFieldWidget(
      this.textEditingController, this.hintText, this.icon, this.obscureValue,
      [this.errorMsg, this.regex, this.keyboardType = TextInputType.text]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: TextField(
        controller: textEditingController,
        style: kInputField,
        cursorColor: kPrimaryColor,
        autocorrect: false,
        keyboardType: keyboardType,
        obscureText: obscureValue,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          labelText: hintText,
          labelStyle: TextStyle(color: kBackgroundColor),
          filled: true,
          helperText: " ",
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: kBackgroundColor.withOpacity(0.3),
          errorText: validateInputField(textEditingController.text),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(23.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
        ),
      ),
    );
  }

  String? validateInputField(String value) {
    if (value.isNotEmpty &&
        errorMsg != null &&
        !RegexValidator.validate(value, regex)) {
      return errorMsg;
    }
    return null;
  }
}
