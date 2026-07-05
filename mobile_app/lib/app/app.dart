import 'package:flutter/material.dart';
import 'app_routes.dart';
import 'app_theme.dart';

class AntiDiabetesApp extends StatelessWidget {
  const AntiDiabetesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AntiDiabetes',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.LightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}