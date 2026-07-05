import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  
  const MessageBubble({
    super.key,
    required this.message,
    required this.isUser,
    });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: 
        isUser? Alignment.centerRight: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser
            ?Theme.of(context).colorScheme.primary
            : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUser? Colors.white: Colors.black87,
          ),
        ),
      ),
    );
  }
}