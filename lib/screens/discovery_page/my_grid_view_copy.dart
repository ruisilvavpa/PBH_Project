import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pbh_project/screens/writter_main_profile_page.dart';
import 'package:pbh_project/screens/writter_profile/writter_main_profile_banner.dart';
import 'package:pbh_project/utils/size_configs.dart';

import '../../models/user.dart';
import '../../utils/app_styles.dart';

class MyGridViewCopy extends StatefulWidget {
  ///this is the grid view for the book genres and writters
  final List<User> users;

  /// This is the grid view for the book genres and writers
  const MyGridViewCopy({Key? key, required this.users}) : super(key: key);

  @override
  State<MyGridViewCopy> createState() => _MyGridViewCopyState();
}

class _MyGridViewCopyState extends State<MyGridViewCopy> {
  @override
  Widget build(BuildContext context) {
    final random = Random();
    final List<double> hues = [
      HSVColor.fromColor(const Color.fromRGBO(191, 229, 192, 1)).hue,
      HSVColor.fromColor(const Color.fromRGBO(138, 210, 224, 1)).hue,
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: SizeConfig().calculateCrossAxisCount(context),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.6,
        ),
        primary: false,
        shrinkWrap: true,
        itemCount: widget.users.length, // Replace with actual genre count
        itemBuilder: (context, index) {
          // Select a random hue from the hues list
          final hue = hues[random.nextInt(hues.length)];

          // Generate random saturation value between 0.2 and 0.8
          final saturation = 0.2 + random.nextDouble() * 0.6;

          // Generate random value (lightness) between 0.4 and 0.8
          final value = 0.4 + random.nextDouble() * 0.4;

          // Create color using HSV values
          final randomColor =
              HSVColor.fromAHSV(1.0, hue, saturation, value).toColor();
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WritterMainProfilePage(
                        userId: widget.users[index].id,
                      )));
            },
            child: Card(
              color: randomColor,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    widget.users[index].name,
                    textAlign: TextAlign.center,
                    style: kTitle5,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
