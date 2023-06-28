import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pbh_project/models/user.dart';
import 'package:pbh_project/reusable_widgets/guest_navbar.dart';
import 'package:pbh_project/reusable_widgets/user_navbar.dart';

import '../../controllers/profile_controller.dart';
import '../../reusable_widgets/writter_navbar.dart';
import '../../utils/theme_helper.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //variables
  Color? themeColor;
  User? user;
  Widget banner = GuestNavBar();

  @override
  void initState() {
    super.initState();
    ThemeHelper().fetchTintColorForCurrentUser().then((value) => setState(
          () => themeColor = value,
        ));
    ProfileController().fetchMe().then((value) => createUserWidget(value));
  }

  void createUserWidget(User? user) {
    if (user != null) {
      if (user.type == 1) {
        setState(() {
          banner = WritterNavBar();
        });
      } else {
        setState(() {
          banner = UserNavBar();
        });
      }
    } else {
      setState(() {
        banner = GuestNavBar();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return banner;
  }
}
