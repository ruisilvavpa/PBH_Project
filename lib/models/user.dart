import 'package:flutter/material.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String? bio;
  final int type;

  User(this.id, this.name, this.bio, this.email, this.type);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        id = json['id'],
        bio = json['bio'],
        type = json['type'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'email': email, 'id': id, 'bio': bio, 'type': type};
}
