import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pbh_project/models/institutions.dart';

import '../utils/api_endpoints.dart';

class InstitutionsController extends GetxController {
  Future<List<Institution>> getInstitutions() async {
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.institutions);

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<Institution> institutions = [];
        for (var element in data) {
          Institution institution = Institution.fromJson(element);
          institutions.add(institution);
        }
        return institutions;
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
