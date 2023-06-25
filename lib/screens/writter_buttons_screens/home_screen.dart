import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pbh_project/screens/login/login_page.dart';
import 'package:pbh_project/screens/writter_buttons_screens/add_post_screen.dart';
import 'package:pbh_project/screens/writter_buttons_screens/profile_screen.dart';

import '../discovery_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final tabBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home), label: "Discover"),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.book), label: "Post"),
    const BottomNavigationBarItem(icon: Icon(Icons.list), label: "Profile")
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: tabBarItems,
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return const DiscoveryScreen();

          case 1:
            return const AddPostPage();

          case 2:
            return const ProfileScreen();
        }

        return const LoginPage();
      },
    );
  }
}
