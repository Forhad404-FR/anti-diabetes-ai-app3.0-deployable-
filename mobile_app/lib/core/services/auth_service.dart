import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'api_service.dart';

class AuthService {
  static const String tokenKey = 'jwt_token';
// cut from here
  static Future<bool> register({
  required String name,
  required String email,
  required String password,
}) async {
  try {
    final response = await ApiService.post(
      '/auth/register',
      {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    print('REGISTER STATUS: ${response.statusCode}');
    print('REGISTER BODY: ${response.body}');

    if (response.statusCode == 200 ||
        response.statusCode == 201) {
      return true;
    }

    return false;
  } catch (e) {
    print('REGISTER ERROR: $e');
    return false;
  }
}

  /*static Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiService.post(
        '/auth/register',
        {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201) {
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }*/

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiService.post(
        '/auth/login',
        {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {

        //delete 2 line after that.
        print('LOGIN STATUS: ${response.statusCode}');
        print('LOGIN BODY: ${response.body}');

        final data = jsonDecode(response.body);

        final token =
            data['data']['token'];

        final prefs =
            await SharedPreferences.getInstance();

        await prefs.setString(
          tokenKey,
          token,
        );

        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<String?> getToken() async {
    final prefs =
        await SharedPreferences.getInstance();

    return prefs.getString(tokenKey);
  }

  static Future<void> logout() async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.remove(tokenKey);
  }
}