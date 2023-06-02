import 'package:flutter/cupertino.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    //color: Color.fromARGB(255, 218, 14, 14),
  );
}
