import 'package:flutter/material.dart';
import 'package:k_rehab/features/recoveryCoach/presentation/widgets/text_message.dart';
import 'package:k_rehab/features/recoveryCoach/presentation/widgets/typing_indicator.dart';
import '../../data/models/chat_message_model.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageModel message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final bool isUser = message.isUser;
    final bool isTyping = message.isTyping;
    final colors = Theme.of(context).colorScheme;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: isUser ? colors.primary : colors.onPrimary,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
              bottomLeft: isUser
                  ? const Radius.circular(16)
                  : const Radius.circular(4),
              bottomRight: isUser
                  ? const Radius.circular(4)
                  : const Radius.circular(16),
            ),
          ),
          child: isTyping
              ? TypingIndicator(color: colors.primary)
              : TextMessage(message: message),
        ),
      ),
    );
  }
}
