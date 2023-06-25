import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pbh_project/reusable_widgets/book_cards.dart';
import 'package:pbh_project/screens/writter_profile/about_me_card.dart';
import 'package:pbh_project/screens/writter_profile/book_card_finalizado.dart';
import 'package:pbh_project/screens/writter_profile/list_view_books.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../utils/app_styles.dart';
import '../book_profile_page/book_info_card.dart';
import '../book_profile_page/book_sinopse_card.dart';
import 'carousel_books.dart';

class WritterMainProfileBanner extends StatefulWidget {
  const WritterMainProfileBanner({Key? key}) : super(key: key);

  @override
  State<WritterMainProfileBanner> createState() =>
      _WritterMainProfileBannerState();
}

class _WritterMainProfileBannerState extends State<WritterMainProfileBanner> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 120,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: const Image(
                image: AssetImage(
                  'assets/images/image_profile.jpg',
                ),
              ),
            ),
          ),
          const AboutMe(
            aboutMe: 'Ola eu sou o Tiaguinho\n'
                'Tou a programar isto para o projeto final\n'
                'Ate agr isto t6a responsivo e a correr bem\n'
                'Isto é apenas um teste\n'
                'Para ver se da scroll ou n',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 240,
              child: CarouselBooks(),
            ),
          ),
        ],
      ),
    );
  }
}
