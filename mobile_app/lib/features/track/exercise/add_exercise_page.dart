import 'package:flutter/material.dart';
import '../../../core/services/exercise_service.dart';

class AddExercisePage extends StatefulWidget {
  const AddExercisePage({super.key});

  @override
  State<AddExercisePage> createState() => _AddExercisePageState();
}

class _AddExercisePageState extends State<AddExercisePage> {
  final typeController = TextEditingController();
  final durationController = TextEditingController();

  bool isLoading = false;

  Future<void> submit() async {
    final type = typeController.text.trim();
    final duration = int.tryParse(durationController.text.trim());

    if (type.isEmpty || duration == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter valid data")),
      );
      return;
    }

    setState(() => isLoading = true);

    final success = await ExerciseService.addExercise(
      type: type,
      duration: duration,
      date: DateTime.now().toIso8601String(),
    );

    setState(() => isLoading = false);

    if (!mounted) return;

    if (success) {
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to add exercise")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Exercise")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: typeController,
              decoration: const InputDecoration(
                labelText: "Exercise Type",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: durationController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Duration (minutes)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : submit,
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}