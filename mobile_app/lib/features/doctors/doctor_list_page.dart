import 'package:flutter/material.dart';
import 'doctor_profile_page.dart';

class DoctorListPage extends StatelessWidget {
  final String category;

  const DoctorListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, String>>> doctorData = {
  "Diabetologist": [
    {
      "name": "Dr. Sarah Khan",
      "hospital": "City Medical Hospital",
      "experience": "8 Years",
      "phone": "+8801712345678"
    },
    {
      "name": "Dr. Ahmed Rahman",
      "hospital": "Green Life Hospital",
      "experience": "12 Years",
      "phone": "+8801812345678"
    },
  ],

  "Nutritionist": [
    {
      "name": "Dr. Nusrat Jahan",
      "hospital": "Square Hospital",
      "experience": "10 Years",
      "phone": "+8801912345678"
    },
  ],

  "Cardiologist": [
    {
      "name": "Dr. Hasan Ali",
      "hospital": "United Hospital",
      "experience": "15 Years",
      "phone": "+8801612345678"
    },
  ],

  "General Physician": [
    {
      "name": "Dr. Mahmud Hasan",
      "hospital": "Popular Hospital",
      "experience": "7 Years",
      "phone": "+8801512345678"
    },
  ]
};
final doctors = doctorData[category] ?? [];
    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(doctors[index]["name"]!),
              subtitle: Text("Experience: ${doctors[index]["experience"]}"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        DoctorProfilePage(
                        doctor: doctors[index],
                       ),)
                );
              },
            ),
          );
        },
      ),
    );
  }
}
