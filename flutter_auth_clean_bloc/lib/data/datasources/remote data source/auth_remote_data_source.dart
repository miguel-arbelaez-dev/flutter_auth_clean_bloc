import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  static const String _baseUrl = 'https://fakestoreapi.com';

  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception(
        'Login failed (${response.statusCode}): ${response.body}',
      );
    }
  }
}
