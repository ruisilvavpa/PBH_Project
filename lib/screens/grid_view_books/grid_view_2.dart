import 'package:flutter/material.dart';
import 'package:pbh_project/screens/book_profile_page/book_list_card.dart';
import 'package:pbh_project/utils/size_configs.dart';

class MyGridViewCopy2 extends StatelessWidget {
  ///this is the grid view for the book genres and writters
  const MyGridViewCopy2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: SizeConfig().calculateCrossAxisCountForCard(context),
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 1.11,
        ),
        primary: false,
        shrinkWrap: true,
        itemCount: 16, // Replace with actual genre count
        itemBuilder: (context, index) {
          return BookListCard(
            image: 'assets/images/mainLogo.jpg',
            auth: 'ola2',
            title: 'ola',
            pressDetails: () {},
            pressDonate: () {},
            rating: 3,
          );
        },
      ),
    );
  }
}
