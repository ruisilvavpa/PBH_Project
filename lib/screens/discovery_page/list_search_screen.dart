import 'package:flutter/material.dart';
import 'package:pbh_project/controllers/all_books_controller.dart';
import 'package:pbh_project/models/books_out.dart';
import 'package:pbh_project/models/items_for_search.dart';
import 'package:pbh_project/screens/discovery_page/my_list_view.dart';
import 'package:pbh_project/screens/discovery_page/results_not_found.dart';
import 'package:pbh_project/screens/discovery_page/start_typing_widget.dart';

import '../../controllers/item_filter_utils.dart';
import '../../resources/strings.dart';
import '../../utils/app_styles.dart';
import '../writter_buttons_screens/home_screen.dart';

class ListSearchScreen extends StatefulWidget {
  ///this is the screen where the user searches for books or writters
  const ListSearchScreen({Key? key}) : super(key: key);

  @override
  State<ListSearchScreen> createState() => _ListSearchScreenState();
}

class _ListSearchScreenState extends State<ListSearchScreen> {
  final AllBooksController books = AllBooksController();
  final AllWrittersController writters = AllWrittersController();

  ///this is the list of results based on the keyword of input
  List<ItemsForSearch> itemsGridSearch = [];
  List<ItemsForSearch> allItems = [];

  ///this controller updates its value based on the input of the search bar
  TextEditingController _textController = TextEditingController();

  //this is the initial state for the controller
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    Future.wait([
      books.getAllBooks(),
      writters.getAllWritters(),
    ]).then((results) {
      setState(() {
        allItems = [...results[0], ...results[1]];
      });
    });
  }

  //disposes the controller
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
                //if the value of the input from text form fielfd is empty
                //it shows the widget StartTyping,
                //else if the list of results is empty
                //it shows the widget ResultsNotFound
                //if the value of the input is not empty
                //and the list of results is also not empty
                //it shows the list of resulta in the widget MyListView
                child: _textController.text.isEmpty
                    ? const StartTyping()
                    : (itemsGridSearch.isEmpty
                        ? const ResultsNotFound()
                        : MyListView(
                            itemsGridSearch: itemsGridSearch,
                          )),
              ),
              // this is the start of the header
              Positioned(
                top: 60,
                right: 10,
                left: 10,
                child: Row(
                  children: [
                    //this is a back arrow button to go back to the homescreen
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
                    //gives space between the backarrow button and
                    //the search bar
                    const Spacer(flex: 1),
                    //this is the start of the search bar
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
                                    textInputAction: TextInputAction.search,
                                    controller: _textController,
                                    onFieldSubmitted: (value) {
                                      setState(() {
                                        itemsGridSearch = ItemFilterUtils
                                            .filterItemsByKeyword(
                                                allItems, value);
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
