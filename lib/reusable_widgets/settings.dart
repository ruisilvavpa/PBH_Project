import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/reusable_widgets/settings_menu_widget.dart';
import 'package:pbh_project/screens/settings_page/faqs_page.dart';
import '../resources/strings.dart';
import '../screens/settings_page/about_us_page.dart';
import '../utils/app_styles.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 30, 16, 0),
            child: Text(Strings.kSettingsHeading, style: kTitle1),
          ),
          const SizedBox(
            height: 30,
          ),
          SettingsMenuWidget(
            title: 'FAQ\s',
            icon: Icons.question_mark,
            onPress: () => Get.to(() => FAQPage()),
          ),
          const SizedBox(
            height: 30,
          ),
          SettingsMenuWidget(
            title: 'About us',
            icon: Icons.info,
            onPress: () => Get.to(() => const AboutUsPage()),
          ),
          const SizedBox(
            height: 30,
          ),
          SettingsMenuWidget(
            title: 'Logout',
            icon: Icons.logout_outlined,
            hideArrow: true,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
