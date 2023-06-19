import 'package:flutter/material.dart';
import 'package:pbh_project/screens/login/new_password_page.dart';

class AlertResetPassDialog {
  BuildContext context;
  AlertResetPassDialog(this.context);

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
                MaterialPageRoute(builder: (context) => NewPasswordPage()));
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
