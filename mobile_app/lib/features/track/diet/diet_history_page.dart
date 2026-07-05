import 'package:flutter/material.dart';
import '../../../core/services/diet_service.dart';

class DietHistoryPage extends StatefulWidget {
  const DietHistoryPage({super.key});

  @override
  State<DietHistoryPage> createState() => _DietHistoryPageState();
}

class _DietHistoryPageState extends State<DietHistoryPage> {
  List<dynamic> diets = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final res = await DietService.getMyDiet();

    setState(() {
      diets = res;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Diet History")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : diets.isEmpty
              ? const Center(child: Text("No diet records found"))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: diets.length,
                  itemBuilder: (context, index) {
                    final item = diets[index];

                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.restaurant),
                        title: Text(item['mealName'] ?? "Meal"),
                        subtitle: Text(
                          "Calories: ${item['calories'] ?? 0}\nType: ${item['mealType'] ?? ''}",
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}