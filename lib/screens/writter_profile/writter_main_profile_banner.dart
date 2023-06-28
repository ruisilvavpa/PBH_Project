import 'package:flutter/material.dart';
import 'package:pbh_project/screens/book_profile_page/book_rating.dart';
import 'package:pbh_project/screens/writter_profile/about_me_card.dart';
import '../../models/user.dart';
import 'carousel_books.dart';

class WritterMainProfileBanner extends StatefulWidget {
  final User? user;

  const WritterMainProfileBanner({Key? key, required this.user})
      : super(key: key);

  @override
  State<WritterMainProfileBanner> createState() =>
      _WritterMainProfileBannerState();
}

class _WritterMainProfileBannerState extends State<WritterMainProfileBanner> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 120,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: const Image(
                image: AssetImage(
                  'assets/images/image_profile.jpg',
                ),
              ),
            ),
          ),
          const BookRating(score: 4.7),
          AboutMe(
            aboutMe: widget.user?.bio ?? 'This user didn\'t provide a bio',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 240,
              child: CarouselBooks(),
            ),
          ),
        ],
      ),
    );
  }
}
