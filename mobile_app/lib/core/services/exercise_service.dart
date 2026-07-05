import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_service.dart';
import 'auth_service.dart';

class ExerciseService {
  static Future<bool> addExercise({
    required String type,
    required int duration,
    String? date,
  }) async {
    try {
      final token = await AuthService.getToken();

      final response = await http.post(
        Uri.parse('${ApiService.baseUrl}/exercise/add'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "type": type,
          "duration": duration,
          "date": date,
        }),
      );

      final data = jsonDecode(response.body);

      print("EXERCISE STATUS: ${response.statusCode}");
      print("EXERCISE BODY: ${response.body}");

      return response.statusCode == 201 &&
          data['success'] == true;
    } catch (e) {
      print("EXERCISE ERROR: $e");
      return false;
    }
  }

  static Future<List<dynamic>> getMyExercises() async {
    try {
      final token = await AuthService.getToken();

      final response = await http.get(
        Uri.parse('${ApiService.baseUrl}/exercise/my'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 &&
          data['success'] == true) {
        return data['data'] ?? [];
      }

      return [];
    } catch (e) {
      print("EXERCISE HISTORY ERROR: $e");
      return [];
    }
  }
}