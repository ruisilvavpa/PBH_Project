import 'package:flutter/material.dart';

import '../../resources/strings.dart';

class ResultsNotFound extends StatelessWidget {
  const ResultsNotFound({super.key});

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
            Icons.search_off,
            size: 100,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 50,
            right: 50,
          ),
          child: Text(
            Strings.kDiscoverySearchNoResults,
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
