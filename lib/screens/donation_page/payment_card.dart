import 'package:flutter/material.dart';
import 'package:pbh_project/resources/strings.dart';
import 'package:pbh_project/reusable_widgets/input_fields.dart';
import 'package:pbh_project/screens/donation_page/card_donation.dart';
import 'package:pbh_project/screens/donation_page/info_banner.dart';
import 'package:pbh_project/utils/app_styles.dart';

class PaymentCard extends StatefulWidget {
  ///this is the card with the name of institution, book
  ///and author's
  const PaymentCard({
    super.key,
  });

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
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
            AddNewCardScreen(),
          ],
        ),
      ),
    );
  }
}
