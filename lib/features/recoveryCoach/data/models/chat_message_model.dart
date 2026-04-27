class ChatMessageModel {
  final String id;
  final String content;
  final bool isUser;
  final bool isTyping;
  final DateTime timestamp;

  ChatMessageModel({
    required this.content,
    required this.isUser,
    this.isTyping = false,
    DateTime? timestamp,
  })  : id = DateTime.now().millisecondsSinceEpoch.toString(),
        timestamp = timestamp ?? DateTime.now();
}
