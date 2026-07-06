import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Connected to live Vercel backend - this will work anywhere, including the university!
  static const String baseUrl = 'https://anti-diabetes-ai-app3-0-deployable.vercel.app/api';

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