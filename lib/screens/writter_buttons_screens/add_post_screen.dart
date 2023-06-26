import 'package:flutter/material.dart';
import 'package:pbh_project/controllers/add_post_controller.dart';
import 'package:pbh_project/controllers/book_categories_controller.dart';
import 'package:pbh_project/controllers/institutions_controller.dart';
import 'package:pbh_project/models/institutions.dart';
import '../../models/categories.dart';
import '../../reusable_widgets/app_bar.dart';
import '../../reusable_widgets/image_picker.dart';
import '../../utils/app_styles.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  //variables
  BookController bookController = BookController();
  InstitutionsController institutionController = InstitutionsController();
  AddPostController addPostController = AddPostController();
  List<DropdownMenuItem> categories = [];
  List<DropdownMenuItem> institutions = [];
  Categories? categorySelected;
  Institution? institutionSelected;

  @override
  void initState() {
    super.initState();
    bookController.getBookCategories().then((value) => {
          setState(() {
            categories = value.map((e) {
              return DropdownMenuItem(value: e, child: Text(e.name));
            }).toList();
          })
        });
    institutionController.getInstitutions().then((value) => {
          setState(() {
            institutions = value.map((e) {
              return DropdownMenuItem(value: e, child: Text(e.name));
            }).toList();
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const CustomAppBarWBB(title: 'Add New Post'),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  //Image container
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(235, 178, 125, 1),
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
                        Icons.add_a_photo_rounded,
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
                const Padding(padding: EdgeInsets.zero),
                TextFormField(
                  controller: addPostController.titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    prefixIconColor: Colors.black,
                    floatingLabelStyle: const TextStyle(color: Colors.blue),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.black),
                    ),
                    label: const Text('Title'),
                    prefixIcon: const Icon(Icons.book),
                  ),
                ),
              ],
            )),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: DropdownButton(
                isExpanded: true,
                items: categories,
                value: categorySelected,
                onChanged: (value) => categoryDropdownDidChange(value),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: addPostController.descriptionController,
              decoration: const InputDecoration(
                labelText: 'Sinopse',
                hintText: 'Digite a sinopse do livro',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    items: institutions,
                    value: institutionSelected,
                    onChanged: (value) => institutionDropdownDidChange(value),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            const Text('How much do you need'),
            Slider(
              value: addPostController.currentValue1,
              max: 500,
              min: 0,
              divisions: 500,
              label: addPostController.currentValue1.toString(),
              onChanged: (value) =>
                  setState(() => addPostController.currentValue1 = value),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: const EdgeInsets.fromLTRB(80, 10, 80, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
              ),
              child: ElevatedButton(
                onPressed: () => createPost(context),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black26;
                      }
                      return writterLogoColor;
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Khepri',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void categoryDropdownDidChange(Categories value) {
    addPostController.category = value;
    setState(() => categorySelected = value);
  }

  void institutionDropdownDidChange(Institution value) {
    addPostController.institution = value;
    setState(() => institutionSelected = value);
  }

  void createPost(BuildContext context) {
    addPostController
        .addPost(context)
        .then((value) => handleCreateAnswer(value, context));
  }

  void handleCreateAnswer(bool response, BuildContext context) {
    if (response) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Post Created'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Fechar o diálogo
                  Navigator.pop(context); // Fechar a tela atual
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
