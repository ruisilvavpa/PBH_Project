import 'package:flutter/material.dart';

import '../resources/strings.dart';
import '../screens/sign_up/sign_up_page.dart';

Row signUpOption(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        Strings.kLoginHaveAccount,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignUpPage()));
        },
        child: const Text(
          Strings.kLoginSignup,
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Khepri',
              fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
