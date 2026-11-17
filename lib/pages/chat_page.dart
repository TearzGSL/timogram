import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/chat_message.dart';
import '../utils/validators.dart';
import '../widgets/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.userName});

  /// Nombre del usuario con quien se chatea.
  final String userName;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (Validators.message(_controller.text) != null) return;
    setState(() {
      _messages.add(
        ChatMessage(
          text: _controller.text.trim(),
          isMine: true,
          sentAt: DateTime.now(),
        ),
      );
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat con ${widget.userName}')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ChatBubble(
                  message: message.text,
                  isSentByMe: message.isMine,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                        Validators.maxMessageLength,
                      ),
                    ],
                    decoration: InputDecoration(
                      hintText: 'Escribe un mensaje...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  tooltip: 'Enviar',
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
