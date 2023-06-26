import 'package:flutter/material.dart';
import 'package:pbh_project/screens/writter_profile/book_card_finalizado.dart';
import 'package:pbh_project/utils/app_styles.dart';

class ListViewBooks extends StatefulWidget {
  const ListViewBooks({super.key});

  @override
  State<ListViewBooks> createState() => _ListViewBooksState();
}

class _ListViewBooksState extends State<ListViewBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  print('tap');
                },
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      'ListView 1',
                      style: kTitle1,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    print('tap');
                  },
                  child: BookCardFinalizado()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  print('tap');
                },
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      'ListView 3',
                      style: kTitle1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
