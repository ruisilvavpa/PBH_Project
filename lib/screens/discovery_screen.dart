import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pbh_project/reusable_widgets/app_bar.dart';
import 'package:pbh_project/screens/book_profile_page/book_profile_screen.dart';
import '../reusable_widgets/author_cards.dart';
import '../reusable_widgets/book_cards.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({Key? key}) : super(key: key);

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  int _selectedOption = 0;

  final List<String> _writers = ['Escritor 1', 'Escritor 2', 'Escritor 3'];
  final List<String> _books = ['Livro 1', 'Livro 2', 'Livro 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWBB(
        title: 'Discover',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: CupertinoSlidingSegmentedControl<int>(
              groupValue: _selectedOption,
              children: const {
                0: Text('Writters'),
                1: Text('Books'),
              },
              onValueChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              child: _selectedOption == 0
                  ? _buildWritersList()
                  : _buildBooksList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWritersList() {
    return ListView.builder(
      itemCount: _writers.length,
      itemBuilder: (context, index) {
        String writer = _writers[index];

        return const AuthorCard(
          authorName: 'J.K.Rowling',
          bookCount: 10,
          profilePhotoUrl:
              'https://cdn.shopify.com/s/files/1/0450/0717/5837/articles/JKR-Children_s-Credit-Debra-Hurford-Brown_net_8b2895a1-a05b-4667-be47-96e940b22438.png?v=1666809722',
        );
      },
    );
  }

  Widget _buildBooksList() {
    return ListView.builder(
      itemCount: _books.length,
      itemBuilder: (context, index) {
        String book = _books[index];

        return BookCard(
          authorName: 'J.K.Rowlling',
          bookTitle: 'Harry Potter',
          category: 'Fantasia',
          onRatePressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookProfileScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
