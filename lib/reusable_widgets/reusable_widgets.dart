import 'package:flutter/material.dart';
import 'package:pbh_project/screens/onboarding/views/onboarding_screen.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    //color: Color.fromARGB(255, 218, 14, 14),
  );
}

Container guestButton(BuildContext context) {
  return Container(
    width: 150,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),
    ),
    child: ElevatedButton(
      onPressed: () {},
      child: Text(
        'Guest Mode',
        style: TextStyle(
            fontSize: 15,
            fontFamily: 'Khepri',
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}
