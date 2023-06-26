import 'package:flutter/material.dart';
import 'package:pbh_project/utils/app_styles.dart';

import 'donation_texts_spans.dart';

class InstitutionBookAuthorCard extends StatefulWidget {
  ///this is the card with the name of institution, book
  ///and author's
  const InstitutionBookAuthorCard({
    super.key,
  });

  @override
  State<InstitutionBookAuthorCard> createState() =>
      _InstitutionBookAuthorCardState();
}

class _InstitutionBookAuthorCardState extends State<InstitutionBookAuthorCard> {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //column for the info
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DonationTextSpans(
                  text1: 'Book: ',
                  text2: 'Alice in Wonderland',
                ),
                SizedBox(height: 10),
                DonationTextSpans(
                  text1: 'Institution: ',
                  text2: 'MakeAWish',
                ),
                SizedBox(height: 10),
                DonationTextSpans(
                  text1: 'Author: ',
                  text2: 'Jonh McJohn',
                ),
              ],
            ),
            //image of the book
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/image_profile.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
