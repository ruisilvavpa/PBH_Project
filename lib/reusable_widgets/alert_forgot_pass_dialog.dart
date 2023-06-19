import 'package:flutter/material.dart';
import 'package:pbh_project/screens/login/login_page.dart';

class AlertForgotPassDialog {
  BuildContext context;
  AlertForgotPassDialog(this.context);

  static void alertType(
    BuildContext context,
    String title,
    String message,
  ) {
    var alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        ElevatedButton(
          child: const Text(
            "Ok",
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
      ],
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
