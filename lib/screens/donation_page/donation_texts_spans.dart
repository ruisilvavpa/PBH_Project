import 'package:flutter/material.dart';
import '../../utils/app_styles.dart';

class DonationTextSpans extends StatefulWidget {
  const DonationTextSpans({Key? key, required this.text1, required this.text2})
      : super(key: key);

  final String text1;
  final String text2;

  @override
  State<DonationTextSpans> createState() => _DonationTextSpansState();
}

class _DonationTextSpansState extends State<DonationTextSpans> {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: widget.text1,
        style:
            kTextAction, // Assuming kTextAction is a custom text style defined in AppStyles
        children: [
          TextSpan(
            text: widget.text2,
            style:
                kInfoText, // Assuming kDescription is a custom text style defined in AppStyles
          ),
        ],
      ),
    );
  }
}
