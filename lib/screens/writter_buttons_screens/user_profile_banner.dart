import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/reusable_widgets/submit_button.dart';

import '../../controllers/contributions_controller.dart';
import '../../models/user.dart';
import 'edit_profile.dart';
import '../../utils/app_styles.dart';

class UserProfileBanner extends StatefulWidget {
  final User? user;
  const UserProfileBanner({super.key, this.user});

  @override
  State<UserProfileBanner> createState() => _UserProfileBannerState(user);
}

class _UserProfileBannerState extends State<UserProfileBanner> {
  final User? user;
  _UserProfileBannerState(this.user);

  ContributionsController controller = ContributionsController();
  double total = 0;

  void initState() {
    controller.getTotalContributions().then((value) => setState(
          () => total = value,
        ));
    super.initState();
  }

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
        Text('You already contributed with $total€', style: kTextAction),
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
