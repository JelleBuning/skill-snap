import 'dart:convert';

import 'package:flutter/services.dart';

class Users {
  static Future<List<dynamic>> fetch() async {
    String jsonString = await rootBundle.loadString('assets/json/users.json');
    return jsonDecode(jsonString);
  }

  static Future<dynamic> fetchById(int id) async {
    String jsonString = await rootBundle.loadString('assets/json/users.json');
    List<dynamic> users = jsonDecode(jsonString);
    return users.firstWhere((u) => u["id"] == id);
  }
}
