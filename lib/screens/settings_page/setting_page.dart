import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/screens/settings_page/about_us_page.dart';
import 'package:pbh_project/screens/settings_page/faqs_page.dart';
import 'package:pbh_project/screens/settings_page/notifications_page.dart';
import '../../reusable_widgets/app_bar.dart';
import '../../reusable_widgets/setting_menu_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWBB(
        title: 'Settings',
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SettingsMenuWidget(
            title: 'Notifications',
            icon: Icons.notifications,
            onPress: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationsPage(),
                  ));
            },
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
            title: 'Contact us',
            icon: Icons.phone_callback,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
