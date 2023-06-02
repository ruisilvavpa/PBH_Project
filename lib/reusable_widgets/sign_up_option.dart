import 'package:flutter/material.dart';

import '../screens/sign_up/sign_up_page.dart';

Row signUpOption(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Don\'t have account?   ',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpPage()));
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Khepri',
              fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
