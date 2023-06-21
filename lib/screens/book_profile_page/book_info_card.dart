import 'package:flutter/material.dart';

import '../../resources/strings.dart';
import '../../utils/app_styles.dart';

class BookInfoCard extends StatefulWidget {
  final double rating;
  final int numberOfPages;
  const BookInfoCard(
      {super.key, required this.rating, required this.numberOfPages});

  @override
  State<BookInfoCard> createState() => _BookInfoCardState();
}

class _BookInfoCardState extends State<BookInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const Text(
                      Strings.kBookProfileRating,
                      style: TextStyle(
                        fontFamily: 'Khepri',
                        fontSize: 15,
                        color: writterLogoColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text('${widget.rating}', style: kTitle2)
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    const Text(
                      Strings.kBookProfileNumberOfPages,
                      style: TextStyle(
                        fontFamily: 'Khepri',
                        fontSize: 15,
                        color: writterLogoColor,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text('${widget.numberOfPages}', style: kTitle2)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
