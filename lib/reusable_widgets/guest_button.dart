import 'package:flutter/material.dart';

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
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: const Text(
        'Guest Mode',
        style: TextStyle(
            fontSize: 15,
            fontFamily: 'Khepri',
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
    ),
  );
}
