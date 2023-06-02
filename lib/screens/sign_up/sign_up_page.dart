import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/controllers/registration_controller.dart';
import 'package:pbh_project/models/type_account.dart';
import 'package:pbh_project/reusable_widgets/input_fields.dart';
import 'package:pbh_project/reusable_widgets/submit_button.dart';
import 'package:pbh_project/screens/home_screen.dart';
import 'package:pbh_project/screens/login/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //variables
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Account _account = Account();

  @override
  Widget build(BuildContext context) {
    RegistrationController registrationController =
        Get.put(RegistrationController());
    //variables
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final users = ['Writter', 'User'];
    String? selectedValue = 'Writter';
    Type type = Type.user;
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
        child: Padding(
          padding: EdgeInsets.only(bottom: bottom),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //Image Container
                Container(
                  width: w,
                  height: h * 0.22,
                  child: Column(
                    children: [
                      SizedBox(
                        height: h * 0.05,
                      ),
                      const CircleAvatar(
                        backgroundColor: Color.fromRGBO(191, 229, 192, 1),
                        radius: 60,
                        backgroundImage:
                            AssetImage('assets/images/profile_icon.png'),
                      ),
                    ],
                  ),
                ),
                signInOption(context),
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
                      'Type of Account',
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
                        title: const Text('Writter'),
                        value: Type.writter,
                        groupValue: _account.type,
                        onChanged: (value) =>
                            setState(() => _account.type = value),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('User'),
                        value: Type.user,
                        groupValue: _account.type,
                        onChanged: (value) =>
                            setState(() => _account.type = value),
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
                      SizedBox(
                        height: 20,
                      ),
                      InputTextFieldWidget(
                          registrationController.nameController,
                          'Name',
                          Icons.person_outline),
                      SizedBox(
                        height: 20,
                      ),
                      InputTextFieldWidget(
                          registrationController.emailController,
                          'Email',
                          Icons.email),
                      SizedBox(
                        height: 30,
                      ),
                      InputTextFieldWidget(
                          registrationController.passwordController,
                          'Password',
                          Icons.password),
                      SizedBox(
                        height: 30,
                      ),
                      SubmitButton(
                        onPressed: () => HomeScreen(),
                        title: 'Register',
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

  Row signInOption(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have account?   ',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          child: const Text(
            'Sign In',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Khepri',
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
