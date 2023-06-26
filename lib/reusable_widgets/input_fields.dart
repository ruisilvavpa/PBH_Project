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
        cursorColor: writterLogoColor,
        keyboardType: keyboardType,
        obscureText: obscureValue,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
<<<<<<< HEAD
            color: writterLogoColor,
          ),
          labelText: hintText,
          labelStyle: kInfoText,
          filled: true,
          helperText: " ",
          fillColor: writterLogoColor.withOpacity(0.3),
=======
            color: defaultLogoColor,
          ),
          labelText: hintText,
          labelStyle: const TextStyle(color: writterLogoColor),
          filled: true,
          helperText: " ",
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.white.withOpacity(0.3),
>>>>>>> main
          errorText: validateInputField(textEditingController.text),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(23.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.solid)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23.0),
            borderSide: BorderSide(
              color: writterLogoColor,
            ),
          ),
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
