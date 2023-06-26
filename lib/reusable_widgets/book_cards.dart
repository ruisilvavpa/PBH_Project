import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String bookTitle;
  final String authorName;
  final String category;
  final VoidCallback onRatePressed;

  const BookCard({
    Key? key,
    required this.bookTitle,
    required this.authorName,
    required this.category,
    required this.onRatePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          bookTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Author: $authorName'),
        trailing: IconButton(
          icon: const Icon(Icons.star_border),
          onPressed: onRatePressed,
        ),
        onTap: () {
          // Implement your book details navigation here
        },
      ),
    );
  }
}
