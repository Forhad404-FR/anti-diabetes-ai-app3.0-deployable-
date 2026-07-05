import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final double? avgGlucose;
  final String? riskLevel;

  const SummaryCard({
    super.key,
    this.avgGlucose,
    this.riskLevel,
  });

  String getStatusText() {
    if (riskLevel == null) return "No Data";

    switch (riskLevel) {
      case "low":
        return "Normal Range";
      case "medium":
        return "Slightly High";
      case "high":
        return "Danger Level";
      default:
        return "Unknown";
    }
  }

  String getGlucoseText() {
    if (avgGlucose == null || avgGlucose == 0) {
      return "-- mg/dL";
    }
    return "${avgGlucose!.toStringAsFixed(1)} mg/dL";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Glucose",
            style: TextStyle(color: Colors.white70),
          ),

          const SizedBox(height: 10),

          Text(
            getGlucoseText(),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 81, 67, 8),
            ),
          ),

          const SizedBox(height: 5),

          Text(
            getStatusText(),
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}