import 'package:flutter/material.dart';

import '../../resources/strings.dart';

class StartTyping extends StatelessWidget {
  ///this widget is shown when the _textcontroller from
  ///the list search screen is empty,
  ///it shows an icon and a text bellow it
  const StartTyping({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 50,
            right: 50,
          ),
          child: Icon(
            Icons.keyboard,
            size: 100,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 50,
            right: 50,
          ),
          child: Text(
            Strings.kDiscoverySearchIsEmpty,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              fontFamily: 'Khepri',
            ),
          ),
        ),
      ]),
    );
  }
}
