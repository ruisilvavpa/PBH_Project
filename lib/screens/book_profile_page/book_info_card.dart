import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../resources/strings.dart';
import '../../utils/app_styles.dart';
import '../writter_main_profile_page.dart';

import '../../resources/strings.dart';
import '../../utils/app_styles.dart';

class BookInfoCard extends StatefulWidget {
  final double rating;
  final String writterName;
  const BookInfoCard(
      {super.key, required this.rating, required this.writterName});

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
                    TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ));
                      },
                      child: const Text(
                        Strings.kBookProfileRating,
                        style: kTitle3,
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
                      Strings.kBookProfileWritterName,
                      style: TextStyle(
                        fontFamily: 'Khepri',
                        fontSize: 15,
                        color: writterLogoColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WritterMainProfilePage(
                              userId: 2,
                            ),
                          ),
                        );
                      },
                      child: Text(widget.writterName, style: kTitle2),
                    ),
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
