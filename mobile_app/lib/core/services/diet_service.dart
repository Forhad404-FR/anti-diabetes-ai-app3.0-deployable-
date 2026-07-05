import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_service.dart';
import 'auth_service.dart';

class DietService {
  /// ADD DIET
  static Future<bool> addDiet({
  required String mealName,
  required int calories,
  String? mealType,
  String? date,
}) async {
  try {
    final token = await AuthService.getToken();

    final response = await http.post(
      Uri.parse('${ApiService.baseUrl}/diet/add'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "mealType": mealType ?? "breakfast", // ✅ FIXED (valid enum)
        "foodItems": [mealName],
        "calories": calories,
        "date": date,
      }),
    );

    print("DIET STATUS: ${response.statusCode}");
    print("DIET BODY: ${response.body}");

    final data = jsonDecode(response.body);

    return response.statusCode == 201 && data['success'] == true;
  } catch (e) {
    print("DIET ERROR: $e");
    return false;
  }
}

  /// GET DIET HISTORY
  static Future<List<dynamic>> getMyDiet() async {
    try {
      final token = await AuthService.getToken();

      final response = await http.get(
        Uri.parse('${ApiService.baseUrl}/diet/my'),
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


