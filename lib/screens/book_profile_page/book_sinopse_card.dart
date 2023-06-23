import 'package:flutter/material.dart';

import '../../resources/strings.dart';
import '../../utils/app_styles.dart';

class BookSinopseCard extends StatefulWidget {
  final String sinopse;
  const BookSinopseCard({super.key, required this.sinopse});

  @override
  State<BookSinopseCard> createState() => _BookSinopseCardState();
}

class _BookSinopseCardState extends State<BookSinopseCard> {
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      Strings.kBookProfileSinopse,
                      style: TextStyle(
                        fontFamily: 'Khepri',
                        fontSize: 15,
                        color: writterLogoColor,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text('${widget.sinopse}\n', style: kTextAction),
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
