import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/protocols/data/models/dummy_protocol.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/protocol_stat_item.dart';

class ProtocolCardContent extends StatelessWidget {
  const ProtocolCardContent({
    super.key,
    required this.protocol,
  });

  final DummyProtocol protocol;

  @override
  Widget build(BuildContext context) {
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
            ),
          ),
          const SizedBox(height: 20),
          // Stats Row
          Row(
            children: [
              ProtocolStatItem(
                icon: Icons.calendar_today_rounded,
                text: protocol.duration,
              ),
              const SizedBox(width: 24),
              ProtocolStatItem(
                icon: Icons.fitness_center_rounded,
                text: protocol.sessions,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
