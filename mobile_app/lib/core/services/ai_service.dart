import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_service.dart';

class AIService {
  static Future<String> askAI(String message) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiService.baseUrl}/ai/chat'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'message': message,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['reply'];
      }

      return 'Unable to get AI response.';
    } catch (e) {
      return 'Server connection failed.';
    }
  }
}