import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pbh_project/models/data_base_helper.dart';
import 'package:pbh_project/models/email_validator.dart';
import 'package:pbh_project/models/type_account.dart';
import 'package:pbh_project/models/onboard_data.dart';
import 'package:pbh_project/models/user_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../data/database.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //variables
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Variáveis de controlador
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Account _account = Account();

  @override
  Widget build(BuildContext context) {
    //variables
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final users = ['Writter', 'User'];
    String? selectedValue = 'Writter';
    Type type = Type.user;
    return Scaffold(
      backgroundColor: Color.fromRGBO(191, 229, 192, 1),
      body: Padding(
        padding: EdgeInsets.zero,
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
              //Text
              RichText(
                text: const TextSpan(
                  text: 'Already have an account?',
                  style: TextStyle(
                      color: Color.fromRGBO(87, 61, 28, 1),
                      fontFamily: 'Itim',
                      fontSize: 20),
                  children: [
                    TextSpan(
                        text: 'Sign in',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Itim',
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
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
                    const SizedBox(
                      height: 10,
                    ),
                    //First TextField
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.5))
                          ]),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          prefixIcon: const Icon(
                            Icons.mode_standby,
                            color: Color.fromRGBO(87, 61, 28, 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //Second TextField
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.5))
                          ]),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Color.fromRGBO(87, 61, 28, 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        validator: (value) =>
                            EmailValidator.isValid(email: value)
                                ? null
                                : EmailValidator.emailRegexExpression,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //Third TextField
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.5))
                          ]),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: const Icon(
                            Icons.password,
                            color: Color.fromRGBO(87, 61, 28, 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        validator: (value) =>
                            EmailValidator.isValid(password: value)
                                ? null
                                : EmailValidator.passwordRegexExpression,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: w * 0.5,
                height: h * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/loginbtn.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    Database? database = await openDatabaseInstance();
                    User user = User(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    int insertedId =
                        await DatabaseHelper.instance.insertUser(user);

                    if (insertedId != 0) {
                      print('Usuário inserido com sucesso. ID: $insertedId');
                    } else {
                      print('Falha ao inserir o usuário.');
                    }
                  },
                  child: Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
