import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final tabBarItems = [
      const BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home), label: "Discover"),
      const BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.book), label: "Post"),
      const BottomNavigationBarItem(icon: Icon(Icons.list), label: "Profile")
    ];

    return BottomNavigationBar(
      items: tabBarItems,
    );
  }
}
