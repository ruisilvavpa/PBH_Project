import 'package:flutter/material.dart';
import '../../reusable_widgets/app_bar.dart';
import '../../reusable_widgets/combo_category_list.dart';
import '../../reusable_widgets/image_picker.dart';
import '../../utils/app_styles.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  //variables
  String? selectedCategory;
  String? selectedAssociation;
  double _currentValue1 = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const CustomAppBarWBB(title: 'Add New Post'),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
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
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(30),
                isExpanded: true,
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
            const TextField(
              decoration: InputDecoration(
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
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(30),
                    isExpanded: true,
                    value: selectedAssociation,
                    hint: const Text(
                      textAlign: TextAlign.center,
                      'Select an Association',
                    ),
                    items: associations.map((String association) {
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
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            const Text('How much do you need'),
            Slider(
              value: _currentValue1,
              max: 500,
              min: 0,
              divisions: 500,
              label: _currentValue1.toString(),
              onChanged: (value) => setState(() => _currentValue1 = value),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: const EdgeInsets.fromLTRB(80, 10, 80, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
              ),
              child: ElevatedButton(
                onPressed: () {},
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
}
