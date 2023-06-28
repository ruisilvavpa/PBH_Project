import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../utils/api_endpoints.dart';

class GetAllWrittersController extends GetxController {
  Future<List<User>> getAllWritters() async {
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getAllWritters);

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<User> writters = [];
        for (var element in data) {
          User writter = User.fromJson(element);
          writters.add(writter);
        }
        return writters;
      } else {
        return [];
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
      return [];
    }
  }
}
