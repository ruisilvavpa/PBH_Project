import 'package:flutter/material.dart';
import 'package:pbh_project/controllers/profile_controller.dart';
import '../controllers/show_profile_controller.dart';
import '../models/user.dart';
import '../resources/strings.dart';
import '../reusable_widgets/app_bar.dart';
import 'writter_profile/writter_main_profile_banner.dart';

class WritterMainProfilePage extends StatefulWidget {
  final int userId;

  const WritterMainProfilePage({Key? key, required this.userId})
      : super(key: key);

  @override
  State<WritterMainProfilePage> createState() => _WritterMainProfilePageState();
}

class _WritterMainProfilePageState extends State<WritterMainProfilePage> {
  final ShowProfileController userController = ShowProfileController();

  User? user;

  @override
  void initState() {
    super.initState();
    userController.getUserById(widget.userId).then((results) {
      setState(() {
        user = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: user?.name ?? ''),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              WritterMainProfileBanner(
                user: user,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
