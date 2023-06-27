import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/controllers/contributions_controller.dart';
import 'package:pbh_project/resources/strings.dart';
import 'package:pbh_project/reusable_widgets/settings_menu_widget.dart';
import 'package:pbh_project/reusable_widgets/submit_button.dart';
import 'package:pbh_project/screens/writter_buttons_screens/see_my_books_screen.dart';

import '../../models/user.dart';
import '../discovery_page/my_grid_view_copy.dart';
import '../grid_view_books/grid_view_books_screen.dart';
import '../settings_page/faqs_page.dart';
import 'edit_profile.dart';
import '../../utils/app_styles.dart';

class WritterProfileBanner extends StatefulWidget {
  final User? user;
  const WritterProfileBanner({super.key, this.user});

  @override
  State<WritterProfileBanner> createState() => _WritterProfileBannerState(user);
}

class _WritterProfileBannerState extends State<WritterProfileBanner> {
  User? user;
  _WritterProfileBannerState(this.user);
  ContributionsController controller = ContributionsController();
  double total = 0;

  @override
  void initState() {
    controller.getTotalDonations().then((value) => setState(
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
        Text('You already gained $total€', style: kTextAction),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: SubmitButton(
              onPressed: () => Get.to(() => EditProfile(user: user)),
              title: 'Edit Profile'),
        ),
        SettingsMenuWidget(
          title: 'My Books',
          icon: Icons.book,
          onPress: () => Get.to(() => GridViewBooksScreen()),
        ),
      ],
    );
  }
}
