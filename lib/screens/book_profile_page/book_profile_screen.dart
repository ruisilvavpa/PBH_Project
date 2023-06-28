import 'package:flutter/material.dart';
import 'package:pbh_project/controllers/book_profile_controller.dart';

import '../../models/user.dart';
import '../../resources/strings.dart';
import '../../reusable_widgets/app_bar.dart';
import 'book_profile_banner.dart';
import '../../reusable_widgets/settings.dart';
import '../writter_profile/writter_profile_banner.dart';
import '../../utils/theme_helper.dart';

class BookProfileScreen extends StatefulWidget {
  final int bookId;

  const BookProfileScreen({required this.bookId, Key? key}) : super(key: key);

  @override
  State<BookProfileScreen> createState() => _BookProfileScreenState();
}

class _BookProfileScreenState extends State<BookProfileScreen> {
  BookProfileController writterController = BookProfileController();
  User? user;

  Color? themeColor;
  @override
  void initState() {
    ThemeHelper().fetchTintColorForCurrentUser().then((value) => setState(
          () => themeColor = value,
        ));
    writterController.getWritterByBook(widget.bookId).then((value) {
      setState(() {
        user = value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    writterController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: user?.name ?? 'Unknown Author'),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(height: 20),
            BookProfileBanner(
              bookId: widget.bookId,
            ),
            SizedBox(
              height: 32,
            ),
          ]),
        ),
      ),
    );
  }
}
