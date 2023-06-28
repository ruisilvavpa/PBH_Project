import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/books.dart';
import '../models/user.dart';
import '../utils/api_endpoints.dart';

class ShowProfileController extends GetxController {
  Future<User?> getUserById(int userId) async {
    try {
      var url = Uri.parse(ApiEndPoints.baseUrl +
          ApiEndPoints.authEndPoints.getUserById +
          userId.toString());

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        User user = User.fromJson(data);
        return user;
      } else {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [
                Text(jsonDecode(response.body)['message'] ??
                    'Unknown Error Occurred'),
              ],
            );
          },
        );
        return null;
      }
    } catch (e) {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Error'),
            contentPadding: const EdgeInsets.all(20),
            children: [
              Text(e.toString()),
            ],
          );
        },
      );
      return null;
    }
  }

  Future<List<BooksOut>> getAllBooks() async {
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getAllBooks);

      http.Response response = await http.get(url);

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

  Future<User?> getWritterByBook(int bookId) async {
    try {
      var url = Uri.parse(ApiEndPoints.baseUrl +
          ApiEndPoints.authEndPoints.getWritterByBook +
          bookId.toString());

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        User user = User.fromJson(data);
        return user;
      } else {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [
                Text(jsonDecode(response.body)['message'] ??
                    'Unknown Error Occurred'),
              ],
            );
          },
        );
        return null;
      }
    } catch (e) {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Error'),
            contentPadding: const EdgeInsets.all(20),
            children: [
              Text(e.toString()),
            ],
          );
        },
      );
      return null;
    }
  }
}
