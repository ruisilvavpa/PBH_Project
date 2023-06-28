import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pbh_project/models/categories.dart';
import 'package:pbh_project/screens/grid_view_books/grid_view_books_screen.dart';
import 'package:pbh_project/utils/app_styles.dart';
import 'package:pbh_project/utils/size_configs.dart';

import '../grid_view_books/grid_view_book_category.dart';

class MyGridView extends StatefulWidget {
  final List<Categories> categories;

  /// This is the grid view for the book genres and writers
  const MyGridView({Key? key, required this.categories}) : super(key: key);

  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  @override
  Widget build(BuildContext context) {
    final random = Random();
    final List<double> hues = [
      HSVColor.fromColor(const Color.fromRGBO(191, 229, 192, 1)).hue,
      HSVColor.fromColor(const Color.fromRGBO(138, 210, 224, 1)).hue,
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: SizeConfig().calculateCrossAxisCount(context),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.6,
        ),
        primary: false,
        shrinkWrap: true,
        itemCount: widget.categories.length, // Replace with actual genre count
        itemBuilder: (context, index) {
          // Select a random hue from the hues list
          final hue = hues[random.nextInt(hues.length)];

          // Generate random saturation value between 0.2 and 0.8
          final saturation = 0.2 + random.nextDouble() * 0.6;

          // Generate random value (lightness) between 0.4 and 0.8
          final value = 0.4 + random.nextDouble() * 0.4;

          // Create color using HSV values
          final randomColor =
              HSVColor.fromAHSV(1.0, hue, saturation, value).toColor();
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GridViewBooksCategoriesScreen(
                        category: widget.categories[index],
                      )));
            },
            child: Card(
              color: randomColor,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    widget.categories[index].name,
                    textAlign: TextAlign.center,
                    style: kTitle5,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
