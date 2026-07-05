import 'package:flutter/material.dart';

class HealthScoreCard extends StatelessWidget {
  final double score;
  final Map<String, dynamic>? breakdown;
  final String riskLevel;

  const HealthScoreCard({
    super.key,
    required this.score,
    required this.breakdown,
    required this.riskLevel,
  });

  @override
  Widget build(BuildContext context) {
    final glucoseScore = breakdown?['glucoseScore'] ?? 0;
    final dietScore = breakdown?['dietScore'] ?? 0;
    final exerciseScore = breakdown?['exerciseScore'] ?? 0;

    final caloriesIn = breakdown?['totalCaloriesIn'] ?? 0;
    final caloriesBurned = breakdown?['totalCaloriesBurned'] ?? 0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Health Score",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "${score.toInt()}/100",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            "Risk Level: ${riskLevel.toUpperCase()}",
          ),

          const Divider(),

          Text("Glucose Score: $glucoseScore"),
          Text("Diet Score: $dietScore"),
          Text("Exercise Score: $exerciseScore"),

          const Divider(),

          Text("Calories Consumed: $caloriesIn kcal"),
          Text("Calories Burned: $caloriesBurned kcal"),
        ],
      ),
    );
  }
}