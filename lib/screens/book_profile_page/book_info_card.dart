import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:pbh_project/controllers/rating_controller.dart';
import 'package:pbh_project/models/rating.dart';
import 'package:pbh_project/reusable_widgets/input_fields.dart';

import '../../resources/strings.dart';
import '../../utils/app_styles.dart';
import '../writter_main_profile_page.dart';

import '../../resources/strings.dart';
import '../../utils/app_styles.dart';

class BookInfoCard extends StatefulWidget {
  final double rating;
  final String writterName;
  final int bookId;
  const BookInfoCard(
      {super.key,
      required this.bookId,
      required this.rating,
      required this.writterName});

  @override
  State<BookInfoCard> createState() => _BookInfoCardState();
}

class _BookInfoCardState extends State<BookInfoCard> {
  Rating? rat;
  final RatingController ratingController = Get.put(RatingController());
  @override
  void initState() {
    ratingController.bookId = widget.bookId;
    super.initState();
  }

  @override
  void dispose() {
    ratingController;
    super.dispose();
  }

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
                                  content: Container(
                                    height: 200,
                                    child: Column(
                                      children: [
                                        RatingBar.builder(
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: false,
                                          itemCount: 5,
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 4),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (value) {
                                            if (mounted) {
                                              setState(() {
                                                ratingController.rating = value;
                                              });
                                            }
                                          },
                                        ),
                                        InputTextFieldWidget(
                                          ratingController.commentController,
                                          'Insert a comment',
                                          Icons.comment_rounded,
                                          false,
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        ratingController.insertRating();
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
                            builder: (context) =>
                                const WritterMainProfilePage(),
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
