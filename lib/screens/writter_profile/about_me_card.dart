import 'package:flutter/material.dart';

import '../../resources/strings.dart';
import '../../utils/app_styles.dart';

class AboutMe extends StatefulWidget {
  final String aboutMe;
  const AboutMe({super.key, required this.aboutMe});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(Strings.kBioProfileBody, style: kTitle3),
                    const SizedBox(height: 5.0),
                    Text(widget.aboutMe, style: kTextAction),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
