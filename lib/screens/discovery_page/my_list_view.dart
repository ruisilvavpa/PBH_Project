import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pbh_project/screens/book_profile_screen.dart';
import 'package:pbh_project/screens/writter_main_profile_page.dart';
import 'package:pbh_project/screens/writter_profile/writter_main_profile_banner.dart';
import 'package:pbh_project/utils/app_styles.dart';

import '../../models/books_out.dart';
import '../../models/items_for_search.dart';

class MyListView extends StatefulWidget {
  MyListView({super.key, required this.itemsGridSearch});

  late List<ItemsForSearch> itemsGridSearch = [];

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            ListView.builder(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              itemCount: widget.itemsGridSearch.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 100,
                  child: InkWell(
                    onTap: () {
                      widget.itemsGridSearch[index].types == TypeOfItem.book
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const BookProfileScreen()))
                          : Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const WritterMainProfilePage()));
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              widget.itemsGridSearch[index].types ==
                                      TypeOfItem.writter
                                  ? const Icon(
                                      Icons.person_2_rounded,
                                      color: writterLogoColor,
                                      size: 50,
                                    )
                                  : const Icon(
                                      Icons.book_rounded,
                                      color: writterLogoColor,
                                      size: 50,
                                    ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Text(
                                    widget.itemsGridSearch[index].title +
                                        ': ' +
                                        widget
                                            .itemsGridSearch[index].description,
                                    textAlign: TextAlign.center,
                                    style: kInfoText,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
