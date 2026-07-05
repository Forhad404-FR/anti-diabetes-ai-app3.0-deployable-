import 'package:flutter/material.dart';
import '../features/splash/splash_page.dart';
import '../features/auth/login_page.dart';
import '../features/splash/onboarding_page.dart';
import '../navigation/bottom_nav_page.dart';
import '../features/auth/signup_page.dart';
import '../features/track/glucose/add_glucose_page.dart';


class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const forgotPassword = '/forgot-password';
  static const completeProfile = '/complete-profile';
  static const String otp = '/otp';
  static const String dashboard = '/dashboard';
  
  static Map<String, WidgetBuilder> get routes =>{
    splash:(context) => const SplashPage(),
    onboarding: (context) => const OnboardingPage(),
    login: (context) => const LoginPage(),
    signup: (context) => const SignupPage(),
    home: (context) => const BottomNavPage(),
    dashboard: (context) => const BottomNavPage(),
    '/add-glucose': (context) => const AddGlucosePage(),
  };
}