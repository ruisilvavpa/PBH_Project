import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pbh_project/reusable_widgets/setting_menu_widget.dart';
import 'package:pbh_project/reusable_widgets/submit_button.dart';

import '../resources/strings.dart';
import '../screens/settings_page/faqs_page.dart';
import '../utils/app_styles.dart';

class BookProfileBanner extends StatefulWidget {
  const BookProfileBanner({super.key});

  @override
  State<BookProfileBanner> createState() => _BookProfileBannerState();
}

class _BookProfileBannerState extends State<BookProfileBanner> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/books.jpg'),
            alignment: Alignment.topCenter,
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * .1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'Khepri',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    children: [TextSpan(text: 'Book Information')]),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: 245,
              width: 282,
              child: Stack(
                children: [
                  Container(
                    height: 221,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 33,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
