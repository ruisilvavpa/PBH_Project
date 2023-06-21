import 'package:flutter/material.dart';
import 'package:pbh_project/screens/discovery_page/grid_search_screen.dart';
import 'package:pbh_project/utils/app_styles.dart';

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
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Discovery \nPage',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Khepri',
                            color: Color(0xFFFFB383),
                            fontSize: 40,
                          ),
                        ),
                      ),
                      Text(
                        'Search for new amazing reads',
                        style: TextStyle(
                          fontFamily: 'Itim',
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 27),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const GridSearchScreen()));
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
                                        'Search for authors or books...',
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 15, 0, 20),
                          child: Text(
                            'Book Genres',
                            style: TextStyle(
                              fontFamily: 'Playfair Display',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.6,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: 24, // Replace with actual genre count
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  'Genre $index',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
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
