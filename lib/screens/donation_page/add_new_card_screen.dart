import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbh_project/screens/donation_page/card_month_input_formatter.dart';

import '../../resources/strings.dart';
import '../../utils/app_styles.dart';
import 'card_enum.dart';
import 'card_number_input_formatter.dart';
import 'card_utils.dart';
import 'info_banner.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  TextEditingController cardNumberController = TextEditingController();

  CardType cardType = CardType.Invalid;

  void getCardTypeFrmNumber() {
    if (cardNumberController.text.length <= 6) {
      String input = CardUtils.getCleanedNumber(cardNumberController.text);
      CardType type = CardUtils.getCardTypeFrmNumber(input);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }

  @override
  void initState() {
    cardNumberController.addListener(
      () {
        getCardTypeFrmNumber();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    cardNumberController.dispose();
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
          children: [
            Column(
              children: [
                InfoBanner(
                  bannerInfo: Strings.kDonationPaymentBanner,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: kInputField,
                  controller: cardNumberController,
                  cursorColor: writterLogoColor,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                    CardNumberInputFormatter(),
                  ],
                  decoration: InputDecoration(
                    labelText: Strings.kDonationPaymentCard,
                    labelStyle: kInfoText,
                    filled: true,
                    fillColor: writterLogoColor.withOpacity(0.3),
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                    suffix: CardUtils.getCardIcon(cardType),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: kInputField,
                  cursorColor: writterLogoColor,
                  decoration: InputDecoration(
                    labelText: Strings.kDonationPaymentHolder,
                    labelStyle: kInfoText,
                    filled: true,
                    helperText: " ",
                    fillColor: writterLogoColor.withOpacity(0.3),
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: kInputField,
                        cursorColor: writterLogoColor,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                        decoration: InputDecoration(
                          labelText: Strings.kDonationPaymentCVV,
                          labelStyle: kInfoText,
                          filled: true,
                          helperText: " ",
                          fillColor: writterLogoColor.withOpacity(0.3),
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(23.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        style: kInputField,
                        cursorColor: writterLogoColor,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                          CardMonthInputFormatter()
                        ],
                        decoration: InputDecoration(
                          labelText: Strings.kDonationPaymentDate,
                          labelStyle: kInfoText,
                          filled: true,
                          helperText: " ",
                          fillColor: writterLogoColor.withOpacity(0.3),
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(23.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
