import 'package:flutter/material.dart';
import 'package:pbh_project/reusable_widgets/app_bar.dart';
import 'package:pbh_project/reusable_widgets/settings.dart';
import 'package:pbh_project/reusable_widgets/writter_profile_banner.dart';
import 'package:pbh_project/utils/theme_helper.dart';

import '../resources/strings.dart';

class WritterProfileFromUserView extends StatefulWidget {
  const WritterProfileFromUserView({super.key});

  @override
  State<WritterProfileFromUserView> createState() =>
      _WritterProfileFromUserViewState();
}

class _WritterProfileFromUserViewState
    extends State<WritterProfileFromUserView> {
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
