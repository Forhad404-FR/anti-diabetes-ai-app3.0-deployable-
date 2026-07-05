import 'package:flutter/material.dart';
import '../../../core/services/exercise_service.dart';

class ExerciseHistoryPage extends StatefulWidget {
  const ExerciseHistoryPage({super.key});

  @override
  State<ExerciseHistoryPage> createState() => _ExerciseHistoryPageState();
}

class _ExerciseHistoryPageState extends State<ExerciseHistoryPage> {
  List exercises = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await ExerciseService.getMyExercises();

    setState(() {
      exercises = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Exercise History")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final e = exercises[index];

          return Card(
            child: ListTile(
              title: Text("Exercise: ${e['type']} ${e['duration']} min"),
              subtitle: Text(e['date'] ?? "No date"),
            ),
          );
        },
      ),
    );
  }
}