import 'package:flutter/material.dart';
import 'discovery_page/my_grid_view_copy.dart';
import 'discovery_page/search_button.dart';
import '../utils/app_styles.dart';

import '../resources/strings.dart';
import 'discovery_page/my_grid_view.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({Key? key}) : super(key: key);

  @override
  _DiscoveryScreenState createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  /// this is a controller that 'listens' the text form field
  TextEditingController _textController = TextEditingController();

  ///this variable is used to toggle between the books and writters grid
  bool _isBookGenre = true;

  ///this is the color applied when the corresponding inkwell is triggered
  final Color _selectedColor = writterLogoColor;

  ///this is the color applied when the correponding inkweel is not triggered
  final Color _unselectedColor = Colors.black;

  //Initiates the state of the text controller
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  //Disposes the text controller
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
        child: Column(
          children: [
            Stack(
              children: [
                //this is the background of the screen
                Image.asset(
                  'assets/images/assortment-with-books-dark-background.jpg',
                  width: double.infinity,
                  height: 255,
                  fit: BoxFit.cover,
                ),
                //this is the rest of the screen stacked
                //on top of the background
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
                  child: Column(
                    children: [
                      //Title of the screen
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          Strings.kDiscoveryTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Khepri',
                            color: Color(0xFFFFB383),
                            fontSize: 40,
                          ),
                        ),
                      ),
                      //Subtitle of the screen
                      const Text(
                        Strings.kDiscoverySubtitle,
                        style: TextStyle(
                          fontFamily: 'Itim',
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SearchButton(),

                      //this is the toggle for the book genres and writters grid
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 25, 10, 20),
                          child: Row(
                            children: [
                              //this is the widget that toggles
                              //the book genre grid
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _isBookGenre = true;
                                  });
                                },
                                child: Text(
                                  'Book \n' 'Genres',
                                  style: TextStyle(
                                    color: _isBookGenre
                                        ? _selectedColor
                                        : _unselectedColor,
                                    fontFamily: 'Khepri',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              //this is a space that occupies the max space
                              //available
                              Spacer(),
                              //this is the widget that toggles
                              //the writters grid
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _isBookGenre = false;
                                  });
                                },
                                child: Text(
                                  'Writters',
                                  style: TextStyle(
                                    color: _isBookGenre
                                        ? _unselectedColor
                                        : _selectedColor,
                                    fontFamily: 'Khepri',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // depending on the bool value of _isBookGenre
                      //it shows either the book genre or writers grid
                      _isBookGenre ? MyGridView() : MyGridViewCopy(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
