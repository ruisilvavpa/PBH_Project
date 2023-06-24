import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pbh_project/screens/book_profile_page/book_profile_banner.dart';
import 'package:pbh_project/reusable_widgets/loading_overlay.dart';
import 'package:pbh_project/screens/book_profile_screen.dart';
import 'package:pbh_project/screens/discovery_screen.dart';
import 'package:pbh_project/screens/donation_page/card_donation.dart';
import 'package:pbh_project/screens/donation_screen.dart';
import 'package:pbh_project/screens/onboarding/onboarding_screen.dart';
import 'package:pbh_project/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        cardColor: const Color.fromRGBO(191, 229, 192, 1),
      ),
      home: LoadingOverlay(
        child: DonationScreen(),
      ),
    );
  }
}
