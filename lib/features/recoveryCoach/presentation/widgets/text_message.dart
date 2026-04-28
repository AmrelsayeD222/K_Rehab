import 'package:flutter/material.dart';
import 'package:k_rehab/features/recoveryCoach/data/models/chat_message_model.dart';

class TextMessage extends StatelessWidget {
  final ChatMessageModel message;

  const TextMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Text(
      message.content,
      style: TextStyle(
        color: message.isUser ? colors.onPrimary : colors.onSurface,
        fontSize: 14,
      ),
    );
  }
}
