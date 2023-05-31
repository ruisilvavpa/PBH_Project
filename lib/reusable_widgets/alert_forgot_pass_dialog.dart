import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
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
          child: Text(
            "Ok",
          ),
          onPressed: () {
            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (context) => LoginPage()));
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
