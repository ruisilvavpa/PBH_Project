import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  MyListView({super.key, required this.bookGenres});

  late final List<String> bookGenres;

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            ListView.builder(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              itemCount: widget.bookGenres.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 100,
                  child: Card(
                    color: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          widget.bookGenres[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
