import 'package:flutter/material.dart';
import '../../resources/strings.dart';
import '../../utils/app_styles.dart';
import '../writter_main_profile_page.dart';

class BookInfoCard extends StatefulWidget {
  final double rating;
  final String writterName;
  const BookInfoCard(
      {super.key, required this.rating, required this.writterName});

  @override
  State<BookInfoCard> createState() => _BookInfoCardState();
}

class _BookInfoCardState extends State<BookInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const Text(
                      Strings.kBookProfileRating,
                      style: TextStyle(
                        fontFamily: 'Khepri',
                        fontSize: 15,
                        color: writterLogoColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text('${widget.rating}', style: kTitle2)
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    const Text(
                      Strings.kBookProfileWritterName,
                      style: TextStyle(
                        fontFamily: 'Khepri',
                        fontSize: 15,
                        color: writterLogoColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const WritterMainProfilePage(),
                          ),
                        );
                      },
                      child: Text(widget.writterName, style: kTitle2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
