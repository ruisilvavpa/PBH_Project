import 'package:flutter/material.dart';

class ResultsNotFound extends StatelessWidget {
  const ResultsNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: Icon(
            Icons.search_off,
            size: 100,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'No results found,\n'
            'Please try a different keyword',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              fontFamily: 'Khepri',
            ),
          ),
        )
      ]),
    );
  }
}
