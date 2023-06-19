import 'package:flutter/material.dart';
import 'package:pbh_project/resources/strings.dart';
import 'package:pbh_project/reusable_widgets/submit_button.dart';

import '../utils/app_styles.dart';

class UserProfileBanner extends StatefulWidget {
  const UserProfileBanner({
    super.key,
  });

  @override
  State<UserProfileBanner> createState() => _UserProfileBannerState();
}

class _UserProfileBannerState extends State<UserProfileBanner> {
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
        const Text('You already contributed with 250€', style: kTextAction),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: SubmitButton(onPressed: () {}, title: 'Edit Profile'),
        ),
      ],
    );
  }
}
