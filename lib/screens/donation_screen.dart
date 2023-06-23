import 'package:flutter/material.dart';
import 'package:pbh_project/reusable_widgets/app_bar.dart';
import 'package:pbh_project/screens/donation_page/donation_amount_card.dart';
import 'package:pbh_project/screens/donation_page/payment.dart';
import 'package:pbh_project/screens/donation_page/personal_info.dart';
import 'donation_page/institution_book_author.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Donation Page',
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InstitutionBookAuthorCard(),
                      const SizedBox(height: 10.0),
                      PersonalInformation(),
                      const SizedBox(height: 10.0),
                      Payment(),
                      const SizedBox(height: 10.0),
                      DonationAmountCard(),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
