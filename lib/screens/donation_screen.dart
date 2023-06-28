import 'package:flutter/material.dart';
import 'package:pbh_project/reusable_widgets/app_bar.dart';
import 'package:pbh_project/screens/donation_page/add_new_card_screen.dart';
import 'package:pbh_project/screens/donation_page/donation_amount_card.dart';
import 'package:pbh_project/screens/donation_page/personal_info_card.dart';
import '../models/books_out.dart';
import '../models/user.dart';
import 'donation_page/institution_book_author_card.dart';

class DonationScreen extends StatefulWidget {
  final BooksOut? book;
  final User? user;
  const DonationScreen({super.key, this.book, this.user});

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
                      InstitutionBookAuthorCard(
                          book: widget.book, user: widget.user),
                      const SizedBox(height: 10.0),
                      PersonalInformationCard(),
                      const SizedBox(height: 10.0),
                      AddNewCardScreen(),
                      const SizedBox(height: 10.0),
                      DonationAmountCard(book: widget.book),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
