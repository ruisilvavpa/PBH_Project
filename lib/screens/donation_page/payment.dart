import 'package:flutter/material.dart';
import 'package:pbh_project/resources/strings.dart';
import 'package:pbh_project/reusable_widgets/input_fields.dart';
import 'package:pbh_project/screens/donation_page/info_banner.dart';
import 'package:pbh_project/utils/app_styles.dart';

class Payment extends StatefulWidget {
  ///this is the card with the name of institution, book
  ///and author's
  const Payment({
    super.key,
  });

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  TextEditingController _textController1 = TextEditingController();
  TextEditingController _textController2 = TextEditingController();
  TextEditingController _textController3 = TextEditingController();
  TextEditingController _textController4 = TextEditingController();
  @override
  void initState() {
    super.initState();
    _textController1 = TextEditingController();
    _textController2 = TextEditingController();
    _textController3 = TextEditingController();
    _textController4 = TextEditingController();
  }

  //Disposes the text controller
  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    _textController3.dispose();
    _textController4.dispose();
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
          mainAxisSize: MainAxisSize.min,
          children: [
            InfoBanner(
              bannerInfo: Strings.kDonationPaymentBanner,
            ),
            const SizedBox(height: 20),
            InputTextFieldWidget(_textController1,
                Strings.kDonationPaymentHolder, Icons.person_3_rounded, false),
            const SizedBox(height: 10),
            InputTextFieldWidget(_textController2, Strings.kDonationPaymentCard,
                Icons.person_3_rounded, false),
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: InputTextFieldWidget(
                      _textController3,
                      Strings.kDonationPaymentDate,
                      Icons.person_3_rounded,
                      false),
                ),
                Flexible(
                  child: InputTextFieldWidget(
                      _textController4,
                      Strings.kDonationPaymentCVV,
                      Icons.person_3_rounded,
                      false),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
