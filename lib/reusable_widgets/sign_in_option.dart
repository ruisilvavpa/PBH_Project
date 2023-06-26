import 'package:flutter/material.dart';

import '../screens/login/login_page.dart';

class signInOption extends StatelessWidget {
  signInOption({
    super.key,
    required this.context,
  });

  var context;

  @override
  Widget build(BuildContext context) {
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
