import 'package:flutter/material.dart';

import '../../controllers/book_profiles_controller.dart';
import '../../models/books.dart';
import '../../models/user.dart';
import '../../resources/strings.dart';
import '../../reusable_widgets/app_bar.dart';
import '../book_profile_page/book_list_card.dart';

class GridViewBooksScreen extends StatefulWidget {
  final User? user;
  const GridViewBooksScreen({super.key, this.user});

  @override
  State<GridViewBooksScreen> createState() => _GridViewBooksScreenState();
}

class _GridViewBooksScreenState extends State<GridViewBooksScreen> {
//variables
  List<BooksOut> book = [];
  BookProfileController bookProfileController = BookProfileController();

  @override
  void initState() {
    super.initState();

    bookProfileController
        .getMytBooks(widget.user?.id ?? 0)
        .then((value) => setState(
              () => book = value,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Strings.kGridViewName),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 1.11,
                ),
                primary: false,
                shrinkWrap: true,
                itemCount: book.length,
                itemBuilder: (context, index) {
                  BooksOut indexBook = book[index];
                  return BookListCard(book: indexBook, user: widget.user);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
