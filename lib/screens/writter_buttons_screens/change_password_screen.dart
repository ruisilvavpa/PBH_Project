import 'package:flutter/material.dart';
import 'package:pbh_project/controllers/change_password_controller.dart';
import 'package:pbh_project/models/validations.dart';
import 'package:pbh_project/reusable_widgets/app_bar.dart';
import '../../resources/strings.dart';
import '../../reusable_widgets/input_fields.dart';
import '../../reusable_widgets/submit_button.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  ChangePasswordController controller = ChangePasswordController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Strings.kChangePasswordTitle,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Column(
            children: [
              const SizedBox(
                height: 36,
              ),
              InputTextFieldWidget(
                  controller.oldPassController,
                  Strings.kFieldOldPassword,
                  Icons.password,
                  true,
                  Strings.kFieldPasswordError,
                  Regex.password),
              const SizedBox(
                height: 20,
              ),
              InputTextFieldWidget(
                  controller.newPassController,
                  Strings.kFieldNewPassword,
                  Icons.password,
                  true,
                  Strings.kFieldPasswordError,
                  Regex.password),
              const SizedBox(
                height: 20,
              ),
              InputTextFieldWidget(
                  controller.confirmNewPassController,
                  Strings.kFieldConfirmPassword,
                  Icons.password,
                  true,
                  Strings.kFieldPasswordError,
                  Regex.password),
              SubmitButton(
                  onPressed: controller.checkIsValid() == true
                      ? () => sendRequest()
                      : null,
                  title: Strings.kForgotPasswordAction),
            ],
          ),
        ),
      ),
    );
  }

  sendRequest() {
    FocusScope.of(context).unfocus();
    controller
        .changePassword()
        .then((value) => handleChangePasswordAnswer(value, context));
  }

  void handleChangePasswordAnswer(bool response, BuildContext context) {
    if (response) {
      Navigator.pop(context);
    }
  }
}
