import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_service.dart';
import 'auth_service.dart';

class GlucoseService {
  /// ADD GLUCOSE
  static Future<bool> addGlucose({
    required double glucoseLevel,
    required String measurementType,
    String? date,
    String? notes,
  }) async {
    try {
      final token = await AuthService.getToken();

      final response = await http.post(

        Uri.parse('${ApiService.baseUrl}/glucose/add'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "glucoseLevel": glucoseLevel,
          "measurementType": measurementType,
          "date": date,
          "notes": notes,
        }),
      );
      // delete 2 line after that
      print("GLUCOSE STATUS: ${response.statusCode}");
      print("GLUCOSE BODY: ${response.body}");


      final data = jsonDecode(response.body);

      return (response.statusCode == 200 || response.statusCode == 201) &&
    data['success'] == true;
    } catch (e) {
      return false;
    }
  }

  /// GET MY GLUCOSE HISTORY
  static Future<List<dynamic>> getMyGlucose() async {
    try {
      final token = await AuthService.getToken();

      final response = await http.get(
        Uri.parse('${ApiService.baseUrl}/glucose/my'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        return data['data'] ?? [];
      }

      return [];
    } catch (e) {
      return [];
    }
  }
}