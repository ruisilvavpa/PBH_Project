import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pbh_project/screens/login/login_page.dart';

import '../../controllers/login_controller.dart';
import '../../reusable_widgets/alert_forgot_pass_dialog.dart';
import '../../reusable_widgets/input_fields.dart';
import '../../reusable_widgets/submit_button.dart';

class NewPasswordPage extends StatelessWidget {
  NewPasswordPage({super.key});

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(191, 229, 192, 1),
        shadowColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(191, 229, 192, 1),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Reset Password',
              style: TextStyle(
                fontFamily: 'Khepri',
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 100,
            ),
            InputTextFieldWidget(
              loginController.emailController,
              'New password',
              Icons.email,
            ),
            const SizedBox(
              height: 30,
            ),
            InputTextFieldWidget(
              loginController.emailController,
              'Confirm new password',
              Icons.email,
            ),
            const SizedBox(
              height: 90,
            ),
            SubmitButton(
                onPressed: () => AlertForgotPassDialog.alertType(
                    context, 'Reset Password', 'Your Password has been Reset!'),
                title: 'Confirm Password'),
          ],
        ),
      ),
    );
  }
}
