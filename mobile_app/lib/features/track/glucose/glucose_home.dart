import 'package:flutter/material.dart';
import 'add_glucose_page.dart';
import 'glucose_history_page.dart';

class GlucoseHome extends StatelessWidget {
  const GlucoseHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text("Add Glucose"),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddGlucosePage(),
                ),
              );

              if (result == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                  content: Text("Glucose added successfully"),
              ),
  );
}
            },
          ),

          const SizedBox(height: 20),

          ElevatedButton.icon(
            icon: const Icon(Icons.history),
            label: const Text("History"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const GlucoseHistoryPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}