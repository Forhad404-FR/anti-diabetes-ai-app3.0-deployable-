import 'package:flutter/material.dart';
import '../../../core/services/glucose_service.dart';

class AddGlucosePage extends StatefulWidget {
  const AddGlucosePage({super.key});

  @override
  State<AddGlucosePage> createState() => _AddGlucosePageState();
}

class _AddGlucosePageState extends State<AddGlucosePage> {
  final TextEditingController glucoseController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  String selectedType = "fasting";
  bool isLoading = false;

  Future<void> submit() async {
    final value = double.tryParse(glucoseController.text.trim());

    if (value == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter valid glucose value")),
      );
      return;
    }

    setState(() => isLoading = true);

    final success = await GlucoseService.addGlucose(
      glucoseLevel: value,
      measurementType: selectedType,
      date: DateTime.now().toIso8601String(),
      notes: notesController.text.trim(),
    );

    setState(() => isLoading = false);

    if (!mounted) return;

    if (success) {
      Navigator.pop(context, true); // ✅ IMPORTANT: send refresh signal
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to add glucose")),
      );
    }
  }

  @override
  void dispose() {
    glucoseController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Glucose")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: glucoseController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Glucose Level (mg/dL)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            DropdownButtonFormField<String>(
              value: selectedType,
              items: const [
                DropdownMenuItem(value: "fasting", child: Text("Fasting")),
                DropdownMenuItem(value: "after_meal", child: Text("After Meal")),
                DropdownMenuItem(value: "random", child: Text("Random")),
              ],
              onChanged: (value) {
                setState(() => selectedType = value!);
              },
              decoration: const InputDecoration(
                labelText: "Measurement Type",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: notesController,
              decoration: const InputDecoration(
                labelText: "Notes (optional)",
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