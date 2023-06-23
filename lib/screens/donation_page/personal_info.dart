import 'package:flutter/material.dart';
import 'package:pbh_project/resources/strings.dart';
import 'package:pbh_project/reusable_widgets/input_fields.dart';
import 'package:pbh_project/screens/donation_page/info_banner.dart';
import 'package:pbh_project/utils/app_styles.dart';

class PersonalInformation extends StatefulWidget {
  ///this is the card with the name of institution, book
  ///and author's
  const PersonalInformation({
    super.key,
  });

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  TextEditingController _textController1 = TextEditingController();
  TextEditingController _textController2 = TextEditingController();
  TextEditingController _textController3 = TextEditingController();
  @override
  void initState() {
    super.initState();
    _textController1 = TextEditingController();
    _textController2 = TextEditingController();
    _textController3 = TextEditingController();
  }

  //Disposes the text controller
  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    _textController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kBackgroundColor,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InfoBanner(
              bannerInfo: Strings.kDonationPersonalInfo,
            ),
            const SizedBox(height: 20),
            InputTextFieldWidget(_textController1, Strings.kFieldName,
                Icons.person_3_rounded, false),
            const SizedBox(height: 10),
            InputTextFieldWidget(_textController2, Strings.kFieldNIF,
                Icons.person_3_rounded, false),
            const SizedBox(height: 10),
            InputTextFieldWidget(_textController3, Strings.kFieldAddress,
                Icons.person_3_rounded, false),
          ],
        ),
      ),
    );
  }
}
