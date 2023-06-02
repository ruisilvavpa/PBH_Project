import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/login_controller.dart';
import '../../reusable_widgets/alert_reset_pass_dialog.dart';
import '../../reusable_widgets/input_fields.dart';
import '../../reusable_widgets/submit_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(191, 229, 192, 1),
        shadowColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(191, 229, 192, 1),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Forgot Password',
              style: TextStyle(
                fontFamily: 'Khepri',
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            const SizedBox(
              height: 100,
            ),
            InputTextFieldWidget(
              loginController.emailController,
              'Enter your Email',
              Icons.email,
            ),
            const SizedBox(
              height: 30,
            ),
            SubmitButton(
                onPressed: () => AlertResetPassDialog.alertType(context,
                    'Forgot Password', 'The Request as sent to your Email!'),
                title: 'Send Request'),
          ],
        ),
      ),
    );
  }
}
