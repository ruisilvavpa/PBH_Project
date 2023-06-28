import 'package:flutter/material.dart';

import '../controllers/wishlist_controller.dart';
import '../models/books_out.dart';
import '../models/user.dart';
import '../models/whislist.dart';
import '../resources/strings.dart';
import '../reusable_widgets/app_bar.dart';
import '../utils/app_styles.dart';
import 'book_profile_page/book_profile_screen.dart';
import 'book_profile_page/book_rating.dart';
import 'book_profile_page/two_side_rounded_buttom.dart';

class WishlistScreen extends StatefulWidget {
  //variables
  User? user;
  BooksOut? book;
  WishlistScreen({super.key, this.book, this.user});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistController _wishlistController = WishlistController();

  List<Wishlist> wishlist = [];

  @override
  void initState() {
    _wishlistController
        .getWishlist()
        .then((value) => setState(() => wishlist = value));
    super.initState();
  }

  void deleteFromWishlist(int index) {
    Wishlist item = wishlist[index];
    _wishlistController
        .deleteWishlist(item.id)
        .then((value) => handleDeleteResponse(value));
    super.initState();
  }

  void handleDeleteResponse(int id) {
    wishlist.removeWhere((element) => element.id == id);
    setState(() => wishlist = wishlist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.kWhislistTitle),
      body: ListView.builder(
        itemCount: wishlist.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
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
                  Image.asset(
                    widget.book?.imagePath ?? '',
                    width: 150,
                  ),
                  Positioned(
                    top: 10,
                    right: 90,
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete_forever),
                          onPressed: () => deleteFromWishlist(index),
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
                                    text: "${widget.book?.title}",
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
                                        builder: (context) =>
                                            (BookProfileScreen(
                                              user: widget.user,
                                              book: widget.book,
                                            )))),
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
                                  press: () => {},
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
            ),
          );
        },
      ),
    );
  }
}
