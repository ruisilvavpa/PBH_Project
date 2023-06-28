import 'package:flutter/material.dart';
import 'package:pbh_project/controllers/image_controller.dart';
import 'package:pbh_project/models/books.dart';
import 'package:pbh_project/models/user.dart';
import 'package:pbh_project/screens/donation_screen.dart';
import '../../controllers/book_profiles_controller.dart';
import '../../utils/app_styles.dart';
import 'book_rating.dart';
import 'two_side_rounded_buttom.dart';
import '../../utils/app_styles.dart';
import 'book_rating.dart';

class BookListCard extends StatefulWidget {
  BooksOut? book;
  User? user;
  BookListCard({super.key, this.book, this.user});

  @override
  State<BookListCard> createState() =>
      _BookListCardState(book: book, user: user);
}

class _BookListCardState extends State<BookListCard> {
  //variables
  User? user;
  BooksOut? book;
  _BookListCardState({this.book, this.user});
  Image placeholderImage =
      Image.asset('assets/images/image_profile.jpg', width: 150);

  BookProfileController bookProfileController = BookProfileController();
  ImageController imageController = ImageController();

  @override
  void initState() {
    if (book?.imagePath != null) {
      imageController.displayImage(book!.imagePath!).then((value) =>
          setState(() => placeholderImage = Image.file(value!, width: 150)));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, bottom: 40),
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
          placeholderImage,
          Positioned(
            top: 10,
            right: 90,
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                BookRating(score: widget.book?.mediaRating ?? 0.0),
              ],
            ),
          ),
          Positioned(
            top: 190,
            child: SizedBox(
              height: 85,
              width: 202,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        style: const TextStyle(color: kPrimaryColor),
                        children: [
                          TextSpan(
                            text: "${widget.book?.title}\n",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: widget.user?.name,
                            style: const TextStyle(
                              color: kSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (DonationScreen(
                                    book: widget.book, user: widget.user)))),
                        child: Container(
                          width: 101,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          alignment: Alignment.center,
                          child: const Text('Details'),
                        ),
                      ),
                      Expanded(
                        child: TwoSidesRoundedButtom(
                          text: 'Donate',
                          radious: 29,
                          press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (DonationScreen(
                                      book: widget.book, user: widget.user)))),
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
