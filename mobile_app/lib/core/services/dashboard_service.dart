import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_service.dart';
import 'auth_service.dart';

class DashboardService {
  static Future<Map<String, dynamic>?> getWeeklyReport() async {
    try {
      final token = await AuthService.getToken();

      final response = await ApiService.get(
        '/reports/weekly',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}