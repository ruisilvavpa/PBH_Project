import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/controllers/login_controller.dart';
import 'package:pbh_project/reusable_widgets/submit_button.dart';
import 'package:pbh_project/screens/home_screen.dart';
import 'package:pbh_project/screens/login/forgot_password_page.dart';
import '../../reusable_widgets/input_fields.dart';
import '../../reusable_widgets/logo_widget.dart';
import '../../reusable_widgets/sign_up_option.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(191, 229, 192, 1),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      20, MediaQuery.of(context).size.height * 0.01, 20, 0),
                  child: Column(
                    children: <Widget>[
                      logoWidget('assets/images/mainlogo.jpg'),
                      const Text(
                        'PBH',
                        style: TextStyle(
                          fontFamily: 'Khepri',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Help Each Other',
                        style: TextStyle(
                          fontFamily: 'Khepri',
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Enter as a ',
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: 'Itim',
                              fontSize: 20),
                          children: [
                            TextSpan(
                              text: 'Guest',
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Itim',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => HomeScreen()),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputTextFieldWidget(loginController.emailController,
                          'Email', Icons.email),
                      const SizedBox(
                        height: 30,
                      ),
                      InputTextFieldWidget(loginController.passwordController,
                          'Password', Icons.password),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        RichText(
                          text: TextSpan(
                            text: 'Forgot Password',
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontFamily: 'Itim',
                                fontSize: 20),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(
                                    () => ForgotPasswordPage(),
                                  ),
                          ),
                        ),
                      ]),
                      const SizedBox(
                        height: 30,
                      ),
                      SubmitButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen())),
                          title: 'Log In!'),
                      signUpOption(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
