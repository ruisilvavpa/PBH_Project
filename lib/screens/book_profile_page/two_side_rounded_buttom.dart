import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class TwoSidesRoundedButtom extends StatefulWidget {
  final String text;
  final double radious;
  final Function press;
  const TwoSidesRoundedButtom(
      {Key? key,
      required this.text,
      required this.radious,
      required this.press})
      : super(key: key);

  @override
  State<TwoSidesRoundedButtom> createState() => _TwoSidesRoundedButtomState();
}

class _TwoSidesRoundedButtomState extends State<TwoSidesRoundedButtom> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.press,
      child: Container(
        alignment: Alignment.center,

        padding: const EdgeInsets.symmetric(vertical: 10),

        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.radious),
            bottomRight: Radius.circular(widget.radious),
          ),
        ),
        child: Text(

          widget.text,
          style: const TextStyle(color: Colors.white),

        ),
      ),
    );
  }
}
