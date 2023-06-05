import 'package:flutter/material.dart';
import 'package:pbh_project/utils/size_configs.dart';

//defaultLogoColor = Color.fromRGBO(191, 229, 192, 1),
//userLogoColor = Color.fromRGBO(138, 210, 224, 1),
//writterLogoColor = Color.fromRGBO(235, 178, 125, 1),

Color kBackgroundColor = Colors.white;
const Color kOfflineBackgroundColor = Color.fromRGBO(191, 229, 192, 1);

const Color kPrimaryColor = Color.fromRGBO(87, 61, 28, 1);

Color kSecondaryColor = Color.fromRGBO(228, 140, 24, 1);

final kTitle = TextStyle(
  fontFamily: 'Khepri',
  fontSize: SizeConfig.blockSizeH! * 7,
  color: kPrimaryColor,
);

const kOnboardingAction = TextStyle(
  fontFamily: 'Khepri',
  color: Color.fromRGBO(87, 61, 28, 1),
);

// KHEPRI FONT STYLES
const kTitle0 = TextStyle(
  fontFamily: 'Khepri',
  fontSize: 30,
  color: Colors.black,
);

const kTitle1 = TextStyle(
  fontFamily: 'Khepri',
  fontSize: 15,
  color: Colors.black,
);

const kTitle2 = TextStyle(
  fontFamily: 'Khepri',
  fontSize: 10,
  color: Colors.black,
);

// ITIM FONT STYLE
final kDescription =
    TextStyle(color: Colors.grey[500], fontFamily: 'Itim', fontSize: 20);

final kBodyText1 = TextStyle(
  fontFamily: 'Itim',
  fontSize: SizeConfig.blockSizeH! * 4.5,
  fontWeight: FontWeight.bold,
  color: kSecondaryColor,
);

const kInputField = TextStyle(
  fontFamily: 'Itim',
  fontSize: 20,
  color: Color.fromRGBO(87, 61, 28, 1),
);

const kTextAction = TextStyle(
  color: Colors.black,
  fontFamily: 'Itim',
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

// BUTTON STYLE
const kButton = TextStyle(
    fontSize: 18,
    fontFamily: 'Khepri',
    fontWeight: FontWeight.bold,
    color: Colors.black);
