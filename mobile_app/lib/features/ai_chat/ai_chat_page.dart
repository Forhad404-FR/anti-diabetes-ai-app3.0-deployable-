import 'package:flutter/material.dart';
import 'widgets/message_bubble.dart';
import 'widgets/suggestion_chip.dart';
import '../../core/services/ai_service.dart';

class AIChatPage extends StatefulWidget {
  const AIChatPage({super.key});

  @override
  State<AIChatPage> createState() => _AIChatPageState();
}

class _AIChatPageState extends State<AIChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> messages = [
    {
      "text": "Hello! I'm your AI health assistant. How can I help? ",
      "isUser": false,
    },
  ];
  Future<void> sendMessage(String text) async {
  setState(() {
    messages.add({
      "text": text,
      "isUser": true,
    });
  });

  _controller.clear();

  final reply = await AIService.askAI(text);

  setState(() {
    messages.add({
      "text": reply,
      "isUser": false,
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Assistant")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                  message: messages[index]["text"],
                  isUser: messages[index]["isUser"],
                );
              },
            ),
          ),
          Wrap(
            spacing: 8,
            children: [
              SuggestionChip(
                text: "Why is my glucose high",
                onTap: () => sendMessage("Why is my glucose high"),
              ),
              SuggestionChip(
                text: "Diet Advice",
                onTap: () => sendMessage("Why is my glucose high"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: "Ask something...",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            sendMessage(_controller.text);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
