import 'package:flutter/material.dart';
import 'package:pbh_project/screens/grid_view_books/grid_view_2.dart';

import '../../resources/strings.dart';
import '../../reusable_widgets/app_bar.dart';

class GridViewBooksScreen extends StatefulWidget {
  const GridViewBooksScreen({super.key});

  @override
  State<GridViewBooksScreen> createState() => _GridViewBooksScreenState();
}

class _GridViewBooksScreenState extends State<GridViewBooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Strings.kGridViewName),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              MyGridViewCopy2(),
            ],
          ),
        ),
      ),
    );
  }
}