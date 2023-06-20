import 'package:flutter/material.dart';
import 'package:pbh_project/reusable_widgets/app_bar.dart';
import 'package:pbh_project/reusable_widgets/settings.dart';
import 'package:pbh_project/reusable_widgets/user_profile_banner.dart';
import 'package:pbh_project/reusable_widgets/writter_profile_banner.dart';
import 'package:pbh_project/utils/theme_helper.dart';

import '../../resources/strings.dart';
import '../../reusable_widgets/guest_profile_banner.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Color? themeColor;
  @override
  void initState() {
    ThemeHelper().fetchTintColorForCurrentUser().then((value) => setState(
          () => themeColor = value,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWBB(title: Strings.kProfileTitle),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: const [
            WritterProfileBanner(),
            SizedBox(
              height: 32,
            ),
            Settings(),
          ]),
        ),
      ),
    );
  }
}
