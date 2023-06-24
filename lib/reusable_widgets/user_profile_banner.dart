import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/reusable_widgets/submit_button.dart';

import '../models/user.dart';
import '../screens/writter_buttons_screens/edit_profile.dart';
import '../utils/app_styles.dart';

class UserProfileBanner extends StatefulWidget {
  final User? user;
  const UserProfileBanner({super.key, this.user});

  @override
  State<UserProfileBanner> createState() => _UserProfileBannerState(user);
}

class _UserProfileBannerState extends State<UserProfileBanner> {
  final User? user;
  _UserProfileBannerState(this.user);
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
        Text(user?.name ?? '', style: kTitle1),
        Text(user?.email ?? '', style: kDescription),
        const SizedBox(
          height: 16,
        ),
        const Text('You already contributed with 250€', style: kTextAction),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: SubmitButton(
              onPressed: () => Get.to(() => EditProfile(user: user)),
              title: 'Edit Profile'),
        ),
      ],
    );
  }
}
