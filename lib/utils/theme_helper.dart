import 'package:flutter/material.dart';
import 'package:pbh_project/utils/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeHelper {
  Future<Color> fetchTintColorForCurrentUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    int userType = sharedPreferences.getInt('userType') ?? 0;

    switch (userType) {
      case 0:
        return userLogoColor;
      case 1:
        return defaultLogoColor;
      case 2:
        return writterLogoColor;
    }

    return Colors.blue;
  }
}
