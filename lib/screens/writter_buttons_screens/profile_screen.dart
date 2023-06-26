import 'package:flutter/material.dart';
import 'package:pbh_project/controllers/profile_controller.dart';
import 'package:pbh_project/reusable_widgets/app_bar.dart';
import 'package:pbh_project/reusable_widgets/settings.dart';
import 'package:pbh_project/reusable_widgets/writter_profile_banner.dart';
import 'package:pbh_project/utils/theme_helper.dart';

import '../../models/user.dart';
import '../../resources/strings.dart';
import '../../reusable_widgets/guest_profile_banner.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //variables
  Color? themeColor;
  User? user;
  Widget banner = const GuestProfileBanner();

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
          banner = WritterProfileBanner(user: user);
        });
      } else {
        setState(() {
          banner = UserProfileBanner(user: user);
        });
      }
    }
    user = user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWBB(title: Strings.kProfileTitle),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            banner,
            const SizedBox(
              height: 32,
            ),
            const Settings(),
          ]),
        ),
      ),
    );
  }
}
