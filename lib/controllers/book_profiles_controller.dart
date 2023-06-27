import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pbh_project/models/books.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/api_endpoints.dart';

class BookProfileController extends GetxController {
  Future<List<BooksOut>> getMytBooks() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      String token = sharedPreferences.getString('token') ?? '';
      var headers = {'Token': token};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.booksByWritter);

      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<BooksOut> books = [];
        for (var element in data) {
          BooksOut book = BooksOut.fromJson(element);
          books.add(book);
        }
        return books;
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

  Future<bool> getUserById(int id) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      String token = sharedPreferences.getString('token') ?? '';
      var headers = {'Token': token};
      var url =
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.delete);

      http.Response response = await http.delete(url, headers: headers);

      if (response.statusCode == 200) {
        final sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.get("token");
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
