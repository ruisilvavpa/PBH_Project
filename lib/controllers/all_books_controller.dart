import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pbh_project/models/items_for_search.dart';

import '../models/books_out.dart';
import '../utils/api_endpoints.dart';
import 'item_filter_utils.dart';

class AllBooksController extends GetxController {
  Future<List<ItemsForSearch>> getAllBooks() async {
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getAllBooks);

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<ItemsForSearch> books = [];
        for (var element in data) {
          ItemsForSearch book = ItemsForSearch.fromJson(element);
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

  List<ItemsForSearch> filterItemsByKeyword(
      List<ItemsForSearch> items, String keyword) {
    return items
        .where(
            (item) => item.title.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }
}

class AllWrittersController extends GetxController {
  Future<List<ItemsForSearch>> getAllWritters() async {
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getAllWritters);

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<ItemsForSearch> writters = [];
        for (var element in data) {
          ItemsForSearch writter = ItemsForSearch.fromJson(element);
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

  List<ItemsForSearch> filterItemsByKeyword(
      List<ItemsForSearch> items, String keyword) {
    return items
        .where(
            (item) => item.title.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }
}
