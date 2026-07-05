import 'package:flutter/material.dart';

class GlucoseHistoryPage extends StatelessWidget {
  const GlucoseHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Glucose History"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text("Glucose: ${110 + index} mg/dL"),
              subtitle: const Text("Today"),
            ),
          );
        },
      ),
    );
  }
}