import 'package:flutter/material.dart';
import 'doctor_chat_page.dart';

class DoctorProfilePage extends StatelessWidget {
  final Map<String, String> doctor;

  const DoctorProfilePage({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctor["name"] ?? "Doctor"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 45,
                child: Icon(Icons.person, size: 50),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              doctor["name"] ?? "",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              "Hospital: ${doctor["hospital"] ?? "N/A"}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),

            Text(
              "Experience: ${doctor["experience"] ?? "N/A"}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),

            Text(
              "Phone: ${doctor["phone"] ?? "N/A"}",
              style: const TextStyle(fontSize: 16),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DoctorChatPage(
                        doctorName: doctor["name"] ?? "Doctor",
                      ),
                    ),
                  );
                },
                child: const Text("Start Chat"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}