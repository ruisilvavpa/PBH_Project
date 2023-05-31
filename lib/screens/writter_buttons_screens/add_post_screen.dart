import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart';

import '../../reusable_widgets/combo_category_list.dart';
import '../../reusable_widgets/input_fields.dart';
import '../../reusable_widgets/reusable_widgets.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  String? selectedCategory;
  String? selectedAssociation;
  double _currentValue1 = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 178, 125, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(235, 178, 125, 1),
        shadowColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text('Add New Post'),
        titleTextStyle:
            TextStyle(fontFamily: 'Khepri', fontSize: 20, color: Colors.black),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(235, 178, 125, 1),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/circle_icon.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: -10,
                  right: -10,
                  child: IconButton(
                    onPressed: imagePickerOption,
                    icon: Icon(
                      Icons.add_a_photo_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
              child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  prefixIconColor: Colors.black,
                  floatingLabelStyle: TextStyle(color: Colors.blue),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  label: Text('Title'),
                  prefixIcon: Icon(Icons.book),
                ),
              ),
            ],
          )),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            width: 200,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(30),
              isExpanded: false,
              value: selectedCategory,
              hint: const Text('Select a Category'),
              items: categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? newCategory) {
                setState(() {
                  selectedCategory = newCategory;
                });
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(50.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: const Text(
              'Sinopse do livro...',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            width: 200,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(30),
              isExpanded: false,
              value: selectedAssociation,
              hint: const Text('Select an Association'),
              items: categories.map((String association) {
                return DropdownMenuItem<String>(
                  value: association,
                  child: Text(association),
                );
              }).toList(),
              onChanged: (String? newAssociation) {
                setState(() {
                  selectedAssociation = newAssociation;
                });
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Slider(
            value: _currentValue1,
            max: 500,
            min: 0,
            divisions: 1,
            label: _currentValue1.toString(),
            onChanged: (value) => setState(() => _currentValue1 = value),
          ),
        ],
      ),
    );
  }
}
