import 'dart:convert';
import 'package:dating_app/models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static const baseUrl = 'https://randomuser.me';
  final http.Client httpClient = http.Client();

  Future<User> getUser() async {
    const userUrl = '$baseUrl/api/1.3';
    final response = await httpClient.get(userUrl);

    if (response.statusCode != 200) {
      throw Exception('Error getting user');
    }

    final Map<String, dynamic> parsed = json.decode(response.body);

    return User.fromRandomUserResponse(parsed);
  }
}
