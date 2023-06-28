import 'package:flutter/material.dart';

class Wishlist {
  final int userId;
  final int bookId;
  final String? obs;
  final int id;

  Wishlist(this.userId, this.bookId, this.obs, this.id);

  Wishlist.fromJson(Map<String, dynamic> json)
      : userId = json['user_Id'],
        bookId = json['book_Id'],
        id = json['wishlist_Id'],
        obs = json['obs'];
}
