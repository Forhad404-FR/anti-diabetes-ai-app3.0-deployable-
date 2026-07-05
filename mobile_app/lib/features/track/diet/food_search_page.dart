import 'package:flutter/material.dart';

class FoodSearchPage extends StatelessWidget {
  const FoodSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Food")),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: TextField(
          decoration: InputDecoration(
            labelText: "Search...",
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
