import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/controllers/registration_controller.dart';
import 'package:pbh_project/reusable_widgets/input_fields.dart';
import 'package:pbh_project/reusable_widgets/submit_button.dart';
import 'package:pbh_project/utils/app_styles.dart';

import '../../controllers/edit_controller.dart';
import '../../models/user.dart';
import '../../resources/strings.dart';
import '../../reusable_widgets/app_bar.dart';
import '../../reusable_widgets/image_picker.dart';

class EditProfile extends StatefulWidget {
  User? user;
  EditProfile({super.key, this.user});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User? user;
  @override
  Widget build(BuildContext context) {
    final RegistrationController registrationController =
        Get.put(RegistrationController());
    //variables

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
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
                    child: Image.asset(
                      'assets/images/image_profile.jpg',
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
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                InputTextFieldWidget(registrationController.nameController,
                    'Name', Icons.person_outline, false),
                const SizedBox(
                  height: 20,
                ),
                InputTextFieldWidget(registrationController.emailController,
                    'Email', Icons.email, false),
                const SizedBox(
                  height: 30,
                ),
                const SingleChildScrollView(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
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
                  onPressed: registrationController.isSignupValid() == true
                      ? () => registrationController.registerWithEmail()
                      : null,
                  title: Strings.kEditProfileTitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
