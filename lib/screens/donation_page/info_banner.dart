import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({
    Key? key,
    required this.bannerInfo,
  }) : super(key: key);

  final String bannerInfo;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: writterLogoColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 5,
        ),
        child: Center(
          child: Text(
            bannerInfo,
            style: kTitle1,
          ),
        ),
      ),
    );
  }
}
