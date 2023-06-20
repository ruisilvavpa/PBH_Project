import 'package:flutter/material.dart';
import 'package:pbh_project/screens/discovery_page/results_not_found.dart';

class GridSearchScreen extends StatefulWidget {
  const GridSearchScreen({Key? key}) : super(key: key);

  @override
  State<GridSearchScreen> createState() => _GridSearchScreenState();
}

class _GridSearchScreenState extends State<GridSearchScreen> {
  final List<String> bookGenres = [
    'Mystery/Thriller',
    'Romance',
    'Science Fiction/Fantasy',
    'Historical Fiction',
    'Biography/Memoir',
    'Self-Help/Personal Development',
    'Young Adult',
    'Children\'s Books',
    'Business/Entrepreneurship',
    'Travel',
    'Horror',
    'Comics/Graphic Novels',
    'Classic Literature',
    'Poetry',
    'Science/Nature',
  ];
  List<String> itemsGridSearch = [];
  TextEditingController _textController = TextEditingController();
  FocusNode _textFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height, // Set a fixed height
          child: Stack(
            children: [
              Positioned(
                top: 60,
                right: 20,
                left: 20,
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 24,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, bottom: 2),
                            child: TextFormField(
                              controller: _textController,
                              focusNode: _textFocusNode,
                              onFieldSubmitted: (value) async {
                                setState(() {
                                  itemsGridSearch = bookGenres
                                      .where((e) => e
                                          .toLowerCase()
                                          .contains(value.toLowerCase()))
                                      .toList();
                                  if (_textController.text.isNotEmpty &&
                                      itemsGridSearch.isEmpty) {
                                    print('itemsgridsearch lgth'
                                        ' ${itemsGridSearch.length}');
                                  }
                                });
                              },
                              obscureText: false,
                              decoration: const InputDecoration(
                                hintText: 'Search for authors or books...',
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                              style: const TextStyle(
                                fontFamily: 'Itim',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _textController.text.isNotEmpty && itemsGridSearch.isEmpty
                  ? Positioned(
                      top: 70,
                      right: 10,
                      left: 10,
                      child: const ResultsNotFound(),
                    )
                  : Positioned(
                      top: 70,
                      right: 10,
                      left: 10,
                      child: const ResultsNotFound(),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
