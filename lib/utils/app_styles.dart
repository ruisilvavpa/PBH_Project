import 'package:flutter/material.dart';
import 'package:pbh_project/utils/size_configs.dart';

//defaultLogoColor = Color.fromRGBO(191, 229, 192, 1),
//userLogoColor = Color.fromRGBO(138, 210, 224, 1),
//writterLogoColor = Color.fromRGBO(235, 178, 125, 1),

Color kPrimaryColor = Color.fromRGBO(87, 61, 28, 1);
Color kSecondaryColor = Color.fromRGBO(228, 140, 24, 1);

final kTitle = TextStyle(
  fontFamily: 'Khepri',
  fontSize: SizeConfig.blockSizeH! * 7,
  color: kPrimaryColor,
);

final kBodyText1 = TextStyle(
  fontFamily: 'Itim',
  fontSize: SizeConfig.blockSizeH! * 4.5,
  fontWeight: FontWeight.bold,
  color: kSecondaryColor,
);
