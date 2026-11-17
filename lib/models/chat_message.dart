class ChatMessage {
  const ChatMessage({
    required this.text,
    required this.isMine,
    required this.sentAt,
  });

  final String text;
  final bool isMine;
  final DateTime sentAt;
}
