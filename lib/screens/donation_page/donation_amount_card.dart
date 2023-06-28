import 'package:flutter/material.dart';
import 'package:pbh_project/controllers/donation_controller.dart';
import 'package:pbh_project/screens/donation_page/info_banner.dart';

import '../../models/books_out.dart';
import '../../models/donation.dart';
import '../../resources/strings.dart';
import '../../utils/app_styles.dart';

class DonationAmountCard extends StatefulWidget {
  final BooksOut? book;

  const DonationAmountCard({super.key, this.book});

  @override
  DonationAmountCardState createState() => DonationAmountCardState();
}

class DonationAmountCardState extends State<DonationAmountCard> {
  double donationAmount = 0.0;
  TextEditingController _textController = TextEditingController();
  DonationController controller = DonationController();

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void updateDonationAmount(double value) {
    setState(() {
      donationAmount = value;
      _textController.text = donationAmount.toStringAsFixed(2);
    });
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const InfoBanner(bannerInfo: Strings.kDonationAmount),
            const SizedBox(height: 30.0),
            SliderTheme(
              data: const SliderThemeData(
                trackHeight: 20,
                thumbColor: writterLogoColor,
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 11,
                  elevation: 0,
                ),
                overlayShape: RoundSliderOverlayShape(
                  overlayRadius: 0,
                ),
                overlayColor: Colors.transparent,
                activeTrackColor: writterLogoColor,
                activeTickMarkColor: Colors.transparent,
              ),
              child: Slider(
                value: donationAmount,
                min: 0.0,
                max: 20.0,
                divisions: 20,
                onChanged: (double value) {
                  updateDonationAmount(value);
                },
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 60,
              width: 105,
              child: TextFormField(
                controller: _textController,
                style: kInputField,
                cursorColor: writterLogoColor,
                autocorrect: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.euro_rounded,
                    color: writterLogoColor,
                  ),
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 17),
                  filled: true,
                  helperText: " ",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: writterLogoColor.withOpacity(0.3),
                  contentPadding: const EdgeInsets.fromLTRB(20, 10.0, 0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none)),
                ),
                onChanged: (String value) {
                  setState(() {
                    donationAmount = double.tryParse(value) ?? 0.0;
                    if (donationAmount > 20.0) {
                      donationAmount = 20.0;
                      _textController.text = donationAmount.toStringAsFixed(2);
                    }
                  });
                },
              ),
            ),
            InkWell(
              onTap: () {
                Donation donation =
                    Donation(widget.book?.bookId ?? 0, donationAmount);
                controller.donate(donation).then((value) {
                  if (value) {
                    Navigator.pop(context);
                  }
                });
              },
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: writterLogoColor),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      Strings.kDonationSubmit,
                      style: kInfoText,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
