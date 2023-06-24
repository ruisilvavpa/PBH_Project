import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/screens/writter_buttons_screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/validations.dart';
import '../utils/api_endpoints.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool isLoginValid() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    return RegexValidator.validate(email, Regex.email) &&
        RegexValidator.validate(password, Regex.password) &&
        password.length >= 8;
  }

  Future<void> loginWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.loginEmail);
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          print(token);
          final SharedPreferences prefs = await _prefs;

          await prefs.setString('token', token);
          emailController.clear();
          passwordController.clear();
          Get.off(HomeScreen());
        } else {
          throw jsonDecode(response.body)['message'] ?? 'Unknown Error Occured';
        }
      } else {
        jsonDecode(response.body)['message'] ?? 'Unknown Error Occured';
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
