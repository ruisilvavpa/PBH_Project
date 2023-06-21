import 'package:flutter/material.dart';
import 'package:pbh_project/screens/discovery_page/list_search_screen.dart';
import 'package:pbh_project/utils/app_styles.dart';

import '../resources/strings.dart';
import 'discovery_page/my_grid_view.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({Key? key}) : super(key: key);

  @override
  _DiscoveryScreenState createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  TextEditingController _textController = TextEditingController();

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
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/assortment-with-books-dark-background.jpg',
                  width: double.infinity,
                  height: 255,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
                  child: Column(
                    children: [
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
                      const Text(
                        Strings.kDiscoverySubtitle,
                        style: TextStyle(
                          fontFamily: 'Itim',
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const ListSearchScreen()));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: writterLogoColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: kBackgroundColor,
                                    size: 24,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 5, bottom: 2),
                                      child: Text(
                                        Strings.kFieldSearch,
                                        style: TextStyle(
                                            color: kBackgroundColor,
                                            fontFamily: 'Itim',
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 25, 0, 20),
                          child: Text(
                            'Book Genres',
                            style: TextStyle(
                              fontFamily: 'Khepri',
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      MyGridView(),
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
