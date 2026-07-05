import 'package:flutter/material.dart';
import 'add_exercise_page.dart';
import 'exercise_history_page.dart';

class ExerciseHome extends StatelessWidget {
  const ExerciseHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          ElevatedButton.icon(
            icon: const Icon(Icons.fitness_center),
            label: const Text("Add Exercise"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddExercisePage(),
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          ElevatedButton.icon(
            icon: const Icon(Icons.history),
            label: const Text("Exercise History"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ExerciseHistoryPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}