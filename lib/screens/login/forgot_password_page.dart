import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/controllers/forgotpassword_controller.dart';
import 'package:pbh_project/models/validations.dart';
<<<<<<< HEAD
import 'package:pbh_project/screens/login/new_password_page.dart';
=======
import 'package:pbh_project/reusable_widgets/app_bar.dart';
import 'package:pbh_project/reusable_widgets/logo_widget.dart';
>>>>>>> main
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
      appBar: const CustomAppBar(
        title: 'Forgot Password',
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
              logoWidget('assets/images/mainLogo.jpg'),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 16, 24),
                child: Text(Strings.kForgotPasswordQuestion),
              ),
              InputTextFieldWidget(
                  forgotController.emailController,
                  Strings.kFieldEmailBody,
                  Icons.email,
                  false,
                  Strings.kFieldEmailError,
                  Regex.email,
                  TextInputType.emailAddress),
              SubmitButton(
                  onPressed: forgotController.checkIsValid() == true
                      ? () => sendRequest()
                      : () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewPasswordPage(),
                            ),
                          ),
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
