import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/recovery_coach_cubit.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({super.key});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _controller = TextEditingController();
  bool _canSend = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _canSend = _controller.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSend(BuildContext context) {
    if (!_canSend) return;
    context.read<RecoveryCoachCubit>().sendMessage(_controller.text.trim());
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              autofocus: true,
              controller: _controller,
              style: TextStyle(color: colors.onSurface, fontSize: 14),
              decoration: InputDecoration(
                hintText: "Type a message…",
                hintStyle: TextStyle(
                  color: colors.onSurface.withValues(alpha: 0.5),
                ),
                filled: true,
                fillColor: Theme.of(context).cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
              onSubmitted: (_) => _handleSend(context),
            ),
          ),
          const SizedBox(width: 8),
          IconButton.filled(
            onPressed: _canSend ? () => _handleSend(context) : null,
            icon: const Icon(Icons.send_rounded, size: 20),
            style: IconButton.styleFrom(
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
              disabledBackgroundColor: Theme.of(context).cardColor,
              disabledForegroundColor: colors.onSurface.withValues(alpha: 0.38),
              padding: const EdgeInsets.all(12),
            ),
          ),
        ],
      ),
    );
  }
}
