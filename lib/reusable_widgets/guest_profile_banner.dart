import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/resources/strings.dart';
import 'package:pbh_project/reusable_widgets/sign_in_option.dart';
import 'package:pbh_project/reusable_widgets/submit_button.dart';
import 'package:pbh_project/screens/writter_buttons_screens/edit_profile.dart';

import '../utils/app_styles.dart';

class GuestProfileBanner extends StatefulWidget {
  const GuestProfileBanner({
    super.key,
  });

  @override
  State<GuestProfileBanner> createState() => _GuestProfileBannerState();
}

class _GuestProfileBannerState extends State<GuestProfileBanner> {
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
        const Text(Strings.kGuestProfileHeading, style: kTitle1),
        const SizedBox(
          height: 20,
        ),
        signInOption(context: context),
      ],
    );
  }
}
