import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Change this when testing on a real device
  static const String baseUrl = 'http://localhost:5000/api';

  static Future<http.Response> post(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    return await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    return await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
  }
}