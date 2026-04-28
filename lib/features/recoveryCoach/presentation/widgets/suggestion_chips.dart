import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/recovery_coach_cubit.dart';

class SuggestionChips extends StatelessWidget {
  const SuggestionChips({super.key});

  static const List<String> _chips = [
    "What exercises help knee pain?",
    "Explain ACL recovery phases",
    "Tips for faster recovery",
    "How often should I exercise?",
    "Best stretches before sleep",
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "What would you like help with?",
              style: TextStyle(color: colors.onSurfaceVariant, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: _chips
                  .map(
                    (label) => ActionChip(
                      label: Text(label),
                      labelStyle: TextStyle(
                        color: colors.primary,
                        fontSize: 13,
                      ),
                      backgroundColor: Theme.of(context).cardColor,
                      side: BorderSide(color: colors.primary),
                      shape: const StadiumBorder(),
                      onPressed: () => context
                          .read<RecoveryCoachCubit>()
                          .sendMessage(label),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
