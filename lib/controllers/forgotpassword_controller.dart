import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../models/validations.dart';
import '../resources/strings.dart';
import '../reusable_widgets/loading_overlay.dart';
import '../utils/api_endpoints.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  bool checkIsValid() {
    return RegexValidator.validate(emailController.text, Regex.email);
  }

  Future<void> sendForgotPasswordRequest() async {
    LoadingOverlay.of(Get.context!).show();
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.forgotPassword);
      Map body = {
        'email': emailController.text.trim(),
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        LoadingOverlay.of(Get.context!).hide();
        Get.back();
        showDialogWithMessage(Strings.kForgotPasswordSuccess);
      } else {
        LoadingOverlay.of(Get.context!).hide();
        showDialogWithMessage(Strings.kForgotPasswordError);
        emailController.clear();
      }
    } catch (e) {
      LoadingOverlay.of(Get.context!).hide();
      showDialogWithMessage(Strings.kForgotPasswordError);
      emailController.clear();
    }
  }

  void showDialogWithMessage(String message) {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text(message),
            contentPadding: const EdgeInsets.all(20),
            children: [Text(e.toString())],
          );
        });
  }
}
