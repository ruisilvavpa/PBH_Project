import 'package:flutter/material.dart';
import '../../utils/app_styles.dart';

class BookRating extends StatelessWidget {
  final double score;
  const BookRating({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 50,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(3, 7),
            blurRadius: 20,
            color: kshadowcolor.withOpacity(.5),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.amber,
            size: 15,
          ),
          const SizedBox(height: 5),
          Text(
            '$score',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
