import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbh_project/models/rating.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/api_endpoints.dart';

class RatingController {
  TextEditingController commentController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late double rating;
  late int bookId;

  Future<void> insertRating() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.insertRating);
      Map body = {
        'rating': rating,
        'comment': commentController.text,
        'book_Id': bookId,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var token = json['token'];
        final SharedPreferences prefs = await _prefs;

        await prefs.setString('token', token);
        commentController.clear();
      } else {
        showDialog(
            context: Get.context!,
            builder: (context) {
              return SimpleDialog(
                title: const Text('Error'),
                contentPadding: const EdgeInsets.all(20),
                children: [
                  Text(jsonDecode(response.body)['message'] ??
                      'Unknown Error Occured')
                ],
              );
            });
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
