import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pbh_project/screens/grid_view_books/grid_view_2.dart';

import '../../models/categories.dart';
import '../../resources/strings.dart';
import '../../reusable_widgets/app_bar.dart';

class GridViewBooksCategoriesScreen extends StatefulWidget {
  late final Categories category;

  GridViewBooksCategoriesScreen({Key? key, required this.category})
      : super(key: key);
  @override
  State<GridViewBooksCategoriesScreen> createState() =>
      _GridViewBooksCategoriesScreenState();
}

class _GridViewBooksCategoriesScreenState
    extends State<GridViewBooksCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.category.name),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              MyGridViewCopy2(
                categoryId: widget.category.id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
