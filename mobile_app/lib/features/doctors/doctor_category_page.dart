import 'package:flutter/material.dart';
import 'doctor_list_page.dart';

class DoctorCategoryPage extends StatelessWidget {
  const DoctorCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      "Diabetologist",
      "Nutritionist",
      "Cardiologist",
      "General Physician",
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Doctor Categories")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(categories[index]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DoctorListPage(category: categories[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
