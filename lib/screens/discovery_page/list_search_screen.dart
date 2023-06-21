import 'package:flutter/material.dart';
import 'package:pbh_project/screens/discovery_page/my_list_view.dart';
import 'package:pbh_project/screens/discovery_page/results_not_found.dart';
import 'package:pbh_project/screens/discovery_page/start_typing_widget.dart';
import 'package:pbh_project/screens/home_screen.dart';
import 'package:pbh_project/utils/app_styles.dart';

import '../../resources/strings.dart';

class ListSearchScreen extends StatefulWidget {
  const ListSearchScreen({Key? key}) : super(key: key);

  @override
  State<ListSearchScreen> createState() => _ListSearchScreenState();
}

class _ListSearchScreenState extends State<ListSearchScreen> {
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
  final FocusNode _textFocusNode = FocusNode();

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
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 120,
                left: 0,
                right: 0,
                bottom: 0,
                child: _textController.text.isEmpty
                    ? const StartTyping()
                    : (itemsGridSearch.isEmpty
                        ? const ResultsNotFound()
                        : MyListView()),
              ),
              Positioned(
                top: 60,
                right: 10,
                left: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: writterLogoColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: kBackgroundColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 1),
                    Expanded(
                      flex: 48,
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color: writterLogoColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: kBackgroundColor,
                                size: 24,
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, bottom: 2),
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
                                    decoration: const InputDecoration(
                                      hintText: Strings.kFieldSearch,
                                      hintStyle:
                                          TextStyle(color: kBackgroundColor),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                    style: const TextStyle(
                                      color: kBackgroundColor,
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
