import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/models/change_password.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/validations.dart';
import '../utils/api_endpoints.dart';

class ChangePasswordController extends GetxController {
  //variables
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmNewPassController = TextEditingController();

  bool checkIsValid() {
    return RegexValidator.validate(oldPassController.text, Regex.password) &&
        RegexValidator.validate(newPassController.text, Regex.password) &&
        RegexValidator.validate(
            confirmNewPassController.text, Regex.password) &&
        newPassController.text == confirmNewPassController.text;
  }

  Future<bool> changePassword() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      String token = sharedPreferences.getString('token') ?? '';
      var headers = {'Content-Type': 'application/json', 'Token': token};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.resetPassword);

      var body = ChangePassword(oldPassController.text, newPassController.text,
          confirmNewPassController.text);

      http.Response response = await http.put(url,
          body: jsonEncode(body.toJson()), headers: headers);

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
