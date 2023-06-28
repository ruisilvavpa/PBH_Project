import 'package:flutter/material.dart';
import 'package:pbh_project/screens/grid_view_books/grid_view_2.dart';
import '../../utils/app_styles.dart';

class SeeMyBooks extends StatefulWidget {
  const SeeMyBooks({super.key});

  @override
  State<SeeMyBooks> createState() => _SeeMyBooksState();
}

class _SeeMyBooksState extends State<SeeMyBooks> {
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
                  child: const Center(
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
                  child: MyGridViewCopy2()),
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
                  child: const Center(
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
