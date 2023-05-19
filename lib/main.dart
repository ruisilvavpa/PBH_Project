import 'package:flutter/material.dart';
import 'package:pbh_project/screens/login/login_page.dart';
import 'package:pbh_project/screens/onboarding/views/onboarding_screen.dart';
import 'package:pbh_project/screens/sign_up/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SignUpPage());
  }
}
