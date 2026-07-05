import 'package:flutter/material.dart';

class AlertCard extends StatelessWidget {
  final String message;

  const AlertCard({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange.shade100,
      child: ListTile(
        leading: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.orange,
        ),
        title: Text(message),
      ),
    );
  }
}