import 'package:flutter/material.dart';

class CalorieSummaryPage extends StatelessWidget {
  const CalorieSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calorie Summary")),
      body: const Center(child: Text("Today's Total Calories: 1450 kcal")),
    );
  }
}
