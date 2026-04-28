import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/features/recoveryCoach/presentation/widgets/chat_input_field.dart';
import 'package:k_rehab/features/recoveryCoach/presentation/widgets/chat_list_view.dart';
import '../manager/recovery_coach_cubit.dart';

class RecoveryCoachView extends StatelessWidget {
  const RecoveryCoachView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (_) => getIt<RecoveryCoachCubit>(),
      child: Scaffold(
        backgroundColor: colors.surface,
        appBar: AppBar(
          title: Text(
            "Recovery Coach",
            style: TextStyle(color: colors.onSurface),
          ),
          backgroundColor: colors.surface,
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.refresh_rounded),
                  color: colors.primary,
                  onPressed: () =>
                      context.read<RecoveryCoachCubit>().clearChat(),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: const [
            Expanded(child: ChatListView()),
            ChatInputField(),
          ],
        ),
      ),
    );
  }
}
