import 'package:flutter/material.dart';
import '../resources/strings.dart';
import '../reusable_widgets/app_bar.dart';
import 'writter_profile/writter_main_profile_banner.dart';

class WritterMainProfilePage extends StatefulWidget {
  const WritterMainProfilePage({Key? key}) : super(key: key);

  @override
  State<WritterMainProfilePage> createState() => _WritterMainProfilePageState();
}

class _WritterMainProfilePageState extends State<WritterMainProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Strings.kBookProfileWritterName),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              SizedBox(height: 20),
              WritterMainProfileBanner(),
            ],
          ),
        ),
      ),
    );
  }
}
