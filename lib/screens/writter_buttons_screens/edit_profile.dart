import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pbh_project/reusable_widgets/input_fields.dart';
import 'package:pbh_project/reusable_widgets/submit_button.dart';
import 'package:pbh_project/screens/writter_buttons_screens/change_password_screen.dart';
import 'package:pbh_project/utils/app_styles.dart';

import '../../controllers/edit_controller.dart';
import '../../models/user.dart';
import '../../resources/strings.dart';
import '../../reusable_widgets/image_picker.dart';

class EditProfile extends StatefulWidget {
  User? user;
  EditProfile({super.key, this.user});

  @override
  State<EditProfile> createState() => _EditProfileState(user: user);
}

class _EditProfileState extends State<EditProfile> {
  User? user;
  _EditProfileState({this.user});
  EditController controller = EditController();
  File? userNewImage;
  Image placeholderImage = Image.asset(
    'assets/images/image_profile.jpg',
    width: 150,
    height: 150,
    fit: BoxFit.contain,
  );

  @override
  void initState() {
    super.initState();
    controller.nameController.text = user?.name ?? "";
    controller.bioController.text = user?.bio ?? "";
    controller.emailController.text = user?.email ?? "";

    if (user?.imagePath != null) {
      controller
          .displayImage(user!.imagePath!)
          .then((value) => setState(() => placeholderImage = Image.file(
                value!,
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              )));
    }
  }

  void pickerAction() {
    imagePickerOption((file) => handlePickedFile(file));
  }

  void handlePickedFile(File file) {
    controller.userImage = file;
    setState(() {
      placeholderImage = Image.file(
        file,
        width: 150,
        height: 150,
        fit: BoxFit.contain,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: writterLogoColor,
        title: const Text(Strings.kEditProfileTitle),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                delete(context);
              },
              child: const Icon(
                Icons.delete,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Row(),
          const SizedBox(
            height: 30,
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
                    child: placeholderImage,
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right: -10,
                  child: IconButton(
                    onPressed: () => pickerAction(),
                    icon: const Icon(
                      Icons.add_a_photo_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                InputTextFieldWidget(controller.nameController, 'Name',
                    Icons.person_outline, false),
                const SizedBox(
                  height: 20,
                ),
                InputTextFieldWidget(
                    controller.emailController, 'Email', Icons.email, false),
                const SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: controller.bioController,
                    decoration: const InputDecoration(
                      labelText: Strings.kBioProfileTitle,
                      labelStyle: TextStyle(color: writterLogoColor),
                      hintText: Strings.kBioProfileBody,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: writterLogoColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SubmitButton(
                  onPressed: () => edit(context),
                  title: Strings.kEditProfileTitle,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  RichText(
                    text: TextSpan(
                        text: Strings.kEditChangePassword,
                        style: kDescription,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      (const ChangePasswordPage())))),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void edit(BuildContext context) {
    controller
        .updateUser(user!)
        .then((value) => handleEditAnswer(value, context));
  }

  void handleEditAnswer(bool response, BuildContext context) {
    if (response) {
      Navigator.pop(context);
    }
  }

  void delete(BuildContext context) {
    EditController()
        .deleteAccount(user?.id ?? 0)
        .then((value) => handleDeleteAnswer(value, context));
  }

  void handleDeleteAnswer(bool response, BuildContext context) {
    if (response) {
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }
}
