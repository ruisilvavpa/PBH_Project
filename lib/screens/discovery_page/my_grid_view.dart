import 'package:flutter/material.dart';
import 'package:pbh_project/utils/size_configs.dart';

class MyGridView extends StatelessWidget {
  ///this is the grid view for the book genres and writters
  const MyGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> _bookGenres = [
      'Mystery/Thriller',
      'Romance',
      'Science Fiction/Fantasy',
      'Historical Fiction',
      'Biography/Memoir',
      'Self-Help/Personal Development',
      'Young Adult',
      'Children\'s Books',
      'Business/Entrepreneurship',
      'Travel',
      'Horror',
      'Comics/Graphic Novels',
      'Classic Literature',
      'Poetry',
      'Science/Nature',
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
        itemCount: _bookGenres.length, // Replace with actual genre count
        itemBuilder: (context, index) {
          return Card(
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
                  _bookGenres[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
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
