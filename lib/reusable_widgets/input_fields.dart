import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final IconData icon;
  InputTextFieldWidget(this.textEditingController, this.hintText, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: TextField(
        controller: textEditingController,
        style: TextStyle(
          fontFamily: 'Itim',
          fontSize: 20,
          color: Color.fromRGBO(87, 61, 28, 1),
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Color.fromRGBO(87, 61, 28, 1),
          ),
          labelText: hintText,
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.white.withOpacity(0.3),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
        ),
      ),
    );
  }
}
