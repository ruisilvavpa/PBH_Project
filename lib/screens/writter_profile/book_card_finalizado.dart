import 'package:flutter/material.dart';
import '../../utils/app_styles.dart';
import '../book_profile_page/book_rating.dart';

class BookCardFinalizado extends StatefulWidget {
  const BookCardFinalizado({super.key});

  @override
  State<BookCardFinalizado> createState() => _BookCardFinalizadoState();
}

class _BookCardFinalizadoState extends State<BookCardFinalizado> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      width: 150,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: Image.asset(
                    'assets/images/image_profile.jpg',
                    width: 175,
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Column(
                    children: [
                      BookRating(score: 2.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            child: Text(
              "Book Name",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
