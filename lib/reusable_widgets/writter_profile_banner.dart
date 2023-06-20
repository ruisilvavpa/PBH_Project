import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/resources/strings.dart';
import 'package:pbh_project/reusable_widgets/settings_menu_widget.dart';
import 'package:pbh_project/reusable_widgets/submit_button.dart';

import '../screens/settings_page/faqs_page.dart';
import '../screens/writter_buttons_screens/edit_profile.dart';
import '../utils/app_styles.dart';

class WritterProfileBanner extends StatefulWidget {
  const WritterProfileBanner({
    super.key,
  });

  @override
  State<WritterProfileBanner> createState() => _WritterProfileBannerState();
}

class _WritterProfileBannerState extends State<WritterProfileBanner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: const Image(
              image: AssetImage(
                'assets/images/image_profile.jpg',
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(Strings.kProfileHeading, style: kTitle1),
        Text(Strings.kSubProfileHeading, style: kDescription),
        const SizedBox(
          height: 16,
        ),
        const Text('You already gained 500€', style: kTextAction),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: SubmitButton(
              onPressed: () => Get.to(() => EditProfile()),
              title: 'Edit Profile'),
        ),
        SettingsMenuWidget(
          title: 'My Books',
          icon: Icons.book,
          onPress: () => Get.to(() => FAQPage()),
        ),
      ],
    );
  }
}
