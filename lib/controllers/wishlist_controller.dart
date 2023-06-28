import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/books_out.dart';
import '../models/user.dart';
import '../models/whislist.dart';
import '../utils/api_endpoints.dart';

class WishlistController {
  Wishlist? wishlist;
  BooksOut? books;
  User? user;

  Future<List<Wishlist>> getWishlist() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      String token = sharedPreferences.getString('token') ?? '';
      var headers = {'Token': token};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getWishlist);

      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        List<Wishlist> wishlists = [];

        for (var wishlistJson in json) {
          var wishlist = Wishlist.fromJson(wishlistJson);
          wishlists.add(wishlist);
        }

        return wishlists;
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

  Future<bool> insertWishlist(BooksOut book, String obs) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      String token = sharedPreferences.getString('token') ?? '';
      var headers = {'Token': token};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.insertWishlist);

      Map<String, dynamic> requestBody = {
        'Book_Id': book.bookId.toString(),
        'Obs': obs,
      };

      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );

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
        },
      );
      return false;
    }
  }

  Future<int> deleteWishlist(int wishlistId) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      String token = sharedPreferences.getString('token') ?? '';
      var headers = {'Token': token};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.deleteWishlist);

      // Create the request body
      Map<String, dynamic> requestBody = {
        'Wishlist_Id': wishlistId,
      };

      http.Response response =
          await http.delete(url, headers: headers, body: requestBody);

      if (response.statusCode == 200) {
        return wishlistId;
      } else {
        return 0;
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
      return 0;
    }
  }
}
