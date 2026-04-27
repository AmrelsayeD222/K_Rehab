import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/chat_message_model.dart';
import '../../data/repo/recovery_coach_repo.dart';

part 'recovery_coach_state.dart';

class RecoveryCoachCubit extends Cubit<RecoveryCoachState> {
  final RecoveryCoachRepo recoveryCoachRepo;
  RecoveryCoachCubit(this.recoveryCoachRepo) : super(RecoveryCoachInitial());

  final List<ChatMessageModel> _messages = [];
  bool _isProcessing = false;

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    if (_isProcessing) return;
    if (isClosed) return;
    _isProcessing = true;

    // Add user message
    _messages.add(ChatMessageModel(content: text, isUser: true));

    // Add typing bubble
    final typingMsg = ChatMessageModel(
      content: '...',
      isUser: false,
      isTyping: true,
    );
    _messages.add(typingMsg);
    emit(RecoveryCoachLoaded(messages: List.from(_messages)));

    // Call API
    final result = await recoveryCoachRepo.sendMessage(_messages);
    if (isClosed) {
      _isProcessing = false;
      return;
    }

    // Remove typing bubble
    _messages.remove(typingMsg);

    result.fold(
      (failure) {
        _isProcessing = false;
        emit(
          RecoveryCoachError(
            messages: List.from(_messages),
            error: failure.errorMessage,
          ),
        );
      },
      (reply) {
        _messages.add(ChatMessageModel(content: reply.trim(), isUser: false));
        _isProcessing = false;
        emit(RecoveryCoachLoaded(messages: List.from(_messages)));
      },
    );
  }

  void clearChat() {
    _messages.clear();
    _isProcessing = false;
    emit(RecoveryCoachInitial());
  }

  Future<void> retryLastMessage() async {
    if (_messages.isEmpty) return;

    final lastUserMessage = _messages.lastWhere(
      (m) => m.isUser,
      orElse: () => ChatMessageModel(content: '', isUser: true),
    );

    if (lastUserMessage.content.isEmpty) return;

    await sendMessage(lastUserMessage.content);
  }
}
