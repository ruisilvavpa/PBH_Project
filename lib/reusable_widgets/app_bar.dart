import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(235, 178, 125, 1),
      shadowColor: Colors.transparent,
      leading: const BackButton(
        color: Colors.black,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Khepri',
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBarWBB extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBarWBB({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(235, 178, 125, 1),
      shadowColor: Colors.transparent,
      leading: const BackButton(
        color: Color.fromRGBO(235, 178, 125, 1),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Khepri',
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
