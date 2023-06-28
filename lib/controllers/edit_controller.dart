import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../utils/api_endpoints.dart';
import 'package:path_provider/path_provider.dart';

class EditController extends GetxController {
  //variables
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  File? userImage;

  Future<bool> deleteAccount(int id) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      String token = sharedPreferences.getString('token') ?? '';
      var headers = {'Token': token};
      var url =
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.delete);

      http.Response response = await http.delete(url, headers: headers);

      if (response.statusCode == 200) {
        final sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.remove("token");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
      return false;
    }
  }

  Future<bool> updateUser(User user) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token') ?? '';

    if (userImage != null) {
      var request = http.MultipartRequest(
          "PUT",
          Uri.parse(ApiEndPoints.baseUrl +
              ApiEndPoints.authEndPoints.updateUserImage));

      request.headers["Token"] = token;
      var pic = await http.MultipartFile.fromPath("ImageSent", userImage!.path);
      request.files.add(pic);
      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print(responseString);

      userImage = null;
      return updateUser(user);
    } else {
      User userEdited = User(user.id, nameController.text, bioController.text,
          emailController.text.trim(), user.type, user.imagePath);
      try {
        var headers = {
          'Content-Type': 'application/json',
          'Token': token,
        };
        var url =
            Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.update);

        http.Response response = await http.put(url,
            body: jsonEncode(userEdited.toJson()), headers: headers);

        if (response.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      } catch (e) {
        showDialog(
            context: Get.context!,
            builder: (context) {
              return SimpleDialog(
                title: const Text('Error'),
                contentPadding: const EdgeInsets.all(20),
                children: [Text(e.toString())],
              );
            });
        return false;
      }
    }
  }

  // Method to retrieve and display the image
  Future<File?> displayImage(String imagePath) async {
    String apiUrl = ApiEndPoints.baseUrl +
        ApiEndPoints.authEndPoints.getImage +
        "?imagePath=" +
        imagePath;

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == HttpStatus.ok) {
      final jsonData = jsonDecode(response.body);
      String imageBase64 = jsonData['imageBase64'];
      String receivedImagePath = jsonData['imagePath'];

      // Decode the base64 string to bytes
      List<int> imageBytes = base64Decode(imageBase64);

      // Get the document directory
      final directory = await getApplicationDocumentsDirectory();
      String filePath = '${directory.path}/image.jpg';

      // Save the image bytes to a file in the document directory
      File imageFile = File(filePath);
      await imageFile.writeAsBytes(imageBytes);
      return imageFile;
    } else {
      return null;
    }
  }
}
