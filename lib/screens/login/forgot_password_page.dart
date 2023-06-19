import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/controllers/forgotpassword_controller.dart';
import 'package:pbh_project/models/validations.dart';
import 'package:pbh_project/utils/app_styles.dart';
import '../../resources/strings.dart';
import '../../reusable_widgets/input_fields.dart';
import '../../reusable_widgets/submit_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  ForgotPasswordController forgotController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOfflineBackgroundColor,
        shadowColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: kOfflineBackgroundColor,
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
                height: 8,
              ),
              const Text(
                Strings.kForgotPassword,
                style: kTitle0,
              ),
              const SizedBox(
                height: 42,
              ),
              const SizedBox(
                height: 100,
              ),
              InputTextFieldWidget(
                  forgotController.emailController,
                  Strings.kFieldEmail,
                  Icons.email,
                  false,
                  Strings.kFieldEmailError,
                  Regex.email,
                  TextInputType.emailAddress),
              const SizedBox(
                height: 24,
              ),
              SubmitButton(
                  onPressed: forgotController.checkIsValid() == true
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
    forgotController.sendForgotPasswordRequest();
  }
}
