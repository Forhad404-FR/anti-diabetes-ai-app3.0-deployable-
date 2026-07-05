import 'package:flutter/material.dart';

class AITipCard extends StatelessWidget {
  final String analysis;
  final List<String> recommendations;

  const AITipCard({
    super.key,
    required this.analysis,
    required this.recommendations,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 14,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "AI Analysis",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              analysis.isEmpty
                  ? "No AI analysis available yet"
                  : analysis,
            ),

            const SizedBox(height: 15),

            const Text(
              "Recommendations",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 8),

            if (recommendations.isEmpty)
              const Text(
                "No recommendations available",
                style: TextStyle(color: Colors.black54),
              )
            else
              ...recommendations.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text("• $item"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}