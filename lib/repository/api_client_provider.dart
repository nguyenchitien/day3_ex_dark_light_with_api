import 'dart:convert';

import 'package:day03_ex/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiClientProvider {
  final _baseUrl = "https://randomuser.me/api/?results=10";
  final _client = http.Client();

  Future<List<User>> fetchUsers() async {
    final response = await _client.get(_baseUrl);

    // error
    if (response.statusCode != 200) {
      throw Exception('Failed to load users');
    }

    final jsonData = jsonDecode(response.body);
    List usersJson = jsonData["results"];

    List<User> result = [];
    for (var userJson in usersJson) {
      result.add(User.fromJson(userJson));
    }

    return result;
  }
}
