import 'package:flutter/material.dart';

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
        TextButton(
          onPressed: () => Navigator.pop(
            context,
            'Ok',
          ),
          child: const Text('Ok'),
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
