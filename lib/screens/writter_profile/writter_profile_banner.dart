import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/reusable_widgets/settings_menu_widget.dart';
import 'package:pbh_project/reusable_widgets/submit_button.dart';
import 'package:pbh_project/screens/writter_buttons_screens/see_my_books_screen.dart';

import '../../controllers/image_controller.dart';
import '../../models/user.dart';
import '../../utils/app_styles.dart';

class WritterProfileBanner extends StatefulWidget {
  final User? user;
  final VoidCallback? editProfileAction;
  const WritterProfileBanner({super.key, this.user, this.editProfileAction});

  @override
  State<WritterProfileBanner> createState() => _WritterProfileBannerState();
}

class _WritterProfileBannerState extends State<WritterProfileBanner> {
  ImageController controller = ImageController();
  Image placeholderImage = Image.asset('assets/images/image_profile.jpg');

  @override
  void initState() {
    super.initState();
    if (widget.user?.imagePath != null) {
      controller.displayImage(widget.user!.imagePath!).then(
          (value) => setState(() => placeholderImage = Image.file(value!)));
    }
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
        const Text('You already gained 500€', style: kTextAction),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: SubmitButton(
            title: 'Edit Profile',
            onPressed: widget.editProfileAction,
          ),
        ),
        SettingsMenuWidget(
          title: 'My Books',
          icon: Icons.book,
          onPress: () => Get.to(() => SeeMyBooks()),
        ),
      ],
    );
  }
}
