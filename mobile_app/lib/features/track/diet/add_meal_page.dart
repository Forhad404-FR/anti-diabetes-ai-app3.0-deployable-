import 'package:flutter/material.dart';
import '../../../core/services/diet_service.dart';

class AddMealPage extends StatefulWidget {
  const AddMealPage({super.key});

  @override
  State<AddMealPage> createState() => _AddMealPageState();
}

class _AddMealPageState extends State<AddMealPage> {
  final mealController = TextEditingController();
  final calorieController = TextEditingController();

  bool isLoading = false;

  Future<void> submit() async {
    final meal = mealController.text.trim();
    final calories = int.tryParse(calorieController.text.trim());

    if (meal.isEmpty || calories == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter valid data")),
      );
      return;
    }

    setState(() => isLoading = true);

    final success = await DietService.addDiet(
      mealName: meal,
      calories: calories,
      date: DateTime.now().toIso8601String(),
    );

    setState(() => isLoading = false);

    if (!mounted) return;

    if (success) {
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to add diet")),
      );
    }
  }

  @override
  void dispose() {
    mealController.dispose();
    calorieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Meal")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: mealController,
              decoration: const InputDecoration(
                labelText: "Meal Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: calorieController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Calories",
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