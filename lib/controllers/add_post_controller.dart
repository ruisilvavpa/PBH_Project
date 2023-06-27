import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/models/books_in.dart';
import 'package:http/http.dart' as http;
import 'package:pbh_project/models/categories.dart';
import 'package:pbh_project/models/institutions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/api_endpoints.dart';

class AddPostController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Categories? category;
  Institution? institution;
  double currentValue1 = 150;

  Future<bool> addPost(BuildContext context) async {
    BooksIn bookEdited = BooksIn(
        title: titleController.text,
        categoryId: category?.id ?? 0,
        description: descriptionController.text,
        mediaRating: 0,
        goal: currentValue1.toInt(),
        institutionId: institution?.id ?? 0);

    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      String token = sharedPreferences.getString('token') ?? '';
      var headers = {
        'Content-Type': 'application/json',
        'Token': token,
      };
      var url =
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.addPost);

      http.Response response = await http.post(url,
          body: jsonEncode(bookEdited.toJson()), headers: headers);

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
