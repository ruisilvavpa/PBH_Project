import 'package:flutter/material.dart';
import '../resources/strings.dart';
import '../reusable_widgets/app_bar.dart';
import 'book_profile_page/book_profile_banner.dart';
import '../utils/theme_helper.dart';

class BookProfileScreen extends StatefulWidget {
  const BookProfileScreen({super.key});

  @override
  State<BookProfileScreen> createState() => _BookProfileScreenState();
}

class _BookProfileScreenState extends State<BookProfileScreen> {
  Color? themeColor;
  @override
  void initState() {
    ThemeHelper().fetchTintColorForCurrentUser().then((value) => setState(
          () => themeColor = value,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Strings.kBookProfileTitle),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: const [
            SizedBox(height: 20),
            BookProfileBanner(),
            SizedBox(
              height: 32,
            ),
          ]),
        ),
      ),
    );
  }
}
