import 'package:flutter/material.dart';
import '../../utils/app_styles.dart';
import 'book_rating.dart';
import 'two_side_rounded_buttom.dart';

class BookListCard extends StatefulWidget {
  final String image;
  final String title;
  final String auth;
  final double rating;
  final Function pressDetails;
  final Function pressDonate;
  const BookListCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.auth,
      required this.rating,
      required this.pressDetails,
      required this.pressDonate})
      : super(key: key);

  @override
  State<BookListCard> createState() => _BookListCardState();
}

class _BookListCardState extends State<BookListCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, bottom: 40),
      height: 275,
      width: 282,
      child: Stack(
        children: [
          Container(
            height: 300,
            width: 202,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(29),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 33,
                  color: kshadowcolor,
                ),
              ],
            ),
          ),
          Image.asset(
            widget.image,
            width: 150,
          ),
          Positioned(
            top: 10,
            right: 130,
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                BookRating(score: widget.rating),
              ],
            ),
          ),
          Positioned(
            top: 190,
            child: Container(
              height: 85,
              width: 202,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        style: TextStyle(color: kPrimaryColor),
                        children: [
                          TextSpan(
                            text: "${widget.title}\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: widget.auth,
                            style: TextStyle(
                              color: kSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => widget.pressDetails,
                        child: Container(
                          width: 101,
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          alignment: Alignment.center,
                          child: Text('Details'),
                        ),
                      ),
                      Expanded(
                        // ignore: avoid_print
                        child: TwoSidesRoundedButtom(
                          text: 'Donate',
                          radious: 29,
                          press: () => widget.pressDonate,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
