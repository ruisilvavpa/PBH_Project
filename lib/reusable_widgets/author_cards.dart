import 'package:flutter/material.dart';

class AuthorCard extends StatelessWidget {
  final String profilePhotoUrl;
  final String authorName;
  final int bookCount;

  const AuthorCard({
    Key? key,
    required this.profilePhotoUrl,
    required this.authorName,
    required this.bookCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(profilePhotoUrl),
        ),
        title: Text(
          authorName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Books published: $bookCount'),
        trailing: IconButton(
          icon: Icon(Icons.star_border),
          onPressed: () {
            // Implement your rating functionality here
          },
        ),
        onTap: () {
          // Implement your author profile navigation here
        },
      ),
    );
  }
}
