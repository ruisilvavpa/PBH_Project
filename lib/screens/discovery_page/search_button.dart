import 'package:flutter/material.dart';
import 'package:pbh_project/resources/strings.dart';
import 'package:pbh_project/screens/discovery_page/list_search_screen.dart';
import 'package:pbh_project/utils/app_styles.dart';

class SearchButton extends StatelessWidget {
  ///this is the button that is shown in the main discovery screen,
  /// it forwards the user to search screen
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),

      //this widget wraps the container on makes it 'pressable'
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ListSearchScreen()));
        },

        //the visible part of the button
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: writterLogoColor,
            borderRadius: BorderRadius.circular(8),
          ),

          //content of the button
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: const [
                //search icon, placed on left of the container
                Icon(
                  Icons.search,
                  color: kBackgroundColor,
                  size: 24,
                ),

                //this simulates a hint text
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, bottom: 2),
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
    );
  }
}
