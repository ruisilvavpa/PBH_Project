import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pbh_project/reusable_widgets/loading_overlay.dart';
import 'package:pbh_project/screens/discovery_page/grid_search_screen.dart';
import 'package:pbh_project/screens/discovery_screen.dart';
import 'package:pbh_project/screens/home_screen.dart';
import 'package:pbh_project/screens/onboarding/onboarding_screen.dart';

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
        child: HomeScreen(),
      ),
    );
  }
}
