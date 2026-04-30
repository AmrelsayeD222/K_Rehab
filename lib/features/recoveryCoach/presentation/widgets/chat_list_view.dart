import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/chat_message_model.dart';
import '../manager/recovery_coach_cubit.dart';
import 'chat_bubble.dart';
import 'suggestion_chips.dart';
import 'package:k_rehab/core/widgets/k_snack_bar.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({super.key});

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  final ScrollController _scrollController = ScrollController();
  int _lastMessageCount = 0;

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecoveryCoachCubit, RecoveryCoachState>(
      listener: (context, state) {
        if (state is RecoveryCoachError) {
          log(state.error);
          KSnackBar.show(context, message: state.error);
        }

        if (state is RecoveryCoachLoaded) {
          if (state.messages.length > _lastMessageCount) {
            _scrollToBottom();
            _lastMessageCount = state.messages.length;
          }
        }
      },
      builder: (context, state) {
        List<ChatMessageModel> messages = [];

        if (state is RecoveryCoachLoaded) {
          messages = state.messages;
        } else if (state is RecoveryCoachError) {
          messages = state.messages;
        }

        // أول مرة (مفيش رسائل)
        if (messages.isEmpty) {
          return const SuggestionChips();
        }

        return ListView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12),
          itemCount: messages.length,
          itemBuilder: (_, i) => ChatBubble(message: messages[i]),
        );
      },
    );
  }
}
