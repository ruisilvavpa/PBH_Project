import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

Future<void> pickImageFromGallery(
    Function(File) onPressed, ImageSource source) async {
  final image = await ImagePicker().pickImage(source: source);
  if (image == null) return;
  final imageTemp = File(image.path);
  onPressed(imageTemp);
  Get.back();
}

void imagePickerOption(Function(File) onPressed) {
  Get.bottomSheet(
    SingleChildScrollView(
      child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Pick image from',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Itim'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () =>
                        pickImageFromGallery(onPressed, ImageSource.camera),
                    icon: const Icon(Icons.camera),
                    label: const Text('Camera'),
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(235, 178, 125, 1),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () =>
                        pickImageFromGallery(onPressed, ImageSource.gallery),
                    icon: const Icon(Icons.image),
                    label: const Text('Gallery'),
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(235, 178, 125, 1),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text('Cancel'),
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(235, 178, 125, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    ),
  );
}
