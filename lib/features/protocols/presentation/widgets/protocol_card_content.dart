import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/protocol_stat_item.dart';

class ProtocolCardContent extends StatelessWidget {
  const ProtocolCardContent({super.key, required this.protocol});

  final ProtocolModel protocol;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
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
              color: colors.textSecondary,
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
              Text(
                protocol.isFree ? 'Free' : 'Paid',
                style: AppTextStyles.cardTitle.copyWith(
                  color: protocol.isFree ? colors.primary : Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
