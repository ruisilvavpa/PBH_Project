import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/discovery_screen.dart';
import '../screens/login/login_page.dart';
import '../screens/wishlist_screen.dart';
import '../screens/writter_buttons_screens/add_post_screen.dart';
import '../screens/writter_buttons_screens/profile_screen.dart';

class WritterNavBar extends StatelessWidget {
  WritterNavBar({
    super.key,
  });

  final tabBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home), label: "Discover"),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.book), label: "Add Post"),
    const BottomNavigationBarItem(icon: Icon(Icons.list), label: "Profile")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: tabBarItems,
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return const DiscoveryScreen();

            case 1:
              return AddPostPage();

            case 2:
              return const ProfileScreen();
          }

          return const LoginPage();
        },
      ),
    );
  }
}
