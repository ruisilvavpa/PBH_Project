import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/controllers/login_controller.dart';
import 'package:pbh_project/reusable_widgets/submit_button.dart';
import 'package:pbh_project/screens/home_screen.dart';
import 'package:pbh_project/screens/login/forgot_password_page.dart';
import 'package:pbh_project/utils/app_styles.dart';
import '../../models/validations.dart';
import '../../resources/strings.dart';
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
      backgroundColor: kOfflineBackgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        24, MediaQuery.of(context).size.height * 0.01, 24, 0),
                    child: Column(
                      children: <Widget>[
                        logoWidget('assets/images/mainlogo.jpg'),
                        const Text(
                          Strings.kLoginTitle,
                          style: kTitle1,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          Strings.kLoginSubTitle,
                          style: kTitle2,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        RichText(
                          text: TextSpan(
                            text: Strings.kLoginEnterAs,
                            style: kDescription,
                            children: [
                              TextSpan(
                                text: Strings.kLoginGuest,
                                style: kTextAction,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.to(() => HomeScreen()),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        InputTextFieldWidget(
                            loginController.emailController,
                            Strings.kFieldEmail,
                            Icons.email,
                            false,
                            Strings.kFieldEmailError,
                            Regex.email,
                            TextInputType.emailAddress),
                        const SizedBox(
                          height: 12,
                        ),
                        InputTextFieldWidget(
                            loginController.passwordController,
                            Strings.kFieldPassword,
                            Icons.password,
                            true,
                            Strings.kFieldPasswordError,
                            Regex.password),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: Strings.kLoginForgotPassword,
                                    style: kDescription,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ForgotPasswordPage()))),
                              ),
                            ]),
                        const SizedBox(
                          height: 24,
                        ),
                        SubmitButton(
                            onPressed: loginController.isLoginValid() == true
                                ? () => loginController.loginWithEmail()
                                : null,
                            title: Strings.kLogin),
                        signUpOption(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  pushHomeScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
