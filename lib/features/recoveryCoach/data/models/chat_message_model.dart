import 'package:equatable/equatable.dart';

class ChatMessageModel extends Equatable {
  static int _idCounter = 0;
  final String id;
  final String content;
  final bool isUser;
  final bool isTyping;
  final DateTime timestamp;

  ChatMessageModel({
    String? id,
    required this.content,
    required this.isUser,
    this.isTyping = false,
    DateTime? timestamp,
  }) : id = '${DateTime.now().millisecondsSinceEpoch}_${++_idCounter}',
       timestamp = timestamp ?? DateTime.now();

  @override
  List<Object?> get props => [id, content, isUser, isTyping, timestamp];
}
