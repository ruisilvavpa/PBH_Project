import 'package:flutter/material.dart';

//Onborading Page Size Configuration
class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeH;
  static double? blockSizeV;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeH = screenWidth! / 100;
    blockSizeV = screenHeight! / 100;
  }

  /// this functions changes the count of items from a grid view
  /// to match a screen size
  int calculateCrossAxisCount(context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      return 2; // For smaller screens, show 2 columns
    } else if (screenWidth < 900) {
      return 3; // For medium-sized screens, show 3 columns
    } else {
      return 4; // For larger screens, show 4 columns
    }
  }
}
