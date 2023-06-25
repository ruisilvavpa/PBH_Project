import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/controllers/registration_controller.dart';
import 'package:pbh_project/models/type_account.dart';
import 'package:pbh_project/reusable_widgets/input_fields.dart';
import 'package:pbh_project/reusable_widgets/submit_button.dart';
import 'package:pbh_project/screens/writter_buttons_screens/home_screen.dart';
import 'package:pbh_project/screens/login/login_page.dart';
import 'package:pbh_project/utils/app_styles.dart';

import '../../resources/strings.dart';
import '../../reusable_widgets/sign_in_option.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //variables
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegistrationController controller = RegistrationController();

  @override
  Widget build(BuildContext context) {
    RegistrationController registrationController =
        Get.put(RegistrationController());
    //variables
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.kLoginSignup),
        backgroundColor: writterLogoColor,
        shadowColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottom),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                signInOption(context: context),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                    ),
                    const Text(
                      Strings.kSignupAccountType,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Khepri',
                        color: Color.fromRGBO(87, 61, 28, 1),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: RadioListTile(
                        //contentPadding: EdgeInsets.zero,
                        title: const Text(Strings.kSignupWritter),
                        value: AccountType.writter,
                        groupValue: controller.type,
                        onChanged: (value) =>
                            setState(() => controller.type = value),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text(Strings.kSignupUser),
                        value: AccountType.user,
                        groupValue: controller.type,
                        onChanged: (value) =>
                            setState(() => controller.type = value),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  width: w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      InputTextFieldWidget(
                          registrationController.nameController,
                          'Name',
                          Icons.person_outline,
                          false),
                      SizedBox(
                        height: 20,
                      ),
                      InputTextFieldWidget(
                          registrationController.emailController,
                          'Email',
                          Icons.email,
                          false),
                      SizedBox(
                        height: 30,
                      ),
                      InputTextFieldWidget(
                          registrationController.passwordController,
                          'Password',
                          Icons.password,
                          true),
                      SizedBox(
                        height: 30,
                      ),
                      SubmitButton(
                        onPressed: registrationController.isSignupValid() ==
                                true
                            ? () => registrationController.registerWithEmail()
                            : null,
                        title: Strings.kLoginSignup,
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
