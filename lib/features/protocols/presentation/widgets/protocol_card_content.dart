import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_cubit.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_state.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/protocol_stat_item.dart';

class ProtocolCardContent extends StatelessWidget {
  const ProtocolCardContent({super.key, required this.protocol});

  final ProtocolModel protocol;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            protocol.subtitle,
            style: AppTextStyles.cardSubtitle.copyWith(
              height: 1.5,
              fontSize: 14,
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: ProtocolStatItem(
                        icon: Icons.calendar_today_rounded,
                        text: protocol.duration,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      child: ProtocolStatItem(
                        icon: Icons.fitness_center_rounded,
                        text: protocol.sessions,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  final isSubscribed = state is ProfileSuccess && state.user.isSubscribed;
                  
                  String accessText;
                  Color textColor;
                  if (protocol.isFree) {
                    accessText = 'Free';
                    textColor = colors.primary;
                  } else if (isSubscribed) {
                    accessText = 'Unlocked';
                    textColor = Colors.green;
                  } else {
                    accessText = 'Paid';
                    textColor = Colors.amber;
                  }

                  return Text(
                    accessText,
                    style: AppTextStyles.cardTitle.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
