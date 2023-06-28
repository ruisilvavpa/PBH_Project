import 'package:flutter/material.dart';
import 'package:pbh_project/controllers/image_controller.dart';
import 'package:pbh_project/reusable_widgets/submit_button.dart';

import '../../controllers/contributions_controller.dart';
import '../../models/user.dart';
import '../../utils/app_styles.dart';

class UserProfileBanner extends StatefulWidget {
  final User? user;
  final VoidCallback? editProfileAction;
  const UserProfileBanner({super.key, this.user, this.editProfileAction});

  @override
  State<UserProfileBanner> createState() => _UserProfileBannerState();
}

class _UserProfileBannerState extends State<UserProfileBanner> {
  ImageController controller = ImageController();
  Image placeholderImage = Image.asset('assets/images/image_profile.jpg');
  ContributionsController contributionController = ContributionsController();
  double total = 0;

  @override
  void initState() {
    super.initState();
    if (widget.user?.imagePath != null) {
      controller.displayImage(widget.user!.imagePath!).then(
          (value) => setState(() => placeholderImage = Image.file(value!)));
    }
    contributionController.getTotalContributions().then((value) => setState(
          () => total = value,
        ));
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
            child: placeholderImage,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(widget.user?.name ?? '', style: kTitle1),
        Text(widget.user?.email ?? '', style: kDescription),
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
              onPressed: widget.editProfileAction, title: 'Edit Profile'),
        ),
      ],
    );
  }
}
